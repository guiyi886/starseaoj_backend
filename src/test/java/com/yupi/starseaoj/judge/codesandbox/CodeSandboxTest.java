package com.guiyi.starseaoj.judge.codesandbox;

import com.guiyi.starseaoj.judge.codesandbox.impl.ExampleCodeSandbox;
import com.guiyi.starseaoj.judge.codesandbox.model.ExecuteCodeRequest;
import com.guiyi.starseaoj.judge.codesandbox.model.ExecuteCodeResponse;
import com.guiyi.starseaoj.model.enums.QuestionSubmitLanguageEnum;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

/**
 * @author guiyi
 * @Date 2024/8/11 下午4:08:55
 * @ClassName com.guiyi.starseaoj.judge.codesandbox.CodeSandboxTest
 * @function -->
 */
@SpringBootTest
class CodeSandboxTest {

    /**
     * 从配置文件中获取type，设置默认值为thirdParty
     */
    @Value("${codesandbox.type:thirdParty}")
    private String type;

    /**
     * 测试代码沙箱，使用构造器模式赋值，判断代码沙箱返回是否为空
     */
    @Test
    void executeCode() {
        CodeSandbox codeSandbox = new ExampleCodeSandbox();
        String code = "int main(){}";
        String language = QuestionSubmitLanguageEnum.JAVA.getValue();
        List<String> inputList = Arrays.asList("1 2", "3 4");
        ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                .code(code)
                .language(language)
                .inputList(inputList)
                .build();
        ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        Assertions.assertNotNull(executeCodeResponse);
    }

    /**
     * 测试静态工厂创建代码沙箱，使用构造器模式赋值，判断代码沙箱返回是否为空
     */
    @Test
    void executeCodeFactory() {
        List<String> codeSandboxTypeList = Arrays.asList("example", "remote", "thirdParty");
        for (String type : codeSandboxTypeList) {
            CodeSandbox codeSandbox = CodeSandboxFactory.newInstance(type);
            String code = "int main(){}";
            String language = QuestionSubmitLanguageEnum.JAVA.getValue();
            List<String> inputList = Arrays.asList("1 2", "3 4");
            ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                    .code(code)
                    .language(language)
                    .inputList(inputList)
                    .build();
            ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        }
    }

    /**
     * 从配置文件中获取type后使用静态工厂创建，测试代码沙箱，使用构造器模式赋值，判断代码沙箱返回是否为空
     */
    @Test
    void executeCodeSetting() {
        CodeSandbox codeSandbox = CodeSandboxFactory.newInstance(type);
        String code = "int main(){}";
        String language = QuestionSubmitLanguageEnum.JAVA.getValue();
        List<String> inputList = Arrays.asList("1 2", "3 4");
        ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                .code(code)
                .language(language)
                .inputList(inputList)
                .build();
        ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        Assertions.assertNotNull(executeCodeResponse);
    }

    /**
     * 测试代码沙箱代理类
     */
    @Test
    void executeCodeProxy() {
        CodeSandbox codeSandbox = CodeSandboxFactory.newInstance(type);
        // 使用codeSandbox创建代理类对象重新赋值给codeSandbox
        codeSandbox = new CodeSandboxProxy(codeSandbox);

        String code = "int main(){}";
        String language = QuestionSubmitLanguageEnum.JAVA.getValue();
        List<String> inputList = Arrays.asList("1 2", "3 4");
        ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                .code(code)
                .language(language)
                .inputList(inputList)
                .build();
        ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        Assertions.assertNotNull(executeCodeResponse);
    }
}
