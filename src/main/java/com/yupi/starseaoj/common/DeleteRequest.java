package com.yupi.starseaoj.common;

import lombok.Data;

import java.io.Serializable;

/**
 * 删除请求
 * <p>
 * 该类用于封装删除操作的请求数据，通常在需要通过 ID 删除资源时使用。
 * 作为一个数据传输对象（DTO），它只包含必要的字段，供客户端传递到服务端。
 */
@Data
public class DeleteRequest implements Serializable {

    /**
     * 要删除的资源的唯一标识符
     * <p>
     * 使用 Long 类型可以确保支持较大的 ID 值范围。
     */
    private Long id;

    /**
     * 序列化版本 UID
     * <p>
     * 该字段用于确保在序列化和反序列化过程中，
     * 类的版本保持一致，从而避免出现反序列化失败的问题。
     * 这是 Java 序列化机制中的一个标准做法。
     */
    private static final long serialVersionUID = 1L;
}
