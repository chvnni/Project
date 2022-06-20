<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <style>
            form {
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

        </style>
        <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    </head>
    <body>
            <form action="/board/post" method="post" enctype="multipart/form-data">
                <h2>글작성</h2>
                <input class="form-control mb-2" type="text" id="boardTitle" name="boardTitle" placeholder="제목">
                <br>
                <input class="form-control mb-2" type="text" id="boardWriter" name="boardWriter"
                       value="${sessionScope.loginMemberName}" readonly>
                <br>
                <textarea id="boardContents" class="form-control " name="boardContents" rows="5" cols="80"
                          placeholder="내용"></textarea>
                <%--            <input class="form-control mb-2" type="text" id="boardContents" name="boardContents"
                                   placeholder="글내용"> --%><br>
                <input class="form-control mb-2" type="file" name="boardFile">
                <br>
                <input class="form-control mb-2" type="submit" value="글작성하기">
            </form>
    </body>
</html>
