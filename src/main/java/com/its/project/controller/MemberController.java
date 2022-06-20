package com.its.project.controller;

import com.its.project.dto.MemberDTO;
import com.its.project.dto.RecommendDTO;
import com.its.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 회원가입 처리
    @GetMapping("/registerForm")
    private String registerForm() {
        return "/member/register";
    }

    // 회원가입
    @PostMapping("/member/register")
    public String register(@ModelAttribute MemberDTO memberDTO) {
        boolean registerResult = memberService.register(memberDTO);
        if (registerResult) {
            return "/member/login";
        } else {
            return "/member/register";
        }
    }

    // 아이디 중복확인
    @PostMapping("/id-dup-check")
    public @ResponseBody String idCheck(@RequestParam("memberId") String memberId) {
        String idCheckResult = memberService.idCheck(memberId);
        return idCheckResult;
    }

    // 닉네임 중복확인
    @PostMapping("/name-dup-check")
    public @ResponseBody String nameCheck(@RequestParam("memberName") String memberName) {
        String nameCheckResult = memberService.nameCheck(memberName);
        return nameCheckResult;
    }

    // 로그인 처리
    @GetMapping("/loginForm")
    private String loginForm() {
        return "/member/login";
    }

    // 로그인
    @PostMapping("/member/login")
    private String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
        MemberDTO memberLogin = memberService.login(memberDTO);
        if (memberLogin != null) {
            model.addAttribute("memberLogin", memberLogin);
            session.setAttribute("loginMemberId", memberLogin.getMemberId());
            session.setAttribute("loginId", memberLogin.getId());
            session.setAttribute("loginMemberName", memberLogin.getMemberName());
            return "/index";
        } else {
            return "/member/login";
        }
    }

    // 로그아웃
    @GetMapping("/logout")
    private String logout(HttpSession session) {
        session.invalidate();
        return "/index";
    }

    // 마이페이지
    @GetMapping("/myDetail")
    private String myDetail() {
        return "/member/myPage";
    }

    // 회원 상세조회
    @GetMapping("/member/detail")
    private String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "/member/detail";
    }


    // 회원정보 수정 요청
    @GetMapping("/updateMember")
    private String updateForm(HttpSession session, Model model) {
        Long updateId = (Long) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "/member/update";
    }

    // 회원정보 수정
    @PostMapping("/member/update")
    private String update(@ModelAttribute MemberDTO memberDTO) {
        boolean updateResult = memberService.update(memberDTO);
        if (updateResult) {
            return "redirect:/member/detail?id=" + memberDTO.getId();
        } else {
            return "/index";
        }
    }


    // 회원탈퇴
//    @PostMapping("/withdraw")
//    private String withdraw(HttpSession session) {
//
//    }


    // 관리자 기능


    // 관리자 페이지
    @GetMapping("/admin")
    private String admin() {
        return "/member/admin";
    }


    // 회원목록 보기
    @GetMapping("/findAllMember")
    private String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "/member/list";
    }

    // 회원 삭제
    @GetMapping("/member/delete")
    private String delete(@RequestParam("id") Long id, Model model) {
        memberService.delete(id);
        return "redirect:/member/list";
    }


}
