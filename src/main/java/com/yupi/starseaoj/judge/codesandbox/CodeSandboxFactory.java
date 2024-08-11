package com.yupi.starseaoj.judge.codesandbox;

import com.yupi.starseaoj.judge.codesandbox.impl.ExampleCodeSandbox;
import com.yupi.starseaoj.judge.codesandbox.impl.RemoteCodeSandbox;
import com.yupi.starseaoj.judge.codesandbox.impl.ThirdPartyCodeSandbox;

/**
 * @author guiyi
 * @Date 2024/8/11 下午4:30:50
 * @ClassName com.yupi.starseaoj.judge.codesandbox.CodeSandboxFactory
 * @function --> 代码沙箱工厂（根据字符串参数创建指定的代码沙箱示例）
 */
public class CodeSandboxFactory {
    /**
     * 创建代码沙箱
     *
     * @param type
     * @return
     */
    public static CodeSandbox newInstance(String type) {
        switch (type) {
            case "example":
                return new ExampleCodeSandbox();
            case "remote":
                return new RemoteCodeSandbox();
            case "thirdParty":
                return new ThirdPartyCodeSandbox();
            default:
                return new ExampleCodeSandbox();
        }
    }
}
