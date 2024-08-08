package com.yupi.starseaoj.config;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;
import me.chanjar.weixin.mp.config.impl.WxMpDefaultConfigImpl;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * 微信开放平台配置类
 * <p>
 * 该配置类用于配置微信开放平台的相关服务，通过配置文件注入 appId 和 appSecret，提供获取 WxMpService 的方法。
 */
@Slf4j
@Configuration
@ConfigurationProperties(prefix = "wx.open")
@Data
public class WxOpenConfig {

    /**
     * 微信开放平台应用的 AppId
     */
    private String appId;

    /**
     * 微信开放平台应用的 AppSecret
     */
    private String appSecret;

    /**
     * WxMpService 对象，用于与微信服务器进行交互
     */
    private WxMpService wxMpService;

    /**
     * 获取 WxMpService 实例（单例模式）
     * <p>
     * 该方法通过双重检查锁定（Double-Checked Locking）的方式，确保 WxMpService 实例是线程安全的单例对象。
     * 不使用 @Bean 注解是为了避免与公众号的 WxMpService 冲突。
     *
     * @return 配置好的 WxMpService 实例
     */
    public WxMpService getWxMpService() {
        // 如果 wxMpService 已经被实例化，直接返回实例
        if (wxMpService != null) {
            return wxMpService;
        }
        // 如果 wxMpService 还未实例化，进行同步处理
        synchronized (this) {
            // 再次检查 wxMpService 是否已经实例化，避免多线程环境下的重复初始化
            if (wxMpService != null) {
                return wxMpService;
            }
            // 配置 WxMpService
            WxMpDefaultConfigImpl config = new WxMpDefaultConfigImpl();
            config.setAppId(appId);
            config.setSecret(appSecret);
            WxMpService service = new WxMpServiceImpl();
            service.setWxMpConfigStorage(config);
            // 将实例存储在 wxMpService 中，确保下次调用时可以直接返回
            wxMpService = service;
            return wxMpService;
        }
    }
}
