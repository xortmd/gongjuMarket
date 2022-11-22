<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
  <link rel="stylesheet" href="/css/header.css">
</head>
<body>
<header class="header1">
    <div class="navbar_logo">
        <div class="logoImg">
            <img src="/css/princess.png" href="/" style="height: 78px">
        </div>

    </div>
    <ul class="navbar1_manu">
      <li><a href="/">홈</a></li>
      <li><a href="/productSearch">중고장터</a></li>
      <li><a href="/boardView">커뮤니티</a></li>
      <c:if test="${sessionScope.id != null}">
        <li><a href="/productCreate">중고물품등록</a></li>
      </c:if>
    </ul>
    <c:if test="${sessionScope.id == null}">
    <ul class="navbar1_links">
      <li><a href="/login">로그인</a></li>
      <li><a href="/join">회원가입</a></li>
    </ul>
    </c:if>
    <c:if test="${sessionScope.id != null}">
    <ul class="navbar1_links">
        <li><a onclick="window.open('myLetter/${sessionScope.no}', '쪽지보내기', 'width=500, height=500');" style="cursor: pointer">쪽지함</a></li>
        <li><a href="/myPage">마이페이지</a></li>
        <li><a href="/logout">로그아웃</a></li>
    </ul>
    </c:if>
    <a href="header.jsp" class="navbar1_manubtn">메뉴</a>
</header>
</body>
</html>
