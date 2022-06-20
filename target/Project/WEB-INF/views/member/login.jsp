<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오후 1:19
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

            .loginForm {
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

            .loginForm h2 {
                text-align: center;
                margin: 30px;
            }

            .textForm {
                border-bottom: 2px solid #adadad;
                margin: 30px;
                padding: 10px 10px;
            }

            .loginId {
                width: 100%;
                border: none;
                outline: none;
                color: #636e72;
                font-size: 16px;
                height: 25px;
                background: none;
            }

            .loginPassword {
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
        <form action="/member/login" method="post" class="loginForm">
            <h2>로그인</h2>
            <div class="textForm">
                <input type="text" class="loginId" name="memberId" placeholder="아이디">
            </div>
            <div class="textForm">
                <input type="password" class="loginPassword" name="memberPassword" placeholder="비밀번호">
            </div>
            <input type="submit" class="btn btn-primary" value="로그인">
        </form>
    </body>


</html>
