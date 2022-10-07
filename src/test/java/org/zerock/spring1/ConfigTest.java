package org.zerock.spring1;


import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.spring1.dao.TodoDAO;
import org.zerock.spring1.service.TodoService;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {org.zerock.spring1.config.RootConfig.class})
public class ConfigTest {

    @Autowired
//    ApplicationContext context;
    TodoService service;

    @Autowired
    TodoDAO todoDAO;

    @Test
    public void test1(){
        Assertions.assertNotNull(service);
        Assertions.assertNotNull(todoDAO);
//        System.out.println(todoDAO);
//        System.out.println(service);

        log.info(service);
        log.info(todoDAO);
    }

}
