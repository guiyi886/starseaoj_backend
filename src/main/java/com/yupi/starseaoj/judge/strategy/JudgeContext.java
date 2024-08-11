package com.yupi.starseaoj.judge.strategy;

import com.yupi.starseaoj.judge.codesandbox.model.JudgeInfo;
import com.yupi.starseaoj.model.dto.question.JudgeCase;
import com.yupi.starseaoj.model.entity.Question;
import com.yupi.starseaoj.model.entity.QuestionSubmit;
import lombok.Data;

import java.util.List;

/**
 * @author guiyi
 * @Date 2024/8/11 下午11:49:50
 * @ClassName com.yupi.starseaoj.judge.strategy.JudgeContext
 * @function --> 上下文-策略参数传递
 */
@Data
public class JudgeContext {
    private JudgeInfo judgeInfo;

    private List<String> inputList;

    private List<String> outputList;

    private Question question;

    private List<JudgeCase> judgeCaseList;

    private QuestionSubmit questionSubmit;
}
