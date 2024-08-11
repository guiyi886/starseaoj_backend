package com.yupi.starseaoj.judge;

import com.yupi.starseaoj.model.vo.QuestionSubmitVO;

/**
 * @author guiyi
 * @Date 2024/8/11 下午6:01:51
 * @ClassName com.yupi.starseaoj.judge.JudgeService
 * @function --> 判题服务
 */
public interface JudgeService {
    /**
     * 判题
     *
     * @param questionSubmitId
     * @return
     */
    QuestionSubmitVO doJudge(long questionSubmitId);
}
