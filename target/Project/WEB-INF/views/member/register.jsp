<%--
  Created by IntelliJ IDEA.
  User: 차니
  Date: 2022-06-04
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <style>
        * {
            margin: 0px;
            padding: 0px;
            text-decoration: none;
            font-family: sans-serif;

        }

        .joinForm {
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

        .joinForm h2 {
            text-align: center;
            margin: 30px;
        }

        .textForm {
            border-bottom: 2px solid #adadad;
            margin: 30px;
            padding: 10px 10px;
        }

        .memberId {
            width: 100%;
            border: none;
            outline: none;
            color: #636e72;
            font-size: 16px;
            height: 25px;
            background: none;
        }

        .memberPassword {
            width: 100%;
            border: none;
            outline: none;
            color: #636e72;
            font-size: 16px;
            height: 25px;
            background: none;
        }

        .memberName {
            width: 100%;
            border: none;
            outline: none;
            color: #636e72;
            font-size: 16px;
            height: 25px;
            background: none;
        }

        .memberEmail {
            width: 100%;
            border: none;
            outline: none;
            color: #636e72;
            font-size: 16px;
            height: 25px;
            background: none;
        }

        .memberMobile {
            width: 100%;
            border: none;
            outline: none;
            color: #636e72;
            font-size: 16px;
            height: 25px;
            background: none;
        }


    </style>
    <head>
        <title>Title</title>
        <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script type="text/javascript"
                src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    </head>
    <body>
        <form action="/member/register" method="post" class="joinForm">
            <h2>회원가입</h2>
            <div class="textForm">
                아이디입력: <input type="text" class="memberId" onkeydown="noSpacebar()" onblur="idCheck()" id="memberId"
                              name="memberId">
            </div>
            <span id="idDupResult"></span>
            <div class="textForm">
                비밀번호 입력: <input type="password" class="memberPassword" onkeydown="noSpacebar()" onblur="passwordCheck()"
                                id="memberPassword"
                                name="memberPassword">
            </div>
            <span id="passwordCheckResult"></span>
            <div class="textForm">
                닉네임 입력: <input type="text" class="memberName" onkeydown="noSpacebar()" onblur="nameCheck()"
                               id="memberName" name="memberName">
            </div>
            <span id="nameDupResult"></span>
            <div class="textForm">
                이메일 입력: <input type="text" class="memberEmail" onkeydown="noSpacebar()" id="memberEmail"
                               name="memberEmail">
            </div>
            <div class="textForm">
                전화번호 입력: <input type="text" class="memberMobile" onkeydown="noSpacebar()" id="memberMobile"
                                name="memberMobile">
            </div>
            <input type="submit" class="btn btn-primary" value="회원가입">
        </form>
    </body>
    <script>
        const idCheck = () => {
            // 아이디 중복확인
            const memberId = document.getElementById("memberId").value;
            const checkResult = document.getElementById("idDupResult");
            const memberIdSize = memberId.length;
            if (memberIdSize > 0) {
                $.ajax({
                    type: "post",
                    url: "id-dup-check",
                    data: {"memberId": memberId},
                    dataType: "text",
                    success: function (result) {
                        if (result == "ok") {
                            checkResult.innerHTML = "사용 가능한 아이디"
                            checkResult.style.color = "green"
                        } else {
                            checkResult.innerHTML = "이미 사용중인 아이디"
                            checkResult.style.color = "red"
                        }
                    },
                    error: function () {
                        alert("오류발생");
                    }
                });
            } else {
                checkResult.innerHTML = "필수 입력"
                checkResult.style.color = "red"
            }
        }

        const passwordCheck = () => {
            // 정규식(영대소문자,숫자,특수문자(!,@,#,$) 5~15자리
            const memberPassword = document.getElementById("memberPassword").value;
            const checkResult = document.getElementById("passwordCheckResult");
            const exp = /^[A-Z a-z \d !@#$]{5,15}$/;
            if (memberPassword.match(exp)) {
                checkResult.innerHTML = "사용할 수 있는 비밀번호입니다";
                checkResult.style.color = "green";
            } else {
                checkResult.innerHTML = "영대소문자,숫자,특수문자(!,@,#,$) 5~15자리를 사용";
                checkResult.style.color = "red";
            }
        }

        const nameCheck = () => {
            // 닉네임 중복확인
            const memberName = document.getElementById("memberName").value
            const checkResult = document.getElementById("nameDupResult")
            const memberNameSize = memberName.length;
            if (memberNameSize > 0) {
                $.ajax({
                    type: "post",
                    url: "name-dup-check",
                    data: {"memberName": memberName},
                    dataType: "text",
                    success: function (result) {
                        if (result == "ok") {
                            checkResult.innerHTML = "사용 가능한 닉네임";
                            checkResult.style.color = "green";
                        } else {
                            checkResult.innerHTML = "이미 사용중인 닉네임";
                            checkResult.style.color = "red";
                        }
                    },
                    error: function (request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            } else {
                checkResult.innerHTML = "필수 입력";
                checkResult.style.color = "red";
            }
        }

        const noSpacebar = () => {
            const kcode = event.keyCode;
            if (kcode == 32) event.returnValue = false;
        }
    </script>
</html>
