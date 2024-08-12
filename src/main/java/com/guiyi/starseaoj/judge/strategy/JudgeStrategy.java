package com.guiyi.starseaoj.judge.strategy;

import com.guiyi.starseaoj.judge.codesandbox.model.JudgeInfo;

/**
 * @author guiyi
 * @Date 2024/8/11 下午8:09:28
 * @ClassName com.guiyi.starseaoj.judge.strategy.JudgeStrategy
 * @function --> 判题策略
 */
public interface JudgeStrategy {
    /**
     * 执行判题
     *
     * @param judgeContext
     * @return
     */
    JudgeInfo doJudge(JudgeContext judgeContext);
}
