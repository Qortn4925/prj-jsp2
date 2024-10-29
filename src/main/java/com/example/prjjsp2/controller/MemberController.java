package com.example.prjjsp2.controller;

import com.example.prjjsp2.dto.Member;
import com.example.prjjsp2.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService service;

    @GetMapping("view")
    public void view(String id, Model model) {
        model.addAttribute("member", service.selectById(id));

    }

    @GetMapping("create")
    public void create() {

    }

    @PostMapping("create")
    public String create(Member member, RedirectAttributes rttr) {
        System.out.println("member = " + member);
        service.creteMember(member);

        // 여ㅣ서  view에 , id값을 넘겨주어야 하는데 ,

        rttr.addAttribute("id", member.getId());

        return "redirect:/member/view";
    }

    @GetMapping("list")
    public void list(Model model) {
        List<Member> memberList = service.getAllMember();
        model.addAttribute("memberList", memberList);
    }

    @PostMapping("delete")
    public String delete(String id) {
        System.out.println("id = " + id);
        service.deleteMember(id);

        return "redirect:/member/list";

    }


}
