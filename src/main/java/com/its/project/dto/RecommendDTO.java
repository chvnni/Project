package com.its.project.dto;

import lombok.Data;

@Data
public class RecommendDTO {

    private Long id; // 추천번호
    private Long mId; // 회원 번호
    private Long bId; // 게시판 번호

}
