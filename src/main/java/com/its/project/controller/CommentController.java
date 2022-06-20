package com.its.project.controller;

import com.its.project.dto.CommentDTO;
import com.its.project.dto.MemberDTO;
import com.its.project.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    // 댓글 작성
    @PostMapping("/saveComment")
    public @ResponseBody List<CommentDTO> saveComment(@ModelAttribute CommentDTO commentDTO) {
        commentService.saveComment(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAllCom(commentDTO.getBoardId());
        return commentDTOList;


    }








}
