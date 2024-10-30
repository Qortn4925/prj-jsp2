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
<c:set value="${sessionScope.loggedInMember.auth.contains('admin')}" var="isAdmin"/>

<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/board/list">CRUD 페이지 만들기</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/board/list">
                        <i class="fa-solid fa-list"></i>
                        게시판 목록
                    </a>
                </li>
                <c:if test="${not empty loggedInMember}">
                    <li class="nav-item">
                        <a class="nav-link" href="/board/create">
                            <i class="fa-solid fa-pen-to-square"></i>
                            게시판작성
                        </a>
                    </li>
                </c:if>
                <c:if test="${empty loggedInMember}">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/member/create">
                            <i class="fa-solid fa-user"></i>
                            회원가입하기
                        </a>
                    </li>
                </c:if>

                <c:if test="${(not empty loggedInMember) &&isAdmin}">
                    <li class="nav-item">
                        <a class="nav-link" href="/member/list">
                            <i class="fa-solid fa-users"></i>
                            회원목록
                        </a>
                    </li>
                </c:if>

                <c:if test="${empty loggedInMember}">
                    <li class="nav-item">
                        <a class="nav-link" href="/member/login">
                            <i class="fa-solid fa-unlock-keyhole"></i>
                            로그인
                        </a>
                    </li>
                </c:if>
                <c:if test="${not empty loggedInMember}">
                    <li class="nav-item">
                        <a href="" class="nav-link"> 회원아이디 :${loggedInMember.id}</a>
                    </li>
                </c:if>

                <c:if test="${not empty loggedInMember}">
                    <li class="nav-item">
                        <a href="/member/logout" class="nav-link"> 로그아웃 :${loggedInMember.id}</a>
                    </li>
                </c:if>
            </ul>

        </div>
    </div>
</nav>

<%-- 메세지--%>
<c:if test="${not empty message}">
    <div class="alert alert-${message.type}" role="alert">
            ${message.text}
    </div>
</c:if>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
</body>
</html>
