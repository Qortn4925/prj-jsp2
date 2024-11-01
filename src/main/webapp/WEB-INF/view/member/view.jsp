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
<c:set var="modifiable" value="${sessionScope.loggedInMember.id==member.id}"/>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">

            <h2 class="my-3">회원 가입 작성</h2>

            <form action="/member/delete" method="post">
                <div class="mb-3">
                    <label for="inputTitle1" class="form-label"> id</label>
                    <input type="text" id="inputTitle1" name="id" class="form-control" value="${member.id}">
                </div>

                <div class="mb-3">
                    <label for="inputPassword1" class="form-label"> password</label>
                    <div class="input-group">
                        <input type="text" id="inputPassword1" name="password" class="form-control"
                               value="${member.password}">

                        <c:if test="${modifiable}">
                            <button class="btn btn-outline-secondary" form="editpassword">수정</button>
                        </c:if>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="inputWriter1" class="form-label"> 닉네임</label>
                    <input type="text" name="nickName" id="inputWriter1" class="form-control"
                           value="${member.nickName}">
                </div>

                <div class="mb-3">
                    <label for="textareaContent12" class="from-label">자기소개</label>
                    <textarea name="description" id="textareaContent12" rows="10"
                              class="form-control">${member.description}</textarea>
                </div>

                <div class="d-flex justify-content-center">
                    <button class="btn btn-outline-danger"> 삭제</button>
                    <%--                     수정할때 뭘 수정할지 모르니까 , 쿼리스트링에 id값 붙여서 넘겨주기--%>
                    <a class="btn btn-dark" href="/member/update?id=${member.id}">수정</a>

                    <%--            id 전송하기 , 삭제할때 포스트 방식으로 , 삭제할 id값 넘겨주는 행위--%>
                </div>
            </form>

            <form id="editpassword" method="get" action="/member/editpassword">
                <input type="hidden" name="id" value="${member.id}">
                <input type="hidden" name="password" value="${member.password}">
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
</body>
</html>