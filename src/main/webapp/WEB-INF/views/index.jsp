<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: 오전 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
        <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="./layout/header.jsp" flush="false"></jsp:include>

        <c:if test="${sessionScope.loginMemberId eq null}">
            <a href="/registerForm">회원가입</a>
            <a href="/loginForm">로그인</a>
        </c:if>

        <c:if test="${sessionScope.loginMemberId ne null}">
            <a href="/updateMember">정보수정</a>
            <a href="/logout">로그아웃</a>
        </c:if>
        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <a href="/findAllMember">관리자</a>
        </c:if>


        <%--        <jsp:include page="layout/bottomlayout.jsp" flush="true"/>--%>
    </body>
</html>
