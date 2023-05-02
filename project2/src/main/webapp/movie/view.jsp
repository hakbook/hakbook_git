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
	$("#btnList").click(function() {
		location.href="${path}/movie_servlet/list.do";
	});
	$("#btnEdit").click(function() {
		location.href="${path}/movie_servlet/edit.do?num=${dto.num}";
	});
	$("#btnOne").click(function() {
		location.href="${path}/movie_servlet/one.do?num=${dto.num}";
	});
});
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
    <li class="active"><a href="../movie/index.jsp">영화</a></li>
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
<h2>상세 화면</h2>
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
    <c:if test="${sessionScope.userid eq dto.writer}">
     <input type="button" value="수정/삭제" id="btnEdit">
    </c:if>
    <c:if test="${sessionScope.result eq '관리자'}">   
     <input type="button" value="수정/삭제" id="btnEdit">
    </c:if>
    <input type="button" value="한줄평" id="btnOne">
    <input type="button" value="목록" id="btnList">
   </td>
  </tr>
 </table>
</form>
<form name="form2" method="post" action="/project2/member2_servlet/view.do">
 <input type="hidden" name="userid">
</form>
</body>
</html>