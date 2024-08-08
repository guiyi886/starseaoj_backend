package com.yupi.starseaoj.aop;

import com.yupi.starseaoj.annotation.AuthCheck;
import com.yupi.starseaoj.common.ErrorCode;
import com.yupi.starseaoj.exception.BusinessException;
import com.yupi.starseaoj.model.entity.User;
import com.yupi.starseaoj.model.enums.UserRoleEnum;
import com.yupi.starseaoj.service.UserService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 权限校验 AOP 切面
 * 此切面用于在方法执行前对用户进行权限检查。
 */
@Aspect // 声明一个类为 AOP 切面
@Component // 将当前类注册为 Spring 组件
public class AuthInterceptor {

    @Resource
    private UserService userService;    // 用于获取当前登录用户的服务

    /**
     * 执行拦截逻辑
     *
     * @param joinPoint 代表当前执行的连接点（即被拦截的方法）
     * @param authCheck 代表方法上的 @AuthCheck 注解
     * @return 返回方法的执行结果
     * @throws Throwable 如果方法执行过程中出现异常
     */
    @Around("@annotation(authCheck)")   // 定义一个切入点，表示带有 AuthCheck 注解的方法会触发这个切面方法。
    public Object doInterceptor(ProceedingJoinPoint joinPoint, AuthCheck authCheck) throws Throwable {
        // 获取注解中的角色信息
        String mustRole = authCheck.mustRole();

        // 获取当前请求的属性
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        // 获取当前请求
        HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();

        // 获取当前登录用户
        User loginUser = userService.getLoginUser(request);
        // 将字符串角色转换为枚举类型
        UserRoleEnum mustRoleEnum = UserRoleEnum.getEnumByValue(mustRole);
        // 如果必须的角色为空，表示不需要进行权限检查，直接放行
        if (mustRoleEnum == null) {
            return joinPoint.proceed();
        }
        // 获取当前用户的角色
        UserRoleEnum userRoleEnum = UserRoleEnum.getEnumByValue(loginUser.getUserRole());
        // 如果用户角色不存在，则抛出异常
        if (userRoleEnum == null) {
            throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
        }
        // 如果用户被封禁，则拒绝访问
        if (UserRoleEnum.BAN.equals(userRoleEnum)) {
            throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
        }
        // 是否有管理员权限
        if (UserRoleEnum.ADMIN.equals(mustRoleEnum)) {
            // 用户没有管理员权限，拒绝
            if (!UserRoleEnum.ADMIN.equals(userRoleEnum)) {
                throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
            }
        }

        // 通过权限校验，允许方法继续执行
        return joinPoint.proceed();
    }
}

