package com.example.prjjsp2.service;


import com.example.prjjsp2.dto.Member;
import com.example.prjjsp2.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    public void deleteMember(String id) {
        mapper.deleteMember(id);

    }

    public List<Member> getAllMember() {
        return mapper.getAllMember();
    }

    public void updateMember(Member member) {
        mapper.updateMember(member);
    }

    public Member login(String id, String password) {

        return mapper.login(id, password);
    }

    public boolean changePassword(String id, String updatePassword) {
        int cnt = mapper.changePw(id, updatePassword);
        return cnt == 1;
    }
}
