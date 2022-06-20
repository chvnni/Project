<%--
  Created by IntelliJ IDEA.
  User: channi
  Date: 2022/06/14
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
        <script src="/resources/js/jquery.js"></script>
        <title>Title</title>
    </head>
    <body>
        글번호 : ${board.id} <br>
        제목 : ${board.boardTitle} <br>
        작성자 : ${board.boardWriter} <br>
        내용 : ${board.boardContents} <br>
        조회수 : ${board.boardHits} <br>
        작성일자 : ${board.boardCreatedDate} <br>
        <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}" alt="" height="100" width="100">
        <br>

        <c:if test="${sessionScope.loginMemberId eq board.boardWriter}">
            <button onclick="boardUpdate()">수정</button>
            <button onclick="boardDelete()">삭제</button>
        </c:if>

        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <button onclick="boardDelete()">삭제</button>
        </c:if>

        <button onclick="paging()">글목록</button>
        <div class="container">
            <div id="comment-write" class="input-group mb-3">
                <div class="form-floating">
                    <input type="text" id="commentWriter" class="form-control" value="${sessionScope.loginMemberId}"
                           readonly>
                    <label for="commentWriter">작성자</label>
                </div>
                <div class="form-floating">
                    <input type="text" id="commentContents" class="form-control" placeholder="내용">
                    <label for="commentContents">내용</label>
                </div>
                <button id="comment-writer-btn" class="btn btn-primary">댓글작성</button>
            </div>
            <div id="comment-list">
                <table class="table-striped">
                    <tr>
                        <th>댓글번호</th>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성시간</th>
                    </tr>
                    <c:forEach items="${commentList}" var="comment">
                        <tr>
                            <td>${comment.id}</td>
                            <td>${comment.commentWriter}</td>
                            <td>${comment.commentContents}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                                value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>
        <div>
            <button type="button" id="likeBtn" onclick="likeBtn();">
                like
            </button>
        </div>

    </body>
    <script>
        $("#comment-writer-btn").click(function () {
            const commentWriter = document.getElementById("commentWriter").value;
            const commentContents = $("#commentContents").val();
            const boardId = '${board.id}';

            $.ajax({
                type: "post",
                url: "/comment/saveComment",
                data: {
                    "boardId": boardId,
                    "commentWriter": commentWriter,
                    "commentContents": commentContents,
                },
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    let output = "<table class='table'>";
                    output += "<tr><th>댓글번호</th>";
                    output += "<th>작성자</th>";
                    output += "<th>내용</th>";
                    output += "<th>작성시간</th></tr>";
                    for (let i in result) {
                        output += "<tr>";
                        output += "<td>" + result[i].id + "</td>";
                        output += "<td>" + result[i].commentWriter + "</td>";
                        output += "<td>" + result[i].commentContents + "</td>";
                        output += "<td>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                        output += "</tr>";
                    }
                    output += "</table>";
                    document.getElementById('comment-list').innerHTML = output;
                    document.getElementById('commentContents').value = '';
                },
                error: function () {
                    alert("오류");
                }
            })


        })

        const likeBtn = () => {
            const b = "${board.boardWriter}";
            const m = "${sessionScope.loginMemberName}";
            if (b != m) {
                $.ajax({
                    type: "post",
                    url: "/board/recommend",
                    data: {
                        "bId": ${board.id},
                        "mId": ${sessionScope.loginId}
                    },
                    dataType: "json",
                    success: function (result) {
                        console.log(result);
                    }
                })
            } else {
                alert("내 글에는 추천 x");
            }


        }

        const boardUpdate = () => {
            location.href = "/update?id=${board.id}"
        }

        const boardDelete = () => {
            location.href = "/delete?id=${board.id}"

        }

        const paging = () => {
            location.href = "/paging?page=${page}"
        }
    </script>
</html>
