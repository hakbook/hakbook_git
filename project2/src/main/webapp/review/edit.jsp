<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.3.min.js"></script>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function() {
	$("#btnUpdate").click(function() {
		document.form1.action="${path}/review_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function() {
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/review_servlet/delete.do";
			document.form1.submit();
	  }
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
	document.form2.submit();//수동 submit
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
    <li class="active"><a href="../review/review.jsp">영화후기</a></li>
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
<h2>수정/삭제</h2>
<form name="form1" method="post" enctype="multipart/form-data">
<table border="1" style="width: 100%;">
 <tr>
  <td>작성자</td>
  <td>${dto.writer}</td>
 </tr>
 <tr>
  <td>제목</td>
  <td><input name="subject" id="subject" size="60" value="${dto.subject}"></td>
 </tr>
 <tr>
  <td>후기</td>
  <td><textarea rows="5" cols="60" name="content" id="content">${dto.content}</textarea></td>
 </tr>
 <tr>
  <td>첨부파일</td>
  <td>
   <c:if test="${dto.filesize > 0}">
    <img src="/tomcatImg/${dto.filename}" style="width: 300px; height: 300px;"> <br>
    ${dto.filename} <br>
     <input type="checkbox" name="fileDel">첨부파일 삭제
   </c:if>
  <input type="file" name="file1"></td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <!-- 수정,삭제를 위한 글번호  -->
   <input type="hidden" name="num" value="${dto.num}">
   <input type="button" value="수정" id="btnUpdate">
   <input type="button" value="삭제" id="btnDelete">
  </td>
 </tr>
</table>
</form>
<form name="form2" method="post" action="/project2/member2_servlet/view.do">
 <input type="hidden" name="userid">
</form>
</body>
</html>