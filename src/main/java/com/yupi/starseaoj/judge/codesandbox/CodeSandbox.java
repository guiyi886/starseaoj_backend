package com.yupi.starseaoj.judge.codesandbox;

import com.yupi.starseaoj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yupi.starseaoj.judge.codesandbox.model.ExecuteCodeResponse;

/**
 * @author guiyi
 * @Date 2024/8/11 下午3:37:10
 * @ClassName com.yupi.starseaoj.judge.codesandbox.model.CodeSandbox
 * @function -->    代码沙箱接口
 */
public interface CodeSandbox {
    ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest);
}
