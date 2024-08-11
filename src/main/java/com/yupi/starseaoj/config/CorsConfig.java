package com.yupi.starseaoj.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 全局跨域配置
 * <p>
 * 该配置类用于解决前后端分离项目中的跨域问题。
 * 通过该配置，可以允许来自不同源的请求访问服务器资源，从而实现跨域请求。
 */
@Configuration
@EnableAsync
public class CorsConfig implements WebMvcConfigurer {

    /**
     * 配置跨域映射
     * <p>
     * 通过重写 `addCorsMappings` 方法，可以自定义跨域配置。
     *
     * @param registry CorsRegistry 对象，用于注册跨域映射
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        // 配置允许跨域访问的路径，/** 表示所有路径
        registry.addMapping("/**")
                // 允许跨域请求携带 Cookie。设置为 true 时，浏览器端必须明确指定请求的源（不能使用通配符 *）。
                .allowCredentials(true)
                // 允许哪些域名跨域访问，使用 allowedOriginPatterns 以支持通配符
                .allowedOriginPatterns("*")
                // 允许的 HTTP 请求方法
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                // 允许的 HTTP 请求头
                .allowedHeaders("*")
                // 暴露哪些头信息给客户端
                .exposedHeaders("*");
    }
}
