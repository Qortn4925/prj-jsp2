package com.example.prjjsp2.controller;

import com.example.prjjsp2.dto.Member;
import com.example.prjjsp2.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
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

    @GetMapping("login")
    public void login() {

    }

    @PostMapping("login")
    public String login(String id, String password, RedirectAttributes rttr, HttpSession session) {

        Member member = service.login(id, password);
        // id 패스워드 받아서 , 일치하는게 있는지 확인하고 , 일치하면 ,  그 아이디로 member 받아오기
        if (member == null) {
            rttr.addFlashAttribute("message", Map.of("type", "success",
                    "text", "잘못된 아이디 비밀번호를 입력하셨습니다."));
            return "redirect:/member/login";
        } else {
            session.setAttribute("loggedInMember", member);
            return "redirect:/member/list";
        }

    }

    @GetMapping("editpassword")
    public void editPassword(String id, String password, @SessionAttribute("loggedInMember") Member member, Model model) {
        boolean access = member.getPassword().equals(password);
        model.addAttribute("access", access);
        model.addAttribute("password", password);

    }

    @PostMapping("editpassword")
    public String editPassword(String updatePassword, String id, RedirectAttributes rttr) {
        if (service.changePassword(id, updatePassword)) {
            rttr.addFlashAttribute("message", Map.of("type", "success",
                    "text", "비밀번호 수정 완료"));
            return "redirect:/member/list";
        } else {
            return "redirect:/member/view";
        }
    }

    @GetMapping("logout")
    public String logout(HttpSession session, RedirectAttributes rttr) {
        session.invalidate();
        rttr.addFlashAttribute("message", Map.of
                ("type", "success", "text", "로그아웃 되었습니다.")
        );

        return "redirect:/member/login";
    }

}
