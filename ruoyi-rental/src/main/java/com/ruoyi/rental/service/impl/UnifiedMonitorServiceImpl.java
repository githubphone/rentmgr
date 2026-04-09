package com.ruoyi.rental.service.impl;

import java.nio.charset.StandardCharsets;
import java.security.KeyManagementException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.rental.domain.RentalDevice;
import com.ruoyi.rental.service.IUnifiedMonitorService;
import com.ruoyi.rental.service.IRentalDeviceService;

@Service
public class UnifiedMonitorServiceImpl implements IUnifiedMonitorService
{
    private static final Logger log = LoggerFactory.getLogger(UnifiedMonitorServiceImpl.class);

    @Value("${monitor.base-url:}")
    private String baseUrl;

    @Value("${monitor.username:}")
    private String username;

    @Value("${monitor.password:}")
    private String password;

    @Value("${monitor.report-url:}")
    private String reportUrl;

    @Value("${monitor.push-base-url:}")
    private String pushBaseUrl;

    private String nonce;
    private String opaque;
    private String realm;
    private String qop;

    @Autowired
    private IRentalDeviceService deviceService;

    private RestTemplate createInsecureRestTemplate()
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

            HostnameVerifier allHostsValid = (hostname, session) -> true;

            HttpsURLConnection.setDefaultSSLSocketFactory(sslContext.getSocketFactory());
            HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);

            SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
            factory.setConnectTimeout(10000);
            factory.setReadTimeout(10000);

            return new RestTemplate(factory);
        }
        catch (Exception e)
        {
            log.error("创建SSL RestTemplate失败", e);
            return new RestTemplate();
        }
    }

    @Override
    public Map<String, Object> syncCamerasFromPlatform()
    {
        Map<String, Object> result = new HashMap<>();

        if (baseUrl == null || baseUrl.isEmpty() || username == null || username.isEmpty() || password == null || password.isEmpty())
        {
            result.put("success", false);
            result.put("message", "监控平台配置不完整，请检查配置项 monitor.base-url, monitor.username, monitor.password");
            result.put("total", 0);
            result.put("synced", 0);
            result.put("failed", 0);
            return result;
        }

        List<Map<String, Object>> cameras = fetchCameraListFromPlatform();
        result.put("total", cameras.size());

        int successCount = 0;
        int failedCount = 0;

        for (Map<String, Object> camera : cameras)
        {
            try
            {
                RentalDevice device = new RentalDevice();
                device.setDeviceCode((String) camera.get("cameraId"));
                device.setDeviceName((String) camera.get("groupName"));
                device.setDeviceType("camera");
                device.setLocation((String) camera.get("cameraName"));
                device.setIpAddress((String) camera.get("devId"));
                String status = "在线".equals(camera.get("status")) ? "1" : "0";
                device.setStatus(status);

                RentalDevice existing = deviceService.selectDeviceByCode(device.getDeviceCode());
                if (existing != null)
                {
                    device.setId(existing.getId());
                    deviceService.updateDevice(device);
                }
                else
                {
                    deviceService.insertDevice(device);
                }
                successCount++;
            }
            catch (Exception e)
            {
                log.error("同步摄像头失败: {}", camera, e);
                failedCount++;
            }
        }

        result.put("success", true);
        result.put("message", String.format("同步完成，成功: %d，失败: %d", successCount, failedCount));
        result.put("synced", successCount);
        result.put("failed", failedCount);
        return result;
    }

    private List<Map<String, Object>> fetchCameraListFromPlatform()
    {
        List<Map<String, Object>> cameras = new ArrayList<>();
        try
        {
            RestTemplate restTemplate = createInsecureRestTemplate();
            String path = "/uas/v1/api/dev/list";
            String url = baseUrl + path;

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            HttpEntity<String> entity = new HttpEntity<>("{}", headers);

            try
            {
                restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
            }
            catch (HttpClientErrorException.Unauthorized e)
            {
                String authHeader = e.getResponseHeaders().getFirst("WWW-Authenticate");
                if (authHeader != null && authHeader.startsWith("Digest "))
                {
                    parseAuthenticateHeader(authHeader);
                    headers.set("Authorization", buildDigestAuth("POST", path));
                    entity = new HttpEntity<>("{}", headers);
                    ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
                    if (response.getStatusCode().value() == 200)
                    {
                        cameras = parseCameraResponse(response.getBody());
                    }
                }
            }
        }
        catch (Exception e)
        {
            log.error("请求监控平台失败", e);
        }
        return cameras;
    }

    private void parseAuthenticateHeader(String header)
    {
        String content = header.substring(7);
        String[] parts = content.split(",");
        for (String part : parts)
        {
            String[] keyVal = part.split("=", 2);
            if (keyVal.length == 2)
            {
                String key = keyVal[0].trim();
                String val = keyVal[1].trim().replace("\"", "");
                switch (key)
                {
                    case "nonce":
                        nonce = val;
                        break;
                    case "opaque":
                        opaque = val;
                        break;
                    case "realm":
                        realm = val;
                        break;
                    case "qop":
                        qop = val;
                        break;
                }
            }
        }
    }

    private String buildDigestAuth(String method, String uri)
    {
        String nc = "00000001";
        String cnonce = generateCnonce();

        String a1 = username + ":" + realm + ":" + password;
        String ha1 = md5(a1);

        String a2 = method + ":" + uri;
        String ha2 = md5(a2);

        String response;
        if ("auth".equals(qop))
        {
            response = md5(ha1 + ":" + nonce + ":" + nc + ":" + cnonce + ":" + qop + ":" + ha2);
        }
        else
        {
            response = md5(ha1 + ":" + nonce + ":" + ha2);
        }

        return String.format(
            "Digest username=\"%s\", realm=\"%s\", nonce=\"%s\", uri=\"%s\", qop=%s, nc=%s, cnonce=\"%s\", response=\"%s\", opaque=\"%s\"",
            username, realm, nonce, uri, qop, nc, cnonce, response, opaque
        );
    }

    private String generateCnonce()
    {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[16];
        random.nextBytes(bytes);
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes)
        {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    private String md5(String input)
    {
        try
        {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(input.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : hash)
            {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        }
        catch (Exception e)
        {
            return "";
        }
    }

    @SuppressWarnings("unchecked")
    private List<Map<String, Object>> parseCameraResponse(String jsonStr)
    {
        List<Map<String, Object>> cameras = new ArrayList<>();
        if (jsonStr == null || jsonStr.isEmpty())
        {
            return cameras;
        }
        try
        {
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> data = mapper.readValue(jsonStr, Map.class);

            String resultCode = String.valueOf(data.get("resultCode"));
            if (!"0".equals(resultCode) && !"SUCCESS".equals(resultCode))
            {
                log.warn("监控平台返回错误: {}", data.get("resultDesc"));
                return cameras;
            }

            List<Map<String, Object>> groupList = (List<Map<String, Object>>) data.get("groupList");
            Map<String, String> groupMap = new HashMap<>();
            if (groupList != null)
            {
                for (Map<String, Object> group : groupList)
                {
                    groupMap.put(String.valueOf(group.get("groupId")), String.valueOf(group.get("groupName")));
                }
            }

            List<Map<String, Object>> devList = (List<Map<String, Object>>) data.get("devList");
            if (devList != null)
            {
                for (Map<String, Object> dev : devList)
                {
                    String devId = String.valueOf(dev.get("devId"));
                    String devName = String.valueOf(dev.get("devName"));
                    List<Map<String, Object>> cameraList = (List<Map<String, Object>>) dev.get("cameraList");

                    if (cameraList != null)
                    {
                        for (Map<String, Object> camera : cameraList)
                        {
                            Map<String, Object> cam = new HashMap<>();
                            cam.put("cameraId", camera.get("cameraId"));
                            cam.put("cameraName", camera.get("cameraName"));
                            cam.put("status", "1".equals(String.valueOf(camera.get("status"))) ? "在线" : "离线");
                            cam.put("groupId", camera.get("groupId"));
                            cam.put("groupName", groupMap.getOrDefault(String.valueOf(camera.get("groupId")), "未知"));
                            cam.put("devId", devId);
                            cam.put("devName", devName);
                            cam.put("ptzType", parsePtzType(String.valueOf(camera.get("ptzType"))));
                            cameras.add(cam);
                        }
                    }
                }
            }
        }
        catch (Exception e)
        {
            log.error("解析摄像头响应失败", e);
        }
        return cameras;
    }

    private String parsePtzType(String ptzType)
    {
        Map<String, String> mapping = new HashMap<>();
        mapping.put("1", "固定枪机");
        mapping.put("2", "有云台枪机");
        mapping.put("3", "球机");
        return mapping.getOrDefault(ptzType, "未知");
    }

    @Override
    public Map<String, Object> subscribeAlarm(String deviceId, String reportUrl)
    {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        log.info("开始告警订阅, deviceId={}, pushBaseUrl={}", deviceId, pushBaseUrl);
        try
        {
            RestTemplate restTemplate = createInsecureRestTemplate();
            String path = "/uas/v1/api/alarm/subscribe";
            String url = baseUrl + path;
            log.info("订阅URL: {}", url);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String actualReportUrl = (reportUrl != null && !reportUrl.isEmpty()) ? reportUrl : (pushBaseUrl + "/rental/alarm/push");
            log.info("实际reportUrl: {}", actualReportUrl);

            Map<String, Object> body = new HashMap<>();
            body.put("reportUrl", actualReportUrl);
            if (deviceId != null && !deviceId.isEmpty())
            {
                body.put("cameraIdList", new String[]{deviceId});
            }
            log.info("请求体: {}", body);

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

            try
            {
                ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
                log.info("首次请求响应状态: {}", response.getStatusCode());
                if (response.getStatusCode().value() == 200)
                {
                    result.put("success", true);
                    result.put("message", "告警订阅成功(无需认证)");
                }
                else
                {
                    result.put("message", "告警订阅失败: " + response.getBody());
                }
            }
            catch (HttpClientErrorException.Unauthorized e)
            {
                log.info("收到401挑战，开始Digest认证");
                String authHeader = e.getResponseHeaders().getFirst("WWW-Authenticate");
                log.info("WWW-Authenticate: {}", authHeader);
                if (authHeader != null && authHeader.startsWith("Digest "))
                {
                    parseAuthenticateHeader(authHeader);
                    headers.set("Authorization", buildDigestAuth("POST", path));
                    entity = new HttpEntity<>(body, headers);
                    ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
                    log.info("认证后响应状态: {}", response.getStatusCode());
                    if (response.getStatusCode().value() == 200)
                    {
                        result.put("success", true);
                        result.put("message", "告警订阅成功");
                    }
                    else
                    {
                        result.put("message", "告警订阅失败: " + response.getBody());
                    }
                }
                else
                {
                    result.put("message", "告警订阅失败: 不是Digest认证");
                }
            }
            catch (Exception e)
            {
                log.error("订阅告警请求异常: ", e);
                result.put("message", "订阅告警异常: " + e.getMessage());
            }
        }
        catch (Exception e)
        {
            log.error("订阅告警失败: ", e);
            result.put("message", "订阅告警失败: " + e.getMessage());
        }
        log.info("告警订阅最终结果: {}", result);
        return result;
    }

    @Override
    public Map<String, Object> unsubscribeAlarm()
    {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        try
        {
            RestTemplate restTemplate = createInsecureRestTemplate();
            String path = "/uas/v1/api/alarm/subscribe/cancel";
            String url = baseUrl + path;

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            HttpEntity<String> entity = new HttpEntity<>("{}", headers);

            try
            {
                restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
            }
            catch (HttpClientErrorException.Unauthorized e)
            {
                String authHeader = e.getResponseHeaders().getFirst("WWW-Authenticate");
                if (authHeader != null && authHeader.startsWith("Digest "))
                {
                    parseAuthenticateHeader(authHeader);
                    headers.set("Authorization", buildDigestAuth("POST", path));
                    entity = new HttpEntity<>("{}", headers);
                    ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
                    if (response.getStatusCode().value() == 200)
                    {
                        result.put("success", true);
                        result.put("message", "取消告警订阅成功");
                    }
                    else
                    {
                        result.put("message", "取消告警订阅失败: " + response.getBody());
                    }
                }
                else
                {
                    result.put("message", "取消告警订阅失败: 无法获取认证信息");
                }
            }
        }
        catch (Exception e)
        {
            log.error("取消告警订阅失败", e);
            result.put("message", "取消告警订阅失败: " + e.getMessage());
        }
        return result;
    }

    @Override
    public Map<String, Object> subscribeMetadata(String deviceId, String reportUrl)
    {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        log.info("开始元数据订阅, deviceId={}, pushBaseUrl={}", deviceId, pushBaseUrl);
        try
        {
            RestTemplate restTemplate = createInsecureRestTemplate();
            String path = "/vir/v1/api/vir/metadata/subscribe";
            String url = baseUrl + path;
            log.info("订阅URL: {}", url);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String actualReportUrl = (reportUrl != null && !reportUrl.isEmpty()) ? reportUrl : (pushBaseUrl + "/rental/metadata/push");
            log.info("实际reportUrl: {}", actualReportUrl);

            Map<String, Object> body = new HashMap<>();
            body.put("deviceId", deviceId);
            Map<String, Object> reportInfo = new HashMap<>();
            reportInfo.put("reportType", 1);
            reportInfo.put("reportUrl", actualReportUrl);
            body.put("reportInfo", reportInfo);
            log.info("请求体: {}", body);

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

            try
            {
                ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
                log.info("首次请求响应状态: {}", response.getStatusCode());
                if (response.getStatusCode().value() == 200)
                {
                    result.put("success", true);
                    result.put("message", "元数据订阅成功(无需认证)");
                }
                else
                {
                    result.put("message", "元数据订阅失败: " + response.getBody());
                }
            }
            catch (HttpClientErrorException.Unauthorized e)
            {
                log.info("收到401挑战，开始Digest认证");
                String authHeader = e.getResponseHeaders().getFirst("WWW-Authenticate");
                log.info("WWW-Authenticate: {}", authHeader);
                if (authHeader != null && authHeader.startsWith("Digest "))
                {
                    parseAuthenticateHeader(authHeader);
                    headers.set("Authorization", buildDigestAuth("POST", path));
                    entity = new HttpEntity<>(body, headers);
                    ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
                    log.info("认证后响应状态: {}", response.getStatusCode());
                    if (response.getStatusCode().value() == 200)
                    {
                        result.put("success", true);
                        result.put("message", "元数据订阅成功");
                    }
                    else
                    {
                        result.put("message", "元数据订阅失败: " + response.getBody());
                    }
                }
                else
                {
                    result.put("message", "元数据订阅失败: 不是Digest认证");
                }
            }
            catch (Exception e)
            {
                log.error("订阅元数据请求异常: ", e);
                result.put("message", "订阅元数据异常: " + e.getMessage());
            }
        }
        catch (Exception e)
        {
            log.error("订阅元数据失败: ", e);
            result.put("message", "订阅元数据失败: " + e.getMessage());
        }
        log.info("元数据订阅最终结果: {}", result);
        return result;
    }

    @Override
    public Map<String, Object> unsubscribeMetadata(String deviceId)
    {
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        log.info("开始取消元数据订阅, deviceId={}", deviceId);
        try
        {
            RestTemplate restTemplate = createInsecureRestTemplate();
            String path = "/vir/v1/api/vir/metadata/unsubscribe";
            String url = baseUrl + path;
            log.info("取消订阅URL: {}", url);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            Map<String, Object> body = new HashMap<>();
            body.put("deviceId", deviceId);
            log.info("请求体: {}", body);

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

            try
            {
                ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
                log.info("首次请求响应状态: {}", response.getStatusCode());
                if (response.getStatusCode().value() == 200)
                {
                    result.put("success", true);
                    result.put("message", "取消元数据订阅成功(无需认证)");
                }
                else
                {
                    result.put("message", "取消元数据订阅失败: " + response.getBody());
                }
            }
            catch (HttpClientErrorException.Unauthorized e)
            {
                log.info("收到401挑战，开始Digest认证");
                String authHeader = e.getResponseHeaders().getFirst("WWW-Authenticate");
                log.info("WWW-Authenticate: {}", authHeader);
                if (authHeader != null && authHeader.startsWith("Digest "))
                {
                    parseAuthenticateHeader(authHeader);
                    headers.set("Authorization", buildDigestAuth("POST", path));
                    entity = new HttpEntity<>(body, headers);
                    ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
                    log.info("认证后响应状态: {}", response.getStatusCode());
                    if (response.getStatusCode().value() == 200)
                    {
                        result.put("success", true);
                        result.put("message", "取消元数据订阅成功");
                    }
                    else
                    {
                        result.put("message", "取消元数据订阅失败: " + response.getBody());
                    }
                }
                else
                {
                    result.put("message", "取消元数据订阅失败: 不是Digest认证");
                }
            }
            catch (Exception e)
            {
                log.error("取消元数据订阅请求异常: ", e);
                result.put("message", "取消元数据订阅异常: " + e.getMessage());
            }
        }
        catch (Exception e)
        {
            log.error("取消元数据订阅失败: ", e);
            result.put("message", "取消元数据订阅失败: " + e.getMessage());
        }
        log.info("取消元数据订阅最终结果: {}", result);
        return result;
    }
}