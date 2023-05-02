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
	$("#btnSave").click(function() {
		var writer=$("#writer").val();
		var subject=$("#subject").val();
		var content=$("#content").val();
		if(writer==""){
			alert("이름을 입력하세요.");
			$("#writer").focus();
			return;
		}
		if(subject==""){
			alert("제목을 입력하세요.");
			$("#subject").focus();
			return;
		}
		if(content==""){
			alert("내용을 입력하세요.");
			$("#content").focus();
			return;
		}
		document.form1.submit();
	});
});
function view(userid) {
	document.form2.userid.value = userid;
	document.form2.submit();
}
$(function() {
	$("#btnLogout").click(function() {
		if(confirm("로그아웃 하시겠습니까?")) {
		location.href = "${path}/member2_servlet/logout.do";
		}
	});
});
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
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
    <li class="active"><a href="../notice/index.jsp">공지사항</a></li>
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
<h2>글쓰기</h2>
<form name="form1" method="post"
 action="${path}/notice_servlet/write.do" enctype="multipart/form-data">
<table border="1" style="width: 100%;">
 <tr>
  <td>이름</td>
  <td><input type="hidden" name="writer" id="writer" value="<%=session.getAttribute("result")%>"><%=session.getAttribute("result")%></td>
 </tr>
 <tr>
  <td>제목</td>
  <td><input name="subject" id="subject"></td>
 </tr>
 <tr>
  <td>공지내용</td>
  <td><textarea rows="5" cols="60" name="content" id="content"></textarea></td>
 </tr>
 <tr>
  <td>첨부파일</td>
  <td>
   <img id="preview" style="width: 150px; height: 150px;" />
   <input type="file" name="file1" onchange="readURL(this);">
  </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="button" value="확인" id="btnSave">
  </td>
 </tr>
</table>
</form>
<form name="form2" method="post" action="/project2/member2_servlet/view.do">
 <input type="hidden" name="userid">
</form>
</body>
</html>