package com.ruoyi.rental.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.rental.domain.RentalAlert;
import com.ruoyi.rental.domain.RentalDevice;
import com.ruoyi.rental.domain.RentalMetadata;
import com.ruoyi.rental.domain.vo.AccessLogPushResultVO;
import com.ruoyi.rental.domain.vo.AccessLogPushVO;
import com.ruoyi.rental.domain.vo.GeocoderReqVO;
import com.ruoyi.rental.domain.vo.GeocoderRespVO;
import com.ruoyi.rental.domain.vo.HeatmapVO;
import com.ruoyi.rental.domain.vo.AlarmPushVO;
import com.ruoyi.rental.domain.vo.MetadataPushVO;
import com.ruoyi.rental.service.IRentalAccessLogService;
import com.ruoyi.rental.service.IRentalDeviceService;
import com.ruoyi.rental.service.IRentalAlertService;
import com.ruoyi.rental.service.IRentalMetadataService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 设备推送回调及地图相关接口
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/rental")
public class RentalDevicePushController
{
    private static final Logger log = LoggerFactory.getLogger(RentalDevicePushController.class);

    @Autowired
    private IRentalDeviceService deviceService;

    @Autowired
    private IRentalAccessLogService accessLogService;

    @Autowired
    private IRentalAlertService alertService;

    @Autowired
    private IRentalMetadataService metadataService;

    @Autowired
    private ObjectMapper objectMapper;

    /** 高德地图 Web API Key */
    @Value("${amap.key:}")
    private String amapKey;

    /** RestTemplate 实例（复用，避免每次创建） */
    @Autowired
    private RestTemplate restTemplate;

    /**
     * 设备通行记录推送回调
     *
     * POST /rental/push/access-log
     */
    @Anonymous
    @PostMapping("/push/access-log")
    public R<AccessLogPushResultVO> pushAccessLog(@Valid @RequestBody AccessLogPushVO pushVO)
    {
        RentalDevice device = deviceService.selectDeviceByCode(pushVO.getDeviceId());
        if (device == null)
        {
            log.warn("设备不存在: {}", pushVO.getDeviceId());
            return R.fail("设备不存在");
        }
        Long houseId = deviceService.selectHouseIdByDeviceCode(pushVO.getDeviceId());

        AccessLogPushResultVO result = accessLogService.insertAccessLogAndAlert(houseId, pushVO);

        return R.ok(result);
    }

    /**
     * 告警推送回调
     *
     * POST /rental/alarm/push
     */
    @Anonymous
    @PostMapping("/alarm/push")
    public R<Void> pushAlarm(@RequestBody AlarmPushVO pushVO)
    {
        if (pushVO == null || pushVO.getAlarmInfo() == null)
        {
            log.warn("告警推送数据为空");
            return R.fail("告警数据不能为空");
        }

        AlarmPushVO.AlarmInfo alarmInfo = pushVO.getAlarmInfo();
        log.info("收到告警推送: alarmId={}, alarmType={}, alarmCamId={}",
                alarmInfo.getAlarmId(), alarmInfo.getAlarmTypeName(), alarmInfo.getAlarmCamId());

        RentalDevice device = deviceService.selectDeviceByCode(alarmInfo.getAlarmCamId());
        if (device == null)
        {
            log.warn("告警设备不存在: {}", alarmInfo.getAlarmCamId());
            return R.fail("设备不存在");
        }

        Long houseId = deviceService.selectHouseIdByDeviceCode(alarmInfo.getAlarmCamId());
        RentalAlert alert = new RentalAlert();
        alert.setHouseId(houseId);
        alert.setAlertType(alarmInfo.getAlarmType());
        alert.setAlertLevel(alarmInfo.getAlarmLevel());
        alert.setPhotoUrl(alarmInfo.getAlarmSnapUrl());
        alert.setStatus("0");

        try
        {
            if (StringUtils.isNotEmpty(alarmInfo.getAlarmTime()))
            {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                alert.setCaptureTime(sdf.parse(alarmInfo.getAlarmTime()));
            }
        }
        catch (Exception e)
        {
            log.warn("告警时间解析失败: {}", alarmInfo.getAlarmTime());
        }

        alertService.insertAlert(alert);
        log.info("告警记录已创建: id={}", alert.getId());

        return R.ok();
    }

