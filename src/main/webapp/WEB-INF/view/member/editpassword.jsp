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
<c:import url="../../fragment/navbar.jsp"/>

<c:if test="${!access}">
    <div class="alert alert-warning" role="alert">
        <h3> 허가받지 못한 사용자입니다. 로그인 화면으로 돌아가 주세요</h3>
    </div>
</c:if>


<c:if test="${access}">
    <div class="container">
        <div class="">
            <div class="row g-3 align-items-center">
                <h3> ${param.id}님의 비밀번호 변경창</h3>
                <div class="col-auto">
                    <label for="inputPassword6" class="col-form-label">Password</label>
                </div>
                <div class="col-auto">
                    <input value="${password}" name="password" type="password" id="inputPassword6" class="form-control"
                           aria-describedby="passwordHelpInline">
                </div>
                <div class="col-auto">
                <span id="passwordHelpInline" class="form-text">
                  기존에 사용하던 비밀번호입니다.
                </span>
                </div>
            </div>

            <form action="/member/editpassword" method="post">
                <div class="row g-3 align-items-center">
                    <div class="col-auto">
                        <label for="inputPassword7" class="col-form-label">Password</label>
                    </div>
                    <div class="col-auto">
                        <input name="updatePassword" type="password" id="inputPassword7" class="form-control"
                               aria-describedby="passwordHelpInline">
                    </div>
                    <div class="col-auto">
                <span id="passwordHelpInline1" class="form-text">
                 변경하실 비빈번호를 입력해주세요
                </span>
                    </div>
                </div>
                <div>
                    <input type="hidden" name="id" value="${param.id}">
                    <button class="btn btn-outline-dark"> 변경</button>
                </div>
            </form>
        </div>
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
