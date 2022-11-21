const login_no = document.getElementById('no').value;
const box = document.getElementById('wrap');
// 회원정보수정
function modifyMyInfo() {

    var output = "";

    let settings = {
        "url" : "http://localhost:8080/user/" + login_no,
        "method" : "POST",
        "timeout" : 0,
        "headers" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "no" : login_no
        })
    };

    $.ajax(settings).done(function(result) {
        const loginUser = result;

        const no = loginUser.no;
        const id = loginUser.id;
        const password = loginUser.password;
        const email = loginUser.email;
        const phone = loginUser.phone;
        const address = loginUser.address;
        const nickname = loginUser.nickname;

        output += '<form method="POST">';
        output += '<input type="hidden" id="no" autocomplete="off" value="' + no + '">';
        output += '<input type="text" id="id" name="id" autocomplete="off" value="' + id + '" placeholder="id" readonly>';
        output += '<input type="text" id="password" name="password" autocomplete="off" placeholder="password">';
        output += '<input type="text" id="email" name="email" autocomplete="off" value="' + email + '" placeholder="email" readonly>';
        output += '<input type="text" id="phone" name="phone" autocomplete="off" value="' + phone + '" onfocus="this.value=``" onblur="phoneNullCheck(' + phone + ')" placeholder="phone">';
        output += '<input type="text" id="address" name="address" autocomplete="off" value="' + address + '" onfocus="this.value=``" onblur="phoneNullCheck(' + address + ')" placeholder="address">';
        output += '<input type="text" id="nickname" name="nickname" autocomplete="off" value="' + nickname + '" onfocus="this.value=``" onblur="phoneNullCheck(' + nickname + ')" placeholder="address">';
        output += '<input type="button" value="정보수정" onclick="update()">';
        output += '</form>'

        box.innerHTML = output;
    })
}

// 커뮤니티 댓글
function my_boardCmt() {

    let settings = {
        "url" : "http://localhost:8080/b_comment/user/" + login_no,
        "method" : "POST",
        "timeout" : 0,
        "headers" : {
            "Content-Type" : "application/json"
        },
        "data" : JSON.stringify({
            "user_no" : login_no
        })
    };

    $.ajax(settings).done(function(result) {
        const list = result;
        console.log(result);

        var output = '<div class="out">';
        output += '<div class="in">';
        output += '<form method="POST">';
        output += '<input type="hidden" value="' + login_no + '" id="user_no" name="user_no">';
        output += '</form>'
        output += '<table class="type04">';
        output += '<thead>';
        output += '<tr>';
        output += '<th class="b_no">게시글번호</th>'
        output += '<th class="content">댓글내용</th>'
        output += '<th class="regDate">작성날짜</th>'
        output += '<th class="modDate">수정날짜</th>'
        output += '</tr>';
        output += '</thead>';
        output += '<tbody>';

        list.forEach(e => {
            const b_no = e.b_no;
            const bc_content = e.bc_content;
            const regStr = e.regDate;
            const regDate = regStr.substring(0,10);
            const modStr = e.modDate;
            const modDate = modStr.substring(0,10);

            output += '<tr>';
            output += '<td>' + b_no + '</td>';
            output += '<td onclick="location.href=`/boardDetail/' + b_no + '`" style="cursor: pointer">' + bc_content + '</td>';
            output += '<td>' + regDate + '</td>';
            output += '<td>' + modDate + '</td>';
            output += '</tr>';
        })
        output += '</tbody>';
        output += '</table>';
        output += '</div>';
        output += '</div>';

        box.innerHTML = output;
    })
}