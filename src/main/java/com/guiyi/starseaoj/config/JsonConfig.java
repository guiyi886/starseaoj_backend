package com.guiyi.starseaoj.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.springframework.boot.jackson.JsonComponent;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

/**
 * Spring MVC Json 配置
 * <p>
 * 该配置类用于自定义 Spring Boot 中 Jackson 的 JSON 序列化行为，特别是处理 Long 类型数据的精度丢失问题。
 */
@JsonComponent
public class JsonConfig {

    /**
     * 配置 Jackson 的 ObjectMapper
     * <p>
     * 该方法通过配置 ObjectMapper 对象，解决在将 Long 类型数据序列化为 JSON 时可能出现的精度丢失问题。
     *
     * @param builder Jackson2ObjectMapperBuilder，用于构建 ObjectMapper
     * @return 配置后的 ObjectMapper 实例
     */
    @Bean
    public ObjectMapper jacksonObjectMapper(Jackson2ObjectMapperBuilder builder) {
        // 使用 Jackson2ObjectMapperBuilder 创建 ObjectMapper
        ObjectMapper objectMapper = builder.createXmlMapper(false).build();
        // 创建一个自定义模块，用于注册自定义的序列化器
        SimpleModule module = new SimpleModule();
        // 将 Long 类型和 long 基本类型的序列化方式指定为 ToStringSerializer，以避免精度丢失
        module.addSerializer(Long.class, ToStringSerializer.instance);
        module.addSerializer(Long.TYPE, ToStringSerializer.instance);
        // 将自定义模块注册到 ObjectMapper 中
        objectMapper.registerModule(module);
        // 返回配置好的 ObjectMapper 实例
        return objectMapper;
    }
}
