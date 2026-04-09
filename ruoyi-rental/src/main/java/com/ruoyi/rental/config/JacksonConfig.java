package com.ruoyi.rental.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.web.client.RestTemplate;

/**
 * Jackson 配置
 *
 * @author ruoyi
 */
@Configuration
public class JacksonConfig
{
    @Bean
    @Primary
    public ObjectMapper objectMapper()
    {
        return new ObjectMapper();
    }

    @Bean
    public RestTemplate restTemplate()
    {
        return new RestTemplate();
    }
}
