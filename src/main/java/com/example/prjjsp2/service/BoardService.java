package com.example.prjjsp2.service;

import com.example.prjjsp2.dto.Board;
import com.example.prjjsp2.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper mapper;

    public void createBoard(Board board) {
        mapper.makeBoard(board);

    }

    public Board getId(Integer id) {
        return mapper.getById(id);
    }

    public void updateById(Board board) {
        mapper.updateById(board);
    }

    public Map<String, Object> selectAll(Integer page) {

        int paging = mapper.countQuery();

        Integer begin = (page / 10) * 10 + 1;
        Integer end = (page / 10 + 1) * 10;
        Integer offset = ((page - 1) * 10 + 1);
        List<Board> boardList = mapper.selectAll(offset);
        Map<String, Object> pageInfo = new HashMap<>();

        pageInfo.put("end", end);
        pageInfo.put("begin", begin);
        pageInfo.put("paging", paging);
        pageInfo.put("boardList", boardList);
        return pageInfo;
    }

    public void delteById(Integer id) {
        mapper.deleteById(id);

    }
}