    /**
     * 元数据推送回调
     *
     * POST /rental/metadata/push
     */
    @Anonymous
    @PostMapping("/metadata/push")
    public R<Void> pushMetadata(@RequestBody MetadataPushVO pushVO)
    {
        if (pushVO == null || pushVO.getMetadataInfo() == null)
        {
            log.warn("元数据推送数据为空");
            return R.fail("元数据不能为空");
        }

        MetadataPushVO.MetadataInfo metadataInfo = pushVO.getMetadataInfo();
        log.info("收到元数据推送: metadataType={}, deviceId={}, createTime={}",
                metadataInfo.getMetadataType(), metadataInfo.getDeviceId(), metadataInfo.getCreateTime());

        RentalDevice device = deviceService.selectDeviceByCode(metadataInfo.getDeviceId());
        if (device == null)
        {
            log.warn("元数据设备不存在: {}", metadataInfo.getDeviceId());
            return R.fail("设备不存在");
        }

        RentalMetadata metadata = new RentalMetadata();
        metadata.setDeviceId(metadataInfo.getDeviceId());
        metadata.setMetadataType(metadataInfo.getMetadataType());

        if (metadataInfo.getMetadataContent() != null)
        {
            MetadataPushVO.MetadataContent content = metadataInfo.getMetadataContent();
            String captureUrl = content.getCaptureUrl();
            String detectUrl = content.getDetectUrl();
            if (StringUtils.isNotEmpty(captureUrl))
            {
                String localCaptureUrl = downloadAndSaveImage(captureUrl);
                if (localCaptureUrl != null)
                {
                    metadata.setCaptureUrl(localCaptureUrl);
                    log.info("抓拍图片已保存到本地: {}", localCaptureUrl);
                }
                else
                {
                    metadata.setCaptureUrl(captureUrl);
                    log.warn("抓拍图片下载失败，使用原始URL: {}", captureUrl);
                }
            }
            if (StringUtils.isNotEmpty(detectUrl))
            {
                String localDetectUrl = downloadAndSaveImage(detectUrl);
                if (localDetectUrl != null)
                {
                    metadata.setDetectUrl(localDetectUrl);
                    log.info("检测图片已保存到本地: {}", localDetectUrl);
                }
                else
                {
                    metadata.setDetectUrl(detectUrl);
                    log.warn("检测图片下载失败，使用原始URL: {}", detectUrl);
                }
            }
            metadata.setDescription(content.getDesc());
            if (content.getAttributes() != null)
            {
                try
                {
                    metadata.setAttributes(objectMapper.writeValueAsString(content.getAttributes()));
                }
                catch (Exception e)
                {
                    log.warn("属性序列化失败: {}", e.getMessage());
                }
            }
            log.info("元数据内容: captureUrl={}, detectUrl={}, desc={}",
                    metadata.getCaptureUrl(), metadata.getDetectUrl(), content.getDesc());
        }

        metadataService.insertMetadata(metadata);
        log.info("元数据记录已创建: id={}", metadata.getId());

        return R.ok();
    }

    /**
     * 下载图片并保存到本地
     *
     * @param imageUrl 原始图片URL
     * @return 保存后的本地访问路径（/profile/metadata/xxx.jpg），失败返回null
     */
    private String downloadAndSaveImage(String imageUrl)
    {
        if (StringUtils.isEmpty(imageUrl))
        {
            return null;
        }
        FileOutputStream fos = null;
        InputStream in = null;
        try
        {
            String baseDir = RuoYiConfig.getProfile() + "/metadata";
            File dir = new File(baseDir);
            if (!dir.exists())
            {
                dir.mkdirs();
            }
            String extension = getImageExtension(imageUrl);
            String fileName = System.currentTimeMillis() + "_" + (int)(Math.random() * 10000) + extension;
            String localPath = baseDir + "/" + fileName;
            File file = new File(localPath);
            URL url = new URL(imageUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            if (conn instanceof HttpsURLConnection httpsConn)
            {
                SSLContext sslContext = createInsecureSslContext();
                httpsConn.setSSLSocketFactory(sslContext.getSocketFactory());
                httpsConn.setHostnameVerifier((hostname, session) -> true);
            }
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(10000);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            int responseCode = conn.getResponseCode();
            if (responseCode != 200)
            {
                log.warn("图片下载失败，HTTP状态码: {}, URL: {}", responseCode, imageUrl);
                return null;
            }
            in = conn.getInputStream();
            fos = new FileOutputStream(file);
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1)
            {
                fos.write(buffer, 0, bytesRead);
            }
            fos.flush();
            return "/profile/metadata/" + fileName;
        }
        catch (Exception e)
        {
            log.error("下载图片异常: {}, URL: {}", e.getMessage(), imageUrl);
            return null;
        }
        finally
        {
            try
            {
                if (fos != null) fos.close();
                if (in != null) in.close();
            }
            catch (IOException e)
            {
                log.error("关闭流异常: {}", e.getMessage());
            }
        }
    }

