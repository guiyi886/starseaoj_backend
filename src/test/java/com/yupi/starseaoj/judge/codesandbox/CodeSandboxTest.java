package com.yupi.starseaoj.judge.codesandbox;

import com.yupi.starseaoj.judge.codesandbox.impl.ExampleCodeSandbox;
import com.yupi.starseaoj.judge.codesandbox.model.ExecuteCodeRequest;
import com.yupi.starseaoj.judge.codesandbox.model.ExecuteCodeResponse;
import com.yupi.starseaoj.model.enums.QuestionSubmitLanguageEnum;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

/**
 * @author guiyi
 * @Date 2024/8/11 下午4:08:55
 * @ClassName com.yupi.starseaoj.judge.codesandbox.CodeSandboxTest
 * @function -->
 */
@SpringBootTest
class CodeSandboxTest {

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
}
