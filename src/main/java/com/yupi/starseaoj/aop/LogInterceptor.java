package com.yupi.starseaoj.aop;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * 请求响应日志 AOP 拦截器
 * <p>
 * 该类使用 AOP 切面技术在指定的控制器方法执行时进行拦截，记录请求和响应的详细日志信息。
 * 通过 `@Around` 注解，拦截控制器方法执行的前后，并记录方法的执行时间、请求参数、响应结果等信息。
 * 使用 `Slf4j` 提供日志记录功能，方便在控制台或文件中查看请求和响应的详细信息。
 * 主要功能包括：
 * 1. 记录每次请求的 URL、IP、请求参数等信息。
 * 2. 记录方法的执行时间。
 * 3. 为每次请求生成一个唯一的请求 ID，便于日志跟踪。
 */
@Aspect
@Component
@Slf4j
public class LogInterceptor {

    /**
     * 执行日志拦截
     * <p>
     * 该方法使用 `@Around` 注解，拦截 `com.yupi.starseaoj.controller` 包下所有控制器的所有方法。
     * 它会记录请求的 URL、IP 地址、参数以及方法执行的时间，并在方法执行结束后记录响应日志。
     *
     * @param point 连接点，代表被拦截的方法
     * @return 原方法的执行结果
     * @throws Throwable 如果方法执行过程中抛出异常，则抛出该异常
     */
    @Around("execution(* com.yupi.starseaoj.controller.*.*(..))")
    public Object doInterceptor(ProceedingJoinPoint point) throws Throwable {
        // 创建一个计时器，用于记录方法执行时间
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        // 获取当前请求的上下文信息
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpServletRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        // 生成请求唯一 ID，方便日志追踪
        String requestId = UUID.randomUUID().toString();
        // 获取请求的 URI，即请求路径
        String url = httpServletRequest.getRequestURI();
        // 获取请求参数，将参数转为字符串格式
        Object[] args = point.getArgs();
        String reqParam = "[" + StringUtils.join(args, ", ") + "]";
        // 输出请求的日志信息，包括请求 ID、路径、IP 和参数
        log.info("request start，id: {}, path: {}, ip: {}, params: {}", requestId, url,
                httpServletRequest.getRemoteHost(), reqParam);
        // 执行原始方法，即被拦截的方法
        Object result = point.proceed();
        // 停止计时
        stopWatch.stop();
        // 获取方法执行的总时间（毫秒）
        long totalTimeMillis = stopWatch.getTotalTimeMillis();
        // 输出响应的日志信息，包括请求 ID 和方法执行时间
        log.info("request end, id: {}, cost: {}ms", requestId, totalTimeMillis);
        // 返回方法的执行结果
        return result;
    }
}

