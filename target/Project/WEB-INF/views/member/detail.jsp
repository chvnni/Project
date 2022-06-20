<%--
  Created by IntelliJ IDEA.
  User: channi
  Date: 2022/06/14
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <h2>회원정보</h2>
        회원번호: ${member.id} <br>
        회원아이디: ${member.memberId} <br>
        회원닉네임: ${member.memberName} <br>
        회원이메일: ${member.memberEmail} <br>
        회원연락처: ${member.memberMobile} <br>

        <button onclick="updateForm()">회원정보수정</button>
        <button onclick="withdraw()">회원탈퇴</button>
    </body>
    <script>
        const updateForm = () => {
          location.href = "/updateMember";
        }

        const withdraw = () => {
          location.href = "/withdraw"
        }
    </script>
</html>
