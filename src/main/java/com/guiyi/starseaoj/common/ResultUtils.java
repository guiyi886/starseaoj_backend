package com.guiyi.starseaoj.common;

/**
 * 返回工具类
 * <p>
 * 该类提供了几个静态方法用于生成统一格式的 API 响应。
 * 通过这些方法可以快速创建成功或失败的响应对象，确保前后端交互的一致性。
 */
public class ResultUtils {

    /**
     * 成功响应
     * <p>
     * 使用此方法创建成功的响应对象，包含成功的状态码、数据和默认的成功消息。
     *
     * @param data 响应的数据，类型为泛型 T
     * @param <T>  数据的类型
     * @return 包含成功状态码、数据和消息的 BaseResponse 对象
     */
    public static <T> BaseResponse<T> success(T data) {
        return new BaseResponse<>(0, data, "ok");
    }

    /**
     * 失败响应
     * <p>
     * 使用此方法创建失败的响应对象，包含错误码和默认的错误消息。
     *
     * @param errorCode 错误码枚举，包含错误码和错误信息
     * @return 包含失败状态码和错误消息的 BaseResponse 对象
     */
    public static BaseResponse error(ErrorCode errorCode) {
        return new BaseResponse<>(errorCode);
    }

    /**
     * 失败响应
     * <p>
     * 使用此方法创建失败的响应对象，包含自定义的状态码和错误消息。
     *
     * @param code    自定义的状态码
     * @param message 自定义的错误消息
     * @return 包含自定义状态码和错误消息的 BaseResponse 对象
     */
    public static BaseResponse error(int code, String message) {
        return new BaseResponse(code, null, message);
    }

    /**
     * 失败响应
     * <p>
     * 使用此方法创建失败的响应对象，包含错误码和自定义的错误消息。
     *
     * @param errorCode 错误码枚举，包含错误码和错误信息
     * @param message   自定义的错误消息
     * @return 包含错误码、空数据和自定义错误消息的 BaseResponse 对象
     */
    public static BaseResponse error(ErrorCode errorCode, String message) {
        return new BaseResponse(errorCode.getCode(), null, message);
    }
}
