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

<c:if test="${!auth}">
    <div class="alert alert-warning" role="alert">
        <h3> 허가받지 못한 사용자입니다. 로그인을 해주시거나 , 올바른 아이디로 접속해주세요</h3>
    </div>
</c:if>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>
<c:if test="${auth}">

    <h3> ${board.id}번 게시글 수정 </h3>

    <form action="#" method="post">
        <div>
            <div class="input-group mb-3">
                <span class="input-group-text"> 제목 </span>
                <input type="text" class="form-control" placeholder="게시글 제목을 작성해주세요" aria-label="Username"
                       aria-describedby="basic-addon1" name="title" value="${board.title}">
            </div>

            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="작성자 명" aria-label="Recipient's username"
                       aria-describedby="basic-addon2" name="writer" value="${board.writer}">
            </div>

            <div class="input-group">
            <textarea class="form-control" aria-label="With textarea" name="content"
                      rows="10">${board.content}</textarea>
            </div>
            <div class="input-group">
                <input type="datetime-local" name="inserted" value="${board.inserted}">
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-outline-danger"> 수정</button>
            </div>


        </div>
        </div>
    </form>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
</body>
</html>
