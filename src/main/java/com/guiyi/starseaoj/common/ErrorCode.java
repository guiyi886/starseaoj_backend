package com.guiyi.starseaoj.common;

/**
 * 自定义错误码
 * <p>
 * 该枚举类定义了系统中常见的错误码和对应的错误信息。
 * 这些错误码用于在 API 中统一返回错误状态，便于前端处理和显示。
 */
public enum ErrorCode {

    // 成功请求
    SUCCESS(0, "ok"),
    // 请求参数错误，通常是客户端发送的参数格式或内容不正确
    PARAMS_ERROR(40000, "请求参数错误"),
    // 用户未登录，尝试访问需要认证的资源时返回此错误
    NOT_LOGIN_ERROR(40100, "未登录"),
    // 用户无权限，尝试访问无权限的资源时返回此错误
    NO_AUTH_ERROR(40101, "无权限"),
    // 请求的数据不存在，通常用于资源未找到的场景
    NOT_FOUND_ERROR(40400, "请求数据不存在"),
    // 禁止访问，通常是由于用户权限不足或资源被禁止访问
    FORBIDDEN_ERROR(40300, "禁止访问"),
    // 系统内部错误，通常是服务器端发生未预期的错误
    SYSTEM_ERROR(50000, "系统内部异常"),
    // 操作失败，通常用于操作未成功但没有明确的错误类别
    OPERATION_ERROR(50001, "操作失败");

    /**
     * 状态码
     * <p>
     * 每个错误类型都有一个唯一的状态码，用于标识错误类型。
     */
    private final int code;

    /**
     * 错误信息
     * <p>
     * 与状态码对应的人类可读的信息，用于描述错误。
     */
    private final String message;

    /**
     * 枚举构造函数
     *
     * @param code    状态码
     * @param message 错误信息
     */
    ErrorCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

}
