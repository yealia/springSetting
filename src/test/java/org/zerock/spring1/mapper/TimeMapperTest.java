package org.zerock.spring1.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {org.zerock.spring1.config.RootConfig.class})
@Log4j2
public class TimeMapperTest {

    @Autowired(required = false)
    TimeMapper timeMapper;

    @Test
    public void testTime(){

        log.info(timeMapper.getClass().getName());
        log.info(timeMapper.getTime());
    }

    @Test
    public void testTime2(){

        log.info(timeMapper.getClass().getName());
        log.info(timeMapper.getTime());
    }

}
