package com.ruoyi.web.controller.tool;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "SQL工具管理")
@RestController
@RequestMapping("/tool/sql")
public class SqlToolController extends com.ruoyi.common.core.controller.BaseController {

    private static final Logger log = LoggerFactory.getLogger(SqlToolController.class);

    @Autowired
    private DataSource dataSource;

    @Operation(summary = "执行SQL文件")
    @PostMapping("/execute")
    public AjaxResult executeSqlFile(@RequestParam("file") MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return AjaxResult.error("SQL文件不能为空");
        }

        String filename = file.getOriginalFilename();
        if (StringUtils.isEmpty(filename) || !filename.toLowerCase().endsWith(".sql")) {
            return AjaxResult.error("只支持SQL文件(.sql)");
        }

        List<String> statements = new ArrayList<>();
        List<String> errors = new ArrayList<>();
        int successCount = 0;
        int errorCount = 0;

        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8))) {
            StringBuilder sql = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("--")) {
                    continue;
                }
                sql.append(line).append(" ");
                if (line.endsWith(";")) {
                    statements.add(sql.toString());
                    sql.setLength(0);
                }
            }
            if (sql.length() > 0) {
                statements.add(sql.toString());
            }
        } catch (Exception e) {
            log.error("读取SQL文件失败", e);
            return AjaxResult.error("读取SQL文件失败: " + e.getMessage());
        }

        try (Connection conn = dataSource.getConnection();
                Statement stmt = conn.createStatement()) {
            for (String sql : statements) {
                if (StringUtils.isEmpty(sql.trim())) {
                    continue;
                }
                try {
                    stmt.execute(sql);
                    successCount++;
                    log.info("执行成功: {}", sql.substring(0, Math.min(50, sql.length())));
                } catch (Exception e) {
                    errorCount++;
                    String errorMsg = "SQL执行失败: " + e.getMessage();
                    errors.add(errorMsg);
                    log.error("执行SQL失败: {}", sql, e);
                }
            }
        } catch (Exception e) {
            log.error("数据库连接失败", e);
            return AjaxResult.error("数据库连接失败: " + e.getMessage());
        }

        AjaxResult result = AjaxResult.success();
        result.put("total", statements.size());
        result.put("success", successCount);
        result.put("error", errorCount);
        result.put("errors", errors);
        return result;
    }
}