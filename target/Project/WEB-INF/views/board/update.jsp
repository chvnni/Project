<%--
  Created by IntelliJ IDEA.
  User: channi
  Date: 2022/06/15
  Time: 11:23 AM
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
    </head>
    <body>
        <form action="/update" method="post" enctype="multipart/form-data">
            <h2>글수정</h2>
            글번호: <input type="text" class="form-control" name="id" value="${boardUpdate.id}" readonly> <br>
            제목: <input type="text" class="form-control" name="boardTitle" value="${boardUpdate.boardTitle}" > <br>
            작성자: <input type="text" class="form-control" name="boardWriter" value="${boardUpdate.boardWriter}" readonly> <br>
            내용: <input type="text" class="form-control" name="boardContents" value="${boardUpdate.boardContents}" > <br>
            <input type="file" class="form-control" name="boardFile" value="${boardUpdate.boardFile}" > <br>
            <input type="submit" value="수정">
        </form>
    </body>
</html>
