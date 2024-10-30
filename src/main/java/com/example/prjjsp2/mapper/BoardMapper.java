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
            
            <script>
                                              SELECT *
                                              FROM board
                                              <trim prefix="WHERE" prefixOverrides="OR">
                                                  <if test="searchTarget == 'all' or searchTarget == 'title'">
                                                      title LIKE CONCAT('%', #{keyword}, '%')
                                                  </if>
                                                  <if test="searchTarget == 'all' or searchTarget == 'content'">
                                                      OR content LIKE CONCAT('%', #{keyword}, '%')
                                                  </if>
                                                  <if test="searchTarget == 'all' or searchTarget == 'writer'">
                                                      OR writer LIKE CONCAT('%', #{keyword}, '%')
                                                  </if>
                                              </trim>
                                              ORDER BY id DESC
                                              LIMIT #{offset}, 10
            </script>
            """)
    List<Board> selectAll(Integer offset, String searchTarget, String keyword);

    @Delete("""
            delete from board
            where id=#{id}
            """)
    int deleteById(Integer id);

    @Select("""
             <script>
            
                                           SELECT COUNT(id) FROM board
                                           <trim prefix="WHERE" prefixOverrides="OR">
                                               <if test="searchTarget == 'all' or searchTarget == 'title'">
                                                   title LIKE CONCAT('%', #{keyword}, '%')
                                               </if>
                                               <if test="searchTarget == 'all' or searchTarget == 'content'">
                                                   OR content LIKE CONCAT('%', #{keyword}, '%')
                                               </if>
                                               <if test="searchTarget == 'all' or searchTarget == 'writer'">
                                                   OR writer LIKE CONCAT('%', #{keyword}, '%')
                                               </if>
                                           </trim>
                                       </script>
            """)
    int countQuery(String searchTarget, String keyword);
}