    private SSLContext createInsecureSslContext()
    {
        try
        {
            TrustManager[] trustAllCerts = new TrustManager[]{
                new X509TrustManager()
                {
                    public X509Certificate[] getAcceptedIssuers(){ return null; }
                    public void checkClientTrusted(X509Certificate[] certs, String authType){}
                    public void checkServerTrusted(X509Certificate[] certs, String authType){}
                }
            };
            SSLContext sslContext = SSLContext.getInstance("TLS");
            sslContext.init(null, trustAllCerts, new SecureRandom());
            return sslContext;
        }
        catch (Exception e)
        {
            log.error("创建SSLContext失败", e);
            throw new RuntimeException(e);
        }
    }

    /**
     * 获取图片后缀名
     */
    private String getImageExtension(String imageUrl)
    {
        if (StringUtils.isEmpty(imageUrl))
        {
            return ".jpg";
        }
        String lowerUrl = imageUrl.toLowerCase();
        if (lowerUrl.contains(".png"))
        {
            return ".png";
        }
        else if (lowerUrl.contains(".gif"))
        {
            return ".gif";
        }
        else if (lowerUrl.contains(".bmp"))
        {
            return ".bmp";
        }
        else if (lowerUrl.contains(".webp"))
        {
            return ".webp";
        }
        return ".jpg";
    }

    /**
     * 通行热力图数据接口
     * 
     * GET /system/rental/access/heatmap
     */
    @GetMapping("/access/heatmap")
    public R<List<HeatmapVO>> getAccessHeatmap(@RequestParam("date") String date)
    {
        // 日期格式校验
        if (date == null || !date.matches("^\\d{4}-\\d{2}-\\d{2}$"))
        {
            return R.fail("日期格式错误，请使用 yyyy-MM-dd 格式");
        }

        try
        {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date parseDate = sdf.parse(date);
            // 计算当天 00:00:00 和次日 00:00:00（范围查询，避免索引失效）
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(parseDate);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            Date beginOfDay = calendar.getTime();
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            Date nextDay = calendar.getTime();

            List<Map<String, Object>> hourlyData = accessLogService.selectHourlyAccessCount(beginOfDay, nextDay);

            // 构建 0-23 小时数据，无数据的补 0
            Map<Integer, Long> hourCountMap = new HashMap<>();
            for (Map<String, Object> row : hourlyData)
            {
                Object hourObj = row.get("hour");
                Object countObj = row.get("count");
                if (hourObj != null && countObj != null)
                {
                    int hour = Integer.parseInt(hourObj.toString());
                    long count = Long.parseLong(countObj.toString());
                    hourCountMap.put(hour, count);
                }
            }

            List<HeatmapVO> result = new ArrayList<>();
            for (int h = 0; h < 24; h++)
            {
                long count = hourCountMap.containsKey(h) ? hourCountMap.get(h) : 0L;
                result.add(new HeatmapVO(h, count));
            }
            return R.ok(result);
        }
        catch (Exception e)
        {
            log.error("热力图数据查询失败", e);
            return R.fail("热力图数据查询失败");
        }
    }

    /**
     * 地理编码接口（对接高德地图 API）
     * 
     * POST /system/rental/geocoder
     */
    @PostMapping("/geocoder")
    public R<GeocoderRespVO> geocoder(@RequestBody GeocoderReqVO reqVO)
    {
        if (StringUtils.isEmpty(amapKey))
        {
            return R.fail("高德地图 API Key 未配置");
        }
        if (StringUtils.isEmpty(reqVO.getAddress()))
        {
            return R.fail("地址不能为空");
        }

        try
        {
            String addressEncoded = java.net.URLEncoder.encode(reqVO.getAddress(), "UTF-8");
            String url = "https://restapi.amap.com/v3/geocode/geo?key=" + amapKey + "&address=" + addressEncoded;

            String responseBody = restTemplate.getForEntity(url, String.class).getBody();

            JsonNode root = objectMapper.readTree(responseBody);
            // 检查高德返回状态码，status="1"表示成功
            String status = root.path("status").asText();
            if (!"1".equals(status))
            {
                String info = root.path("info").asText();
                log.warn("高德地理编码失败: status={}, info={}", status, info);
                return R.fail("地理编码失败: " + info);
            }

            JsonNode geocodes = root.path("geocodes");
            if (geocodes.isArray() && geocodes.size() > 0)
            {
                JsonNode first = geocodes.get(0);
                String location = first.path("location").asText();
                if (StringUtils.isNotEmpty(location))
                {
                    String[] parts = location.split(",");
                    if (parts.length == 2)
                    {
                        // 高德返回 location = "经度,纬度"，parts[0]=经度，parts[1]=纬度
                        BigDecimal longitude = new BigDecimal(parts[0]);
                        BigDecimal latitude = new BigDecimal(parts[1]);
                        return R.ok(new GeocoderRespVO(longitude, latitude));
                    }
                }
            }
            return R.fail("地理编码未找到结果");
        }
        catch (Exception e)
        {
            log.error("地理编码请求失败", e);
            return R.fail("地理编码请求失败");
        }
    }
}
