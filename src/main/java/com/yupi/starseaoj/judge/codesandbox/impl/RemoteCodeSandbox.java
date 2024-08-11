package com.yupi.starseaoj.judge.codesandbox.impl;

import com.yupi.starseaoj.judge.codesandbox.CodeSandbox;
import com.yupi.starseaoj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yupi.starseaoj.judge.codesandbox.model.ExecuteCodeResponse;

/**
 * @author guiyi
 * @Date 2024/8/11 下午4:04:24
 * @ClassName com.yupi.starseaoj.judge.codesandbox.impl.CodeSandboxImpl
 * @function --> 远程代码沙箱（实际调用接口的沙箱）
 */
public class RemoteCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        System.out.println("远程代码沙箱");
        return null;
    }
}
