<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<c:url value='/resources/css/board_question/style.css'/>">
</head>
<body>
<div class="scrollmenu">
    <a href="<c:url value='/main'/>">Home</a>
    <a href="<c:url value='/login'/>">login</a>
    <a href="<c:url value='/board_free'/>">자유게시판</a>
    <a href="<c:url value='/board_popularity'/>">인기게시판</a>
    <a href="<c:url value='/board_job'/>">취업게시판</a>
    <a href="<c:url value='/board_question'/>">질문게시판</a>
    <a href="#base">남는게 시팜</a>
    <a href="#custom">Custom</a>
    <a href="#more">More</a>
    <a href="#logo">Logo</a>
    <a href="#friends">Friends</a>
    <a href="#partners">Partners</a>
    <a href="#people">People</a>
    <a href="#work">Work</a>
</div>
<h1 class="title">질문게시판</h1>
<div id="myNav" class="overlay">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <div class="overlay-content">
        <a href="<c:url value='/board_free'/>">자유게시판</a>
        <a href="<c:url value='/board_popularity'/>">인기게시판</a>
        <a href="<c:url value='/board_job'/>">취업게시판</a>
        <a href="<c:url value='/board_question'/>">질문게시판</a>
    </div>
</div>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>

<form>
    <br>
    <span> ▷ 총 3개의 게시물이 있습니다. </span>
    <span class="right">
        <span class="grey" id="strong">SELECT</span>
        <select>
            <option value="제목" name="제목">제목</option>
            <option value="글쓴이" name="글쓴이">글쓴이</option>
        </select>
        <input type="text">
        <input type="button" name="검색" class="gradient" value="검색">
    </span>
</form>

<br>
<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>일시</th>
        <th>조회수</th>
    </tr>
     <c:forEach var="question" items="${questions}">
        <tr>
            <td class="center">${question.boardQuestionId}</td>
            <td class="left">${question.title}</td>
            <td class="center">${question.userId}</td>
            <td class="center">${question.createDate}</td>
            <td class="center">${question.viewCount}</td>
        </tr>
    </c:forEach>
    <tr>
        <td class="center">1</td>
        <td class="left">게시글입니다.</td>
        <td class="center">김동규</td>
        <td class="center">2024-06-01</td>
        <td class="center">1</td>
    </tr>
    <tr>
        <td class="center">2</td>
        <td class="left">게시글.</td>
        <td class="center">김승진</td>
        <td class="center">2024-06-01</td>
        <td class="center">15</td>
    </tr>
    <tr>
        <td class="center">3</td>
        <td class="left">게시글.</td>
        <td class="center">김민욱</td>
        <td class="center">2024-06-01</td>
        <td class="center">3</td>
    </tr>
</table>
</br>

<div class="center">
    <a href="https://www.naver.com/">◀</a>
    <a href="https://www.naver.com/">현재</a>
    <a href="https://www.naver.com/">▶</a>
</div>


<span class="right">
    <input type="button" value="목록" id="listButton" class="greylist">
    <input type="button" value="글쓰기" id="writeButton" class="gradient">
    <input type="button" value="글수정" id="editButton" class="gradient">
    <input type="button" value="글삭제" id="deleteButton" class="gradient">
</span>


<footer>
    <div class="wrap">
        <div class="social-icons">
            <i class="fa-brands fa-facebook-square"></i>
            <i class="fa-brands fa-instagram"></i>
            <i class="fa-brands fa-twitter"></i>
            <i class="fa-brands fa-youtube"></i>
        </div>
        <div class="options">
            <div class="option">자막 및 음성</div>
            <div class="option">음성 지원</div>
            <div class="option">고객 센터</div>
            <div class="option">미디어 센터</div>
            <div class="option">투자 정보(IR)</div>
            <div class="option">입사 정보</div>
            <div class="option">이용 약관</div>
            <div class="option">개인 정보</div>
            <div class="option">법적 고지</div>
            <div class="option">쿠키 설정</div>
            <div class="option">회사 정보</div>
            <div class="option">문의하기</div>
        </div>
    </div>
</footer>

<script src="<c:url value='/resources/js/board_question/scripts.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        var questionId;

        $('table tr').click(function() {
            questionId = $(this).find('td:first').text();
        });

        $.ajax({
            type: 'GET',
            url: '/question',
            success: function(response) {
                var questions = response;
                for(var i = 0; i < questions.length; i++) {
                    var question = questions[i];
                    var row = '<tr>';
                    row += '<td class="center">' + question.boardQuestionId + '</td>';
                    row += '<td class="left">' + question.title + '</td>';
                    row += '<td class="center">' + question.userId + '</td>';
                    row += '<td class="center">' + question.createDate + '</td>';
                    row += '<td class="center">' + question.viewCount + '</td>';
                    row += '</tr>';
                    $('table').append(row);
                }
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });

        $('#listButton').click(function() {
            window.location.href = 'question.p';
        });

        $('#writeButton').click(function() {
            window.location.href = 'question/new.p';
        });

        $('#editButton').click(function() {
            if(questionId) {
                window.location.href = '/question/edit/' + questionId;
            } else {
                alert("질문을 선택해주세요.");
            }
        });

        $('#deleteButton').click(function() {
            if(questionId) {
                if(confirm("정말 삭제하시겠습니까?")) {
                    $.ajax({
                        type: 'GET',
                        url: '/question/delete/' + questionId,
                        success: function(response) {
                            alert("삭제되었습니다.");
                            window.location.href = '/question';
                        },
                        error: function(xhr, status, error) {
                            console.error(error);
                        }
                    });
                }
            } else {
                alert("질문을 선택해주세요.");
            }
        });
    });
</script>
</body>
</html>