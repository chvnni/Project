package com.its.project.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {

    private Long id; // 댓글 고유번호
    private Long boardId; // 게시판의 고유번호
    private String commentWriter;
    private String commentContents;
    private Timestamp commentCreatedDate;


}
