<%@ page import="member.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	document.form1.userid.value = userid;
	document.form1.submit();
}
$(function() {
	$("#btnUpdate").click(function() {
		document.form1.action = "/project2/member2_servlet/update.do";
		document.form1.submit();
	});
});
$(function() {
	$("#btnDelete").click(function() {
		if(confirm("삭제하시겠습니까?")){
		document.form1.action = "/project2/member2_servlet/delete.do";
		document.form1.submit();
		}
	});
});
function list(){
	$.ajax({
		type: "post",
		url: "/project2/member2_servlet/list.do",
		success: function(result){
			console.log(result);
			$("#memberList").html(result);
		}
	});
}
$(function() {
	list();
});
</script>
<style type="text/css">
* {
    margin: 0px;
    padding: 0px;
    text-decoration: none;
    font-family:sans-serif;

}

.navbar {
    margin-bottom: 0;
    border-radius: 0;
}

body {
    background-color: #dddddd;
}
    
footer {
    background-color: #dddddd;
    color: red;
    padding: 25px;
}
   
.carousel-inner img {
    width: 600px; 
    margin: auto;
    min-height:200px;
    max-height: 800px;
}

@media (max-width: 600px) {
.carousel-caption {
    display: none; 
 }
}

header {
    display:flex;
    justify-content: center;
    margin-top: 50px;
}

.div1 {
    margin: auto;
    width: 750px;
    border-radius: 5px;
    text-align: left;
    padding: 20px;
}
  
.in {
    margin-bottom: 10px;
}
 
input, button {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
    border-radius: 5px;
    border: none;
}

#btnUpdate {
    background-color: #5b7484;
    margin-bottom: 20px;
    color: white;
}

#btnDelete {
    background-color: #D8413A;
    margin-bottom: 20px;
    color: white;
}
</style>
</head>
<body>
<%
MemberDTO dto = (MemberDTO)request.getAttribute("dto");
%>
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
    <li><a href="../myweb/main.jsp">MOBIV DAY</a></li>
    <li><a href="../notice/index.jsp">공지사항</a></li>
    <li><a href="../movie/index.jsp">영화</a></li>
    <li><a href="../review/review.jsp">영화후기</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
    <c:if test="${sessionScope.userid eq null}">
	 <li><a href="../myweb/login.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	</c:if>
	<c:if test="${sessionScope.userid ne null}">
	 <li class="active"><a href="#" id="view" onclick="view('<%=session.getAttribute("userid")%>')"><span class="glyphicon glyphicon-log-in"><%=session.getAttribute("userid")%></span></a></li>
	 <li><a href="#" id="btnLogout" ><span class="glyphicon glyphicon-log-in">로그아웃</span></a></li>
	</c:if>
   </ul>
  </div>
 </div>
</nav>
<header>
<h2>회원정보</h2>
</header>
 <div class="div1">
<form name="form1" method="post">
  <b>아이디</b><h4><strong><%= dto.getUserid() %></strong></h4>
  <b>이름</b><input name="name" value="<%= dto.getName() %>" class="in">
  <b>회원가입일자</b><h4><strong><%= dto.getJoin_date() %></strong></h4>
  <b>이메일</b> <input name="email" value="<%= dto.getEmail() %>" class="in">
  <b>전화번호</b><input name="hp" value="<%= dto.getHp() %>" class="in">
  <b>우편번호</b><input name="zipcode" value="<%= dto.getZipcode() %>" class="in">
  <b>기본주소</b><input name="address1" value="<%= dto.getAddress1() %>" class="in">
  <b>상세주소</b><input name="address2" value="<%= dto.getAddress2() %>" class="in">
  <input type="hidden" name="userid" value="<%= dto.getUserid() %>" class="in">
  <button type="button" id="btnUpdate">수정</button>
  <button type="button" id="btnDelete">삭제</button>
<c:if test="${sessionScope.result eq '관리자'}">  
 <div id="memberList"></div>
</c:if>
</form>
 </div>
</body>
</html>