<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 10:45
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
        <div class="container">
            <table class="table table-striped">
                <tr>
                    <th>회원번호</th>
                    <th>회원아이디</th>
                    <th>회원비밀번호</th>
                    <th>회원닉네임</th>
                    <th>회원이메일</th>
                    <th>회원연락처</th>
                    <th></th>
                </tr>
                <c:forEach items="${memberList}" var="member">
                    <tr>
                        <td>${member.id}</td>
                        <td>${member.memberId}</td>
                        <td>${member.memberPassword}</td>
                        <td>${member.memberName}</td>
                        <td>${member.memberEmail}</td>
                        <td>${member.memberMobile}</td>
                        <td><a href="/member/delete?id=${member.id}">회원삭제</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
