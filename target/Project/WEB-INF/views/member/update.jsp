<%--
  Created by IntelliJ IDEA.
  User: channi
  Date: 2022/06/13
  Time: 10:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
        <style>
            * {
                margin: 0px;
                padding: 0px;
                text-decoration: none;
                font-family: sans-serif;

            }

            .upForm {
                position: absolute;
                width: 400px;
                height: 400px;
                padding: 30px, 20px;
                background-color: #FFFFFF;
                text-align: center;
                top: 40%;
                left: 50%;
                transform: translate(-50%, -50%);
                border-radius: 15px;
            }

            .updateForm h2 {
                text-align: center;
                margin: 30px;
            }

            .textForm {
                border-bottom: 2px solid #adadad;
                margin: 30px;
                padding: 10px 10px;
            }

            .updateIdNum {
                width: 100%;
                border: none;
                outline: none;
                color: #636e72;
                font-size: 16px;
                height: 25px;
                background: none;
            }

            .updateId {
                width: 100%;
                border: none;
                outline: none;
                color: #636e72;
                font-size: 16px;
                height: 25px;
                background: none;
            }

            .updatePassword {
                width: 100%;
                border: none;
                outline: none;
                color: #636e72;
                font-size: 16px;
                height: 25px;
                background: none;
            }

            .updateName {
                width: 100%;
                border: none;
                outline: none;
                color: #636e72;
                font-size: 16px;
                height: 25px;
                background: none;
            }

            .updateEmail {
                width: 100%;
                border: none;
                outline: none;
                color: #636e72;
                font-size: 16px;
                height: 25px;
                background: none;
            }

            .updateMobile {
                width: 100%;
                border: none;
                outline: none;
                color: #636e72;
                font-size: 16px;
                height: 25px;
                background: none;
            }

        </style>
        <title>Title</title>
    </head>
    <body>
        <form action="/member/update" name="updateForm" class="upForm" method="post">
            <h2>회원정보 수정</h2>
            <h4>이메일, 전화번호만 수정가능</h4>
            <div class="textForm">
                회원번호: <input type="text" class="updateIdNum" name="id" value="${updateMember.id}" readonly>
            </div>
            <div class="textForm">
                회원아이디: <input type="text" class="updateId" name="memberId" value="${updateMember.memberId}" readonly>
            </div>
            <div class="textForm">
                회원비밀번호: <input type="password" class="updatePassword" name="memberPassword" id="pwConfirm"
                               placeholder="비밀번호를 입력해주세요">
            </div>
            <div class="textForm">
                회원닉네임: <input type="text" class="updateName" name="memberName" value="${updateMember.memberName}"
                              readonly>
            </div>
            <div class="textForm">
                회원이메일: <input type="text" class="updateEmail" name="memberEmail" onkeydown="noSpacebar()" value="${updateMember.memberEmail}">
            </div>
            <div class="textForm">
                회원연락처: <input type="text" class="updateMobile" name="memberMobile" onkeydown="noSpacebar()" value="${updateMember.memberMobile}">
            </div>
            <input type="button" class="btn btn-primary" onclick="update()" value="수정">
        </form>
    </body>
    <script>

        const update = () => {
            const pwConfirm = document.getElementById("pwConfirm").value;
            const pwDB = '${updateMember.memberPassword}';
            if (pwConfirm == pwDB) {
                updateForm.submit()
            } else {
                alert("비밀번호가 다릅니다.")
            }
        }

        const noSpacebar = () => {
            const kcode = event.keyCode;
            if (kcode == 32) event.returnValue = false;
        }

    </script>
</html>
