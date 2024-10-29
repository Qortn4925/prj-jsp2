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
import java.util.Map;

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
        rttr.addFlashAttribute("message", Map.of("type", "success", "text", "회원가입 완료"));

        rttr.addAttribute("id", member.getId());

        return "redirect:/member/view";
    }

    @GetMapping("list")
    public void list(Model model) {
        List<Member> memberList = service.getAllMember();
        model.addAttribute("memberList", memberList);
    }

    @PostMapping("delete")
    public String delete(String id, RedirectAttributes rttr) {
        System.out.println("id = " + id);
        service.deleteMember(id);

        rttr.addFlashAttribute("message", Map.of("type", "success", "text", "회원삭제 완료"));

        return "redirect:/member/list";
    }

    @GetMapping("update")
    public void update(String id, Model model) {
        Member member = service.selectById(id);

        model.addAttribute("member", member);
    }

    @PostMapping("update")
    public String update(String id, Member member, RedirectAttributes rttr, Model model) {
        System.out.println("member = " + member);
        service.updateMember(member);
        rttr.addFlashAttribute("message", Map.of("type", "success", "text", "회원정보 수정완료"));

        return "redirect:/member/list";

    }

}
