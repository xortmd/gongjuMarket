<%--
  Created by IntelliJ IDEA.
  User: admim
  Date: 2022/11/16
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/myPageTemplate.css">
    <link rel="stylesheet" href="/css/join.css">
    <title>Trader</title>
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<aside>
    <jsp:include page="sidebar.jsp"/>
</aside>
<section>
    <div id="container" class="container">
        <div class="content">
            <div class="join_wrap">
                <form id="join_frm">
                    <div class="join_title">정보수정</div>
                    <div class="join_box">
                        <input type="hidden" id="no" autocomplete="off" value="${sessionScope.no}">
                        <input type="text" placeholder="아이디" name="id" id="id" autocomplete="off" value="${sessionScope.id}" readonly onKeyup="this.value=this.value.replace(/[^0-9A-Za-z]/g,'');" style="margin: 0;">

                        <input type="hidden" name="nicknameCheck" id="nicknameCheck">
                        <input type="hidden" name="nicknameCheckExisting" id="nicknameCheckExisting" value="${sessionScope.nickname}">
                        <input type="text" placeholder="닉네임" name="nickname" id="nickname" value="${sessionScope.nickname}" autocomplete="off">
                        <span id="nickname_ck" class="dpn">이미 사용중인 닉네임입니다.</span>

                        <div class="password_check">
                            <input type="password" placeholder="기존 비밀번호" name="password3" id="password3" autocomplete="off">
                            <button type="button" id="password_check_btn3" class="password_check_btn">비밀번호 보기</button>
                        </div>

                        <div class="password_check">
                            <input type="password" placeholder="변경할 비밀번호" name="password" id="password" autocomplete="off">
                            <button type="button" id="password_check_btn" class="password_check_btn">비밀번호 보기</button>
                        </div>
                        <div class="password_check">
                            <input type="password" placeholder="변경할 비밀번호 확인" id="password_ck" name="password_ck" autocomplete="off">
                            <button type="button" id="password_check_btn2" class="password_check_btn">비밀번호 보기</button>
                        </div>
                        <input type="text" placeholder="이메일" name="email" id="email" class="email" value="${sessionScope.email}" readonly autocomplete="off">
                        <input type="text" name="phone" id="phone" placeholder="핸드폰번호" value="${sessionScope.phone}" autocomplete="off">
                        <input type="text" name="address" id="address" placeholder="주소" value="${sessionScope.address}" autocomplete="off">
                    </div>
                    <button type="button" id="join" class="join_btn">정보 수정</button>
                </form>
            </div>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
<script src="script/userUpdateScript.js"></script>
</html>
