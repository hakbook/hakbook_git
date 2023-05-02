<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="../include/jquery-3.6.3.min.js"></script>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		if(confirm("로그아웃 하시겠습니까?")) {
		location.href = "${path}/member2_servlet/logout.do";
		}
	});
});
function view(userid) {
	document.form2.userid.value = userid;
	document.form2.submit();
}
$(function() {
	score_list();
	$("#btnSave").click(function() {
		score_add();
	});
	$("#btnList").click(function() {
		location.href="${path}/movie_servlet/list.do";
	});
});
function score_add() {
	var param="movie_num=${dto.num}&writer="+$("#writer").val()
	+"&content="+$("#content").val()+"&score="+$("#score").val();
	$.ajax({
		type: "post",
		url: "${path}/movie_servlet/score_add.do",
		data: param,
		success: function() {
			$("#writer").val("");
			$("#content").val("");
			$("#score").val("");
			score_list();
		}
	});
}
function score_list() {
	$.ajax({
		type: "post",
		url: "${path}/movie_servlet/scoreList.do",
		data: "num=${dto.num}",
		success: function(result) {
			$("#scoreList").html(result);
		}
	});
}
</script>
<style type="text/css">
body{
   background-color: #dddddd;
}

.navbar {
   margin-bottom: 0;
   border-radius: 0;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse">
 <div class="container-fluid">
  <div class="navbar-header">
   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>                        
   </button>
   <a class="navbar-brand" href="../myweb/main.jsp"><img src="../img/logo.jfif" style="width: 55px"></a>
  </div>
  <div class="collapse navbar-collapse" id="myNavbar">
   <ul class="nav navbar-nav">
    <li><a href="../myweb/main.jsp">MOVIE DAY</a></li>
    <li><a href="../notice/index.jsp">공지사항</a></li>
    <li><a href="../movie/index.jsp">영화</a></li>
    <li><a href="../review/review.jsp">영화후기</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
    <c:if test="${sessionScope.userid eq null}">
	 <li><a href="../myweb/login.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	</c:if>
	<c:if test="${sessionScope.userid ne null}">
	 <li><a href="#" id="view" onclick="view('<%=session.getAttribute("userid")%>')"><span class="glyphicon glyphicon-log-in"><%=session.getAttribute("userid")%></span></a></li>
	 <li><a href="#" id="btnLogout" ><span class="glyphicon glyphicon-log-in">로그아웃</span></a></li>
	</c:if>
   </ul>
  </div>
 </div>
</nav>
<h2>한줄 평가 남기기</h2>
<form name="form1" method="post">
 <table border="1" style="width: 100%;">
  <tr>
   <td>날짜</td>
   <td>${dto.reg_date}</td>
   <td>조회수</td>
   <td>${dto.readcount}</td>
  </tr>
  <tr>
   <td>작성자</td>
   <td colspan="3">${dto.writer}
   <input type="hidden" name="num" value="${dto.num}"></td>
  </tr>
  <tr>
   <td>제목</td>
   <td colspan="3">${dto.subject}</td>
  </tr>
  <tr>
   <td>줄거리</td>
   <td colspan="3">${dto.content}</td>
  </tr>
  <tr>
   <td>첨부파일</td>
   <td colspan="3">
    <c:if test="${dto.filesize > 0}">
     <a href="${path}/movie_servlet/download.do?num=${dto.num}"><img src="/tomcatImg/${dto.filename}" style="width: 150px; height: 150px;"></a><br>
    ${dto.filename}
    </c:if>
   </td>
  </tr>
  <tr>
   <td colspan="4" align="center">
    <input type="hidden" name="num" value="${dto.num}">
    <input type="button" value="목록" id="btnList">
   </td>
  </tr>
 </table>
</form>
<table border="1" style="width: 100%;">
 <tr>
  <td>작성자 : <input type="hidden" name="writer" id="writer" value="<%=session.getAttribute("userid")%>"><%=session.getAttribute("userid")%></td>
  <c:if test="${sessionScope.userid ne null}">
  <td rowspan="3">
   <button id="btnSave" type="button" onClick="window.location.reload()">확인</button>
  </td>
  </c:if>
 </tr>
 <tr>
  <td>점수주기(1~10점) : <input type="number" name="score" id="score" min="1" max="10"></td>
 </tr>
 <tr>
  <td><textarea rows="5" cols="80" placeholder="내용을 입력하세요(100자까지)" id="content"></textarea></td>
 </tr>
</table>
<div id="scoreList"></div>
<form name="form2" method="post" action="/project2/member2_servlet/view.do">
 <input type="hidden" name="userid">
</form>
</body>
</html>