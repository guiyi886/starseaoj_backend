package com.yupi.starseaoj.judge.codesandbox.impl;

import com.yupi.starseaoj.judge.codesandbox.CodeSandbox;
import com.yupi.starseaoj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yupi.starseaoj.judge.codesandbox.model.ExecuteCodeResponse;

/**
 * @author guiyi
 * @Date 2024/8/11 下午4:04:24
 * @ClassName com.yupi.starseaoj.judge.codesandbox.impl.CodeSandboxImpl
 * @function --> 示例代码沙箱（仅为了跑通业务流程）
 */
public class ExampleCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        System.out.println("示例代码沙箱");
        return null;
    }
}
