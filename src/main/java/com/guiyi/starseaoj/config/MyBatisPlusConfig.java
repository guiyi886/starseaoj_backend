package com.guiyi.starseaoj.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatis Plus 配置类
 * <p>
 * 该配置类用于配置 MyBatis Plus 的相关拦截器及 Mapper 扫描路径。
 */
@Configuration
@MapperScan("com.guiyi.starseaoj.mapper")
public class MyBatisPlusConfig {

    /**
     * 配置 MyBatis Plus 拦截器
     * <p>
     * 该方法配置并返回 MybatisPlusInterceptor 拦截器实例，主要用于分页处理。
     *
     * @return MybatisPlusInterceptor 实例
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        // 创建 MybatisPlusInterceptor 拦截器实例
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        // 添加分页拦截器，指定数据库类型为 MySQL
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        // 返回配置好的拦截器实例
        return interceptor;
    }
}
