package com.csf.web.filter;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by changqi.wu on 17-8-26.
 */
@Configuration
public class WebApplicationFilter extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(new SessionFilter()).addPathPatterns("/**");
        registry.addInterceptor(new EncodingFilter()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}
