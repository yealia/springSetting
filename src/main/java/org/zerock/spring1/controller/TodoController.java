package org.zerock.spring1.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.spring1.dto.PageRequestDTO;
import org.zerock.spring1.dto.TodoDTO;
import org.zerock.spring1.service.TodoService;

import java.util.List;

@Controller
@RequestMapping("/todo")
@Log4j2
@RequiredArgsConstructor
public class TodoController {

    private final TodoService service;

    @GetMapping("/list")
    public void list(PageRequestDTO pageRequestDTO, Model model){
        log.info("Todo List....................................");
        log.info("page:  " + pageRequestDTO);

        model.addAttribute("result", service.getList(pageRequestDTO));

    }

    @GetMapping({"/read","/modify"})
    public void read(Long tno, @ModelAttribute("reqDTO") PageRequestDTO pageRequestDTO, Model model){

        TodoDTO todoDTO = service.read(tno);

        model.addAttribute("dto", todoDTO);

    }

    @GetMapping("/register")
    public void registerGET(@ModelAttribute("pageRequestDTO") PageRequestDTO pageRequestDTO){

        log.info("register get.........");
    }

    @PostMapping("/register")
    public String registerPost(@ModelAttribute("pageRequestDTO") PageRequestDTO pageRequestDTO,TodoDTO todoDTO, RedirectAttributes rttr){

        //rttr.addAttribute("result1", "aaaa");
        //rttr.addFlashAttribute("result2", "bbbb");
        log.info(todoDTO);
        log.info(pageRequestDTO);
        service.register(todoDTO);

        rttr.addAttribute("page", pageRequestDTO.getPage());


        return "redirect:/todo/list";
    }

    @PostMapping("/remove")
    public String remove(Long tno, RedirectAttributes redirectAttributes){

        log.info("tno" + tno);

        boolean result = service.remove(tno);

        redirectAttributes.addFlashAttribute("oper", result);

        return "redirect:/todo/list";
    }

    @PostMapping("/modify")
    public String modifyPost(TodoDTO dto, PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes){

        boolean result = service.modify(dto);

        redirectAttributes.addAttribute("tno", dto.getTno());
        redirectAttributes.addAttribute("page", pageRequestDTO.getPage());
        redirectAttributes.addFlashAttribute("oper", result);

        return "redirect:/todo/read";
    }
}
