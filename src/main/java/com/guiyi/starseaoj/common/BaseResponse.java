package com.guiyi.starseaoj.common;

import lombok.Data;

import java.io.Serializable;

/**
 * 通用返回类
 *
 * @param <T>
 */
@Data
public class BaseResponse<T> implements Serializable {

    // 响应状态码，通常用于表示请求的处理结果，如成功、失败等
    private int code;

    // 响应数据，泛型类型 T 可以是任何类型的数据
    private T data;

    // 响应消息，通常用于向客户端返回一些提示信息，如错误描述等
    private String message;

    /**
     * 全参构造函数
     *
     * @param code    响应状态码
     * @param data    响应数据
     * @param message 响应消息
     */
    public BaseResponse(int code, T data, String message) {
        this.code = code;
        this.data = data;
        this.message = message;
    }

    /**
     * 构造函数（无消息）
     * <p>
     * 当不需要返回消息时，可以使用此构造函数。
     * 响应消息会被默认设置为空字符串。
     *
     * @param code 响应状态码
     * @param data 响应数据
     */
    public BaseResponse(int code, T data) {
        this(code, data, "");
    }

    /**
     * 使用错误代码构造响应
     * <p>
     * 当请求处理失败时，可以使用此构造函数。
     * 响应数据为 `null`，响应消息为 `ErrorCode` 中定义的错误信息。
     *
     * @param errorCode 错误代码对象，包含了错误码和错误信息
     */
    public BaseResponse(ErrorCode errorCode) {
        this(errorCode.getCode(), null, errorCode.getMessage());
    }
}
