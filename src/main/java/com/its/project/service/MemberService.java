package com.its.project.service;

import com.its.project.dto.MemberDTO;
import com.its.project.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    public boolean register(MemberDTO memberDTO) {
        int registerResult = memberRepository.register(memberDTO);
        if (registerResult > 0) {
            return true;
        } else {
            return false;
        }


    }


    public String idCheck(String memberId) {
        String idCheckResult = memberRepository.idCheck(memberId);
        if (idCheckResult == null) {
            return "ok";
        } else {
            return "no";
        }

    }


    public String nameCheck(String memberName) {
        String nameCheckResult = memberRepository.nameCheck(memberName);
        if (nameCheckResult == null) {
            return "ok";
        } else {
            return "no";
        }

    }


    public MemberDTO login(MemberDTO memberDTO) {
        MemberDTO memberLogin = memberRepository.login(memberDTO);
        return memberLogin;

    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);

    }

    public boolean update(MemberDTO memberDTO) {
        int updateResult = memberRepository.update(memberDTO);
        if (updateResult > 0) {
            return true;
        } else {
            return false;
        }


    }


    public List<MemberDTO> findAll() {
        return memberRepository.findAll();

    }

    public void delete(Long id) {
        memberRepository.delete(id);

    }


}
