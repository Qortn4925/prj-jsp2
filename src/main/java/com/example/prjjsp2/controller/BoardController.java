package com.example.prjjsp2.controller;

import com.example.prjjsp2.dto.Board;
import com.example.prjjsp2.dto.Member;
import com.example.prjjsp2.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequestMapping("board")
@RequiredArgsConstructor
public class BoardController {
    private final BoardService boardService;


    @GetMapping("create")
    public void create(@SessionAttribute("loggedInMember") Member member, Model model) {
        model.addAttribute("loggedInMember", member);
        System.out.println("member.getNickName() = " + member.getNickName());

    }

    @PostMapping("create")
    public String createBoard(Board board, RedirectAttributes rttr) {
        boardService.createBoard(board);
        System.out.println("board = " + board);
        rttr.addAttribute("id", board.getId());
        rttr.addFlashAttribute("message", Map.of("type", "success", "text", "게시글 작성이 완료"));
        //id 넘기기
        return "redirect:/board/view";
    }

    // 만들고 수정, 할지 저장할지 한번 검증 하는 곳, id 를 기준으로 받아서 보여주는거임
    @GetMapping("view")
    public void viewBoard(Integer id, Model model) {
        Board board = boardService.getId(id);
        System.out.println(board);
        model.addAttribute("board", board);
    }


    //그냥 jsp 보여주는 용도
    @GetMapping("update")
    public void updateBoard(Integer id, Model model, @SessionAttribute("loggedInMember") Member member) {
//        받아서 출력
        Board board = boardService.getId(id);
        boolean access = member != null && member.getNickName().equals(board.getWriter());
        if (access) {
            model.addAttribute("auth", access);
        }
        model.addAttribute("board", board);

    }

    //수정 까진 일단 완료
    @PostMapping("update")
    public String updateBoard(Board board, RedirectAttributes rttr) {
        // 보드에서 > 모델 > 모델 >  다시 받아서
        System.out.println("board = " + board);
        boardService.updateById(board);

        rttr.addFlashAttribute("message", Map.of("type", "success", "text", "게시글 수정 완료"));
        return "redirect:/board/view?id=" + board.getId();

    }

    @PostMapping("delete")
    public String deleteBoard(Integer id, RedirectAttributes rttr) {
        System.out.println("id = " + id);
        boardService.delteById(id);
        rttr.addFlashAttribute("message", Map.of("type", "success", "text", "게시글 삭제 완료"));

        return "redirect:/board/list";
    }

    @GetMapping("list")
    public void list(Model model, @RequestParam(defaultValue = "1") Integer page,
                     @RequestParam(required = false) String searchTarget,
                     @RequestParam(defaultValue = "") String keyword
    ) {
        // 요청이 들어오면 , 쿼리에서 > board 객체를 리스트에 받아서 넣음 . model에 추가 > 출력


        // 현재 페이지에 따라서 10개씩 출력하는 것들  > integer 변수 들어가줘야함
        //
        Map<String, Object> pageInfo = boardService.selectAll(page, searchTarget, keyword);

        model.addAttribute("pageInfo", pageInfo);
    }


}
