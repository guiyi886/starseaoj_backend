package com.guiyi.starseaoj.judge.codesandbox.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author guiyi
 * @Date 2024/8/11 下午3:44:02
 * @ClassName com.guiyi.starseaoj.judge.codesandbox.model.ExecuteCodeRequest
 * @function -->    判题机请求参数
 */
@Data
@Builder    // 构造器模式
@AllArgsConstructor
@NoArgsConstructor
public class ExecuteCodeRequest {

    private List<String> inputList;

    private String code;

    private String language;
}
