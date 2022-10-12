package org.zerock.spring1.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.spring1.dto.MemberWrapper;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * org.springframework.web.util.NestedServletException: Request processing failed; nested exception is java.lang.IllegalStateException: No primary or single unique constructor found for class [Lorg.zerock.spring1.dto.Member;
 * 배열 생성에 실패했을 때 남
 *
 *
 * INFO [org.zerock.spring1.controller.MemberController] []
 * ArrayList 로 바꿨으나 빈 배열로 리턴받음
 *
 * 한꺼뻔에 여러개의 객체를 전달받아야할 필요가 있다면 Wrapper을 사용해야 한다
 *
 *
 *
 *
 * */
@Controller
@RequestMapping("/member")
@Log4j2
public class MemberController {
    @GetMapping("/list")
    public void list(Model model){
        log.info("----------------------------------------");

    }

    @GetMapping("/addAll")
    public void addAll(){

    }

    @PostMapping("/addAll")
    public void addAllPost(MemberWrapper memberWrapper){
        log.info(memberWrapper);
    }

}
