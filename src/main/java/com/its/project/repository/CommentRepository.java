package com.its.project.repository;

import com.its.project.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {

    @Autowired
    SqlSessionTemplate sql;


    public void saveComment(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);

    }

    public List<CommentDTO> findAllCom(Long boardId) {
        return sql.selectList("Comment.findAll", boardId);

    }


    public void delete(Long id) {
        sql.delete("Comment.delete", id);

    }



}
