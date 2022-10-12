package org.zerock.spring1.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.zerock.spring1.controller.converter.LocalDateConverter;

//servlet.context.xml
/**
 * servlet-context.xml 을 대신할 설정 파일
 *
 * @EnableWebMvc - 웹을 돌릴 떄 사용하는 어노테이션
 * @ComponentScan(basePackages = 패키지 스캔 경로) -
 * */

@EnableWebMvc
@ComponentScan(basePackages = "org.zerock.spring1.controller")
public class ZerockServletConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //  /res라는 경로로 들어오는 모든 것들을 처리 -> /resources/경로로 설정
        registry.addResourceHandler("/res/**").addResourceLocations("/resources/");
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new LocalDateConverter());
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {

        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        registry.viewResolver(viewResolver);
    }
}
