package com.example.prjjsp2.controller;

import com.example.prjjsp2.dto.Member;
import com.example.prjjsp2.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService service;

    @GetMapping("view")
    public void view() {
        System.out.println("view");
    }

    @GetMapping("create")
    public void create() {

    }

    @PostMapping("create")
    public String create(Member member) {
        System.out.println("member = " + member);
        service.creteMember(member);

        return "redirect:/member/create";
    }


}
