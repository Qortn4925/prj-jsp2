package com.example.prjjsp2.service;

import com.example.prjjsp2.dto.Board;
import com.example.prjjsp2.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    public List<Board> selectAll() {
        return mapper.selectAll();
    }

    public void delteById(Integer id) {
        mapper.deleteById(id);
        
    }
}
