package com.its.project.service;

import com.its.project.dto.BoardDTO;
import com.its.project.dto.MemberDTO;
import com.its.project.dto.PageDTO;
import com.its.project.dto.RecommendDTO;
import com.its.project.repository.BoardRepository;
import com.its.project.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private MemberRepository memberRepository;


    public void post(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile(); // 1. DTO 객체에 담긴 파일을 꺼냄
        String boardFileName = boardFile.getOriginalFilename(); // 2. 파일의 이름을 가져옴
        boardFileName = System.currentTimeMillis() + "-" + boardFileName; // 2-1. 파일 이름 중복을 피하기 위한 조치
        boardDTO.setBoardFileName(boardFileName); // 3. 파일 이름을 DTO 객체의 boardFileName에 저장
        String savePath = "C:\\spring_img\\" + boardFileName; // 4. 파일의 저장 위치 지정
        // 5. 파일 저장처리
        if (!boardFile.isEmpty()) {
            boardFile.transferTo(new File(savePath));
        }
        boardRepository.post(boardDTO); // 6. DTO 객체 repository로 전달


    }


    private static final int PAGE_LIMIT = 5;
    private static final int BLOCK_LIMIT = 3;

    public List<BoardDTO> pagingList(int page) {
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;

    }

    public PageDTO paging(int page) {
        int boardCount = boardRepository.boardCount();
        int maxPage = (int) (Math.ceil((double) boardCount / PAGE_LIMIT));
        int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if (endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;

    }


    public List<BoardDTO> search(String searchType, String q) {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("type", searchType);
        searchParam.put("q", q);
        List<BoardDTO> searchList = boardRepository.search(searchParam);
        return searchList;

    }


    public BoardDTO findBoard(Long id) {
        boardRepository.updateHits(id);
        return boardRepository.findBoard(id);


    }




    public void update(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile(); // 1. DTO 객체에 담긴 파일을 꺼냄
        String boardFileName = boardFile.getOriginalFilename(); // 2. 파일의 이름을 가져옴
        boardFileName = System.currentTimeMillis() + "-" + boardFileName; // 2-1. 파일 이름 중복을 피하기 위한 조치
        boardDTO.setBoardFileName(boardFileName); // 3. 파일 이름을 DTO 객체의 boardFileName에 저장
        String savePath = "C:\\spring_img\\" + boardFileName; // 4. 파일의 저장 위치 지정
        // 5. 파일 저장처리
        if (!boardFile.isEmpty()) {
            boardFile.transferTo(new File(savePath));
            boardRepository.fileUpdate(boardDTO); // 6. DTO 객체 repository로 전달
        } else {
            boardRepository.noFileUpdate(boardDTO);
        }


    }


    public void delete(Long id) {
        boardRepository.delete(id);

    }


    public Boolean recommend(Long bId, Long mId) {
        Boolean response;
        RecommendDTO request = new RecommendDTO();
        request.setBId(bId);
        request.setMId(mId);

        // 내가 쓴 게시물은 추천 x
        BoardDTO boardDTO = boardRepository.findBoard(bId);
        MemberDTO memberDTO = memberRepository.findById(mId);

        if (!boardDTO.getBoardWriter().equals(memberDTO.getMemberName())) {
            // 1. 내가 추천이 되어있는지 확인 ?? select
            RecommendDTO dto = boardRepository.findRecom(request);

            if (dto == null) {
                // 2. 안되어있으면 추천 >> return true
                boardRepository.recommend(request);
                response = true;
            } else {
                // 3. 되어있다면 취소 >> return false
                boardRepository.deleteRecom(request);
                response = false;
            }
        } else {
            response = false;
        }

        return response;
    }
}
