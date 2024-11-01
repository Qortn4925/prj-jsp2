<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6 w-75">
            <h2> 게시글 목록 입니다</h2>

            <table class="table table-dark table-striped-columns h-50 w-100">
                <thead>
                <tr>
                    <th>게시글 번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">내용</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성시간</th>
                </tr>
                <tbody>
                <c:forEach items="${pageInfo.boardList}" var="board">
                    <tr>
                        <td>
                            <a href="/board/view?id=${board.id}"> ${board.id}</a>
                        </td>
                        <td>${board.title}</td>
                        <td>${board.content}</td>
                        <td>${board.writer}</td>
                        <td>${board.inserted}</td>
                    </tr>
                </c:forEach>
                </tbody>
                </thead>
            </table>

        </div>
    </div>
</div>
<div class="container my-3">
    <form class="row justify-content-center g-1">
        <div class="col-auto">
            <select name="searchTarget" id="select1" class="form-select">
                <option value="all">전체</option>
                <option value="title">제목</option>
                <option value="content">본문</option>
                <option value="writer">작성자</option>
            </select>
        </div>
        <div class="col-6 col-md-4 col-lg-3">
            <input type="text" class="form-control" name="keyword">
        </div>
        <div class="col-auto">
            <button class="btn btn-outline-primary h-100">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>
    </form>
</div>

<%-- 페이지네이셩  todo--%>

<div class=" d-flex justify-content-center">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:if test="${pageInfo.hasPrev}">
                <li class="page-item">
                    <c:url value="/board/list" var="pageLink1">
                        <c:param name="page" value="${pageInfo.prevPageNumber}"></c:param>
                    </c:url>
                    <a class="page-link" href="${pageLink1}">Previous</a>
                </li>
            </c:if>


            <c:forEach begin="${pageInfo.begin}" end="${pageInfo.end}" var="pageNumber">
                <c:url value="/board/list" var="pageLink">
                    <c:param name="page" value="${pageNumber}"></c:param>
                </c:url>
                <li class="page-item">
                    <a href="${pageLink}" class="page-link">${pageNumber}</a>
                </li>
            </c:forEach>


            <c:if test="${pageInfo.hasNext}">
                <li class="page-item">
                    <c:url value="/board/list" var="pageLink2">
                        <c:param name="page" value="${pageInfo.nextPageNumber}"></c:param>
                    </c:url>
                    <a class="page-link" href="${pageLink2}">Next</a>
                </li>
            </c:if>

        </ul>
    </nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
</body>
</html>
