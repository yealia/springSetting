package org.zerock.spring1.config;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;

/**
 * web.xml 을 대신할 설정 파일
 *
 * 내부적으로 AbstractAnnotationConfigDispatcherServletInitializer는 DispatcherServlet과 ContextLoaderListener를 생성한다.
 *     -> ContextLoaderListener는 RootApplicationContext를 생성하는 클래스
 *
 * */
//web.xml
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{RootConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{ZerockServletConfig.class};
    }

    @Override
    protected String[] getServletMappings() {

        return new String[]{"/"};
    }
//    @Override
//    protected Filter[] getServletFilters(){
//        CharacterEncodingFilter filter = new CharacterEncodingFilter();
//        filter.setEncoding("utf-8");
//        return new Filter[] {filter};
//    }

    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("utf-8");
        return new Filter[] {filter};
    }
}
