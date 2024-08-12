package com.guiyi.starseaoj.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 权限校验
 */
@Target(ElementType.METHOD) // 注解作用于方法上
@Retention(RetentionPolicy.RUNTIME) // 注解在运行时可用
public @interface AuthCheck {

    /**
     * 必须有某个角色
     * 定义一个参数 mustRole，默认值为 ""。
     */
    String mustRole() default "";

}

