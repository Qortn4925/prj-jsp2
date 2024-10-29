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
        int maxPage = paging / 10 + 1;
        Integer end = ((page - 1) / 10 + 1) * 10;
        Integer begin = end - 9;
        Integer offset = ((page - 1) * 10 + 1);

        Integer prevPageNumber = begin - 1;
        Integer nextPageNumber = end + 1;

        boolean hasPrev = prevPageNumber > 0;
        boolean hasNext = nextPageNumber < maxPage;

        Map<String, Object> pageInfo = new HashMap<>();
        // 다음버튼이 없을때 > 즉 마지막 페이징 분할
        if (!hasNext) {
            pageInfo.put("end", maxPage);
        } else {
            pageInfo.put("end", end);
        }

        List<Board> boardList = mapper.selectAll(offset);

        pageInfo.put("hasPrev", hasPrev);
        pageInfo.put("hasNext", hasNext);
        pageInfo.put("prevPageNumber", prevPageNumber);
        pageInfo.put("nextPageNumber", nextPageNumber);

        pageInfo.put("begin", begin);
        pageInfo.put("paging", paging);
        pageInfo.put("boardList", boardList);
        return pageInfo;
    }

    public void delteById(Integer id) {
        mapper.deleteById(id);

    }
}
