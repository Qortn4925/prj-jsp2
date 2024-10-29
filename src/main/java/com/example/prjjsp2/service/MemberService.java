package com.example.prjjsp2.service;


import com.example.prjjsp2.dto.Member;
import com.example.prjjsp2.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper mapper;

    public void creteMember(Member member) {
        mapper.createMember(member);

    }

    public Member selectById(String id) {

        return mapper.selectId(id);
    }
}
