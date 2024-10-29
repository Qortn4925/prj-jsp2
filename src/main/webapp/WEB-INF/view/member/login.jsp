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

<div class="d-flex flex-row justify-content-center">

    <div class="d-flex flex-column mb-2"><h2>로그인 페이지</h2>
        <form action="" method="post">
            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <label for="inputId1" class="col-form-label p-4">Id</label>
                </div>
                <div class="col-auto">
                    <input name="id" type="password" id="inputId1" class="form-control" aria-describedby="IdhelpInline">
                </div>
                <div class="col-auto">
    <span id="IdhelpInline" class="form-text">
      Must be 8-20 characters long.
    </span>
                </div>
            </div>

            <div class="row g-3 align-items-center">
                <div class="col-auto">
                    <label for="inputPassword6" class="col-form-label">Password</label>
                </div>
                <div class="col-auto">
                    <input name="password" type="password" id="inputPassword6" class="form-control"
                           aria-describedby="passwordHelpInline">
                </div>
                <div class="col-auto">
                <span id="passwordHelpInline" class="form-text">
                  Must be 8-20 characters long.
                </span>
                </div>
            </div>
            <div>
                <button class="btn btn-secondary">로그인</button>
                <a class="btn btn-dark" href="/member/create"> 회원가입하기</a>
            </div>

        </form>
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
