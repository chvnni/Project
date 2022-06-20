<%--
  Created by IntelliJ IDEA.
  User: channi
  Date: 2022/06/13
  Time: 8:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
        <title>Title</title>
    </head>
    <body>
        <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

        <div class="container mt-3">
            <form action="/search" method="get">
                <select name="searchType">
                    <option value="boardTitle">제목</option>
                    <option value="boardWriter">작성자</option>
                </select>
                <input type="text" name="q" placeholder="검색어입력">
                <input type="submit" value="검색">
            </form>
        </div>

        <div class="container">
            <table class="table table-striped">
                <tr>
                    <th>글번호</th>
                    <th>글제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${boardList}" var="board">
                    <tr>
                        <td>${board.id}</td>
                        <td><a href="/board/detail?id=${board.id}">"${board.boardTitle}"</td>
                        <td>${board.boardWriter}</td>
                        <td>${board.boardHits}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                            value="${board.boardCreatedDate}"></fmt:formatDate></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="container">
            <ul class="pagination justify-content-center">
                <c:choose>
                    <c:when test="${paging.page<=1}">
                        <li class="page-item disabled">
                            <a class="page-link">[이전]</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="paging?page=${paging.page-1}">[이전]</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                    <c:choose>
                        <c:when test="${i eq paging.page}">
                            <li class="page-item active">
                                <a class="page-link">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="paging?page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${paging.page>=paging.maxPage}">
                        <li class="page-item disabled">
                            <a class="page-link">[다음]</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="paging?page=${paging.page+1}">[다음]</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>

    </body>
</html>
