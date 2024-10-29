package com.example.prjjsp2.mapper;

import com.example.prjjsp2.dto.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {


    @Insert("""
             INSERT INTO board
            (title,content,writer)
            values    (#{title},#{content},#{writer})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int makeBoard(Board board);


    @Select("""
                select *
                from board
                where id=#{id}
            """)
    Board getById(Integer id);


    @Update("""
                    update board
                    set title=#{title},content=#{content},writer=#{writer}
                    where id =#{id}
            """)
    int updateById(Board board);

    @Select("""
                        select * 
            from board
            order by id desc
            limit #{offset},10
            """)
    List<Board> selectAll(Integer offset);

    @Delete("""
            delete from board
            where id=#{id}
            """)
    int deleteById(Integer id);

    @Select("""
                select count(*)
                from board 
            """)
    int countQuery();
}
