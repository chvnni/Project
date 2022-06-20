package com.its.project.dto;

import lombok.Data;

@Data
public class MemberDTO {

    private Long id; // 회원번호
    private String memberId; // 회원아이디
    private String memberPassword; // 회원비밀번호
    private String memberName; // 회원닉네임
    private String memberEmail; // 회원이메일
    private String memberMobile; // 회원전화번호

}
