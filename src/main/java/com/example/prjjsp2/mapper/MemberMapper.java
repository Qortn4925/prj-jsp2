package com.example.prjjsp2.mapper;


import com.example.prjjsp2.dto.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {


    @Insert("""
                    Insert into member
                    (id,password,nick_name,description)
                    VALUES ( #{id}, #{password}, #{nickName}, #{description})
            """)
    int createMember(Member member);
}
