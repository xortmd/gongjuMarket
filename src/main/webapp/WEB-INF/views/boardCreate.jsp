<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2022-11-15
  Time: 오후 6:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 작성</title>
</head>
<body>

<%
    HttpSession sessionCheck = request.getSession();
    String id = (String)sessionCheck.getAttribute("log");

%>

<form class="write">
    <div class="board_wrap">
        <div class="board_title">
            <strong>커뮤니티</strong>
            <p>회원님의 진심을 알고 싶습니다.</p>
        </div>
        <div class="board_write_wrap" >
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text"  id="b_title" placeholder="제목을 입력해주세요." name="b_title" required></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <input type="text" id="nickname" name="nickname" value="${sessionScope.nickname}" readonly>
                        <input type="hidden" id="user_no" name="user_no" value="${sessionScope.no}" readonly>
                    </dl>

                </div>
                <div class="cont">
                    <input type="text" id="b_content" placeholder="내용을 입력해주세요." class="text" name="b_content" required>
                </div>
            </div>
            <div class="bt_wrap">
                <select id="notice" name="notice" required>
                    <option value="공지">공지</option>
                    <option value="그냥 글쓰기">그냥 글쓰기</option>
                </select>
<%--                <input type="button" onclick="location.href='boardForm'" value="돌아가기">--%>

                <input type="button" value="submit" onclick="createBoard()">
                <input type="button" value="home" onclick="location.href='/boardView'">
            </div>
        </div>
    </div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="script/createBoard.js"></script>
</body>
</html>
