package com.example.prjjsp2.mapper;


import com.example.prjjsp2.dto.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {


    @Insert("""
                    Insert into member
                    (id,password,nick_name,description)
                    VALUES ( #{id}, #{password}, #{nickName}, #{description})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int createMember(Member member);

    @Select("""
                select *
                from member
                where id=#{id}
            """)
    Member selectId(String id);

    @Delete("""
                delete from member
                where id=#{id}
            """)
    int deleteMember(String id);

    @Select("""
                select *
                from member
                order by inserted;
            """)
    List<Member> getAllMember();
}
