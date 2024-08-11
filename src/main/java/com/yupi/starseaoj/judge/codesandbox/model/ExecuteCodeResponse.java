package com.yupi.starseaoj.judge.codesandbox.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author guiyi
 * @Date 2024/8/11 下午3:44:02
 * @ClassName com.yupi.starseaoj.judge.codesandbox.model.ExecuteCodeRequest
 * @function -->    判题机响应参数
 */
@Data
@Builder    // 构造器模式
@AllArgsConstructor
@NoArgsConstructor
public class ExecuteCodeResponse {
    private List<String> outputList;

    /**
     * 接口信息
     */
    private String message;

    /**
     * 执行状态
     */
    private int status;

    /**
     * 判题信息
     */
    private JudgeInfo judgeInfo;
}
