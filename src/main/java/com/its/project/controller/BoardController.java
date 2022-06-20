package com.its.project.controller;

import com.its.project.dto.BoardDTO;
import com.its.project.dto.CommentDTO;
import com.its.project.dto.PageDTO;
import com.its.project.dto.RecommendDTO;
import com.its.project.service.BoardService;
import com.its.project.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;


    //게시물 작성화면 요청
    @GetMapping("/postForm")
    private String postForm() {
        return "/board/post";
    }

    // 게시물 작성
    @PostMapping("/board/post")
    private String post(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.post(boardDTO);
        return "/index";
    }

    // 페이징리스트
    @GetMapping("/board/paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "/board/list";
    }

    @GetMapping("/board/detail")
    public String detail(@RequestParam("id") Long id
            , Model model
            , @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findBoard(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        List<CommentDTO> commentDTOList = commentService.findAllCom(id);
        model.addAttribute("commentList", commentDTOList);
        return "/board/detail";

    }


    // 검색
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType, @RequestParam("q") String q, Model model) {
        List<BoardDTO> searchList = boardService.search(searchType, q);
        model.addAttribute("boardList", searchList);
        return "/board/list";
    }

    // 게시물 삭제
    @GetMapping("/board/delete")
    public String delete(@RequestParam("id") Long id) {
        commentService.delete(id);
        boardService.delete(id);
        return "redirect:/board/list";
    }

    // 게시물 수정화면 요청
    @GetMapping("/updateBoard")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findBoard(id);
        model.addAttribute("boardUpdate", boardDTO);
        return "/board/update";
    }

    // 게시물 수정
    @PostMapping("/board/update")
    public String update(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.update(boardDTO);
        return "redirect:/board/detail?id=" + boardDTO.getId();
    }

    @PostMapping("/board/recommend")
    public ResponseEntity recommend(@RequestParam(value = "bId") Long bId
        , @RequestParam(value = "mId") Long mId) {

        Boolean response = boardService.recommend(bId, mId);

        return new ResponseEntity(response, HttpStatus.OK);
    }





}
