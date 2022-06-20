package com.its.project.repository;


import com.its.project.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {

    @Autowired
    SqlSessionTemplate sql;

    public int register(MemberDTO memberDTO) {
        return sql.insert("Member.register", memberDTO);

    }

    public String idCheck(String memberId) {
        return sql.selectOne("Member.duplicateId", memberId);

    }

    public String nameCheck(String memberName) {
        return sql.selectOne("Member.duplicateName", memberName);

    }


    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);

    }


    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");

    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);

    }


    public int update(MemberDTO memberDTO) {
        return sql.update("Member.update", memberDTO);

    }


    public void delete(Long id) {
        sql.delete("Member.delete", id);

    }






}
