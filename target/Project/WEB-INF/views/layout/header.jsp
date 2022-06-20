<%--
  Created by IntelliJ IDEA.
  User: channi
  Date: 2022/06/15
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
        <a href="/">Home</a> &nbsp;
        <a href="/postForm">글쓰기</a> &nbsp;
        <a href="/board/paging">글목록</a> &nbsp;
        <c:if test="${sessionScope.loginMemberId ne null}">
            <a href="/myPage">마이페이지</a>
        </c:if>


        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="/">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                        <c:if test="${sessionScope.loginMemberId eq null}">
                            <a class="nav-link" href="/registerForm">회원가입</a>
                            <a class="nav-link" href="/loginForm">로그인</a>
                        </c:if>
                        <c:if test="${sessionScope.loginMemberId ne null}">
                            <a class="nav-link" href="/postForm">글작성</a>
                            <a class="nav-link" href="/board/paging">글목록</a>
                            <a class="nav-link" href="/myDetail">마이페이지</a>
                        </c:if>



                        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
                            <a class="nav-link" href="/findAllMember">회원목록</a>
                        </c:if>

                    </div>
                </div>
            </div>
        </nav>


    </body>
</html>
