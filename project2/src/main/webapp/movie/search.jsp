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
	$("#btnWrite").click(function() {
		location.href="${path}/movie/write.jsp";
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
.aside1{
	position: fixed;
	width: 162px;
	height: 835px;
	left: 2px;
	top: 150px;
	text-align: center;
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
    <li class="active"><a href="../board/index.jsp">영화</a></li>
    <li><a href="../review/review.jsp">영화후기</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
    <c:if test="${sessionScope.userid eq null}">
	 <li><a href="../myweb/login.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	</c:if>
	<c:if test="${sessionScope.userid ne null}">
	 <li><a href="#" id="btnWrite" ><span class="glyphicon glyphicon-log-in">글쓰기</span></a></li>
	 <li><a href="#" id="view" onclick="view('<%=session.getAttribute("userid")%>')"><span class="glyphicon glyphicon-log-in"><%=session.getAttribute("userid")%></span></a></li>
	 <li><a href="#" id="btnLogout" ><span class="glyphicon glyphicon-log-in">로그아웃</span></a></li>
	</c:if>
   </ul>
  </div>
 </div>
</nav>
<div align="center">
<table border="1" style="width: 70%;">
  <tr align="center">
    <th>작성자</th>
    <th>제목</th>
    <th>영화포스터</th>
    <th>조회수</th>
    <th>날짜</th>
  <c:if test="${sessionScope.result eq '관리자'}">  
    <th>IP주소</th>
  </c:if>
  </tr>
<c:forEach var="dto" items="${list}">  
  <tr align="center">
    <td>${dto.writer}</td>
    <td><a href="${path}/movie_servlet/view.do?num=${dto.num}">${dto.subject}</a></td>
    <td>
     <input type="hidden" value="${dto.filesize}">
     <c:if test="${dto.filesize > 0}">
      <a><img src="/tomcatImg/${dto.filename}" style="width: 150px; height: 150px;"></a>
     </c:if>
    </td>
    <td>${dto.readcount}</td>
    <td>${dto.reg_date}</td>
  <c:if test="${sessionScope.result eq '관리자'}">    
    <td>${dto.ip}</td>
  </c:if>  
  </tr>
</c:forEach>  
 <tr>
  <td colspan="8" align="center">
   <form name="form1" method="post" action="${path}/movie_servlet/search.do">
    <select name="search_option">
     <option value="writer">작성자</option>
     <option value="subject">제목</option>
     <option value="cotent">내용</option>
    </select>
    <input name="keyword">
    <button id="btnSearch">검색</button>
    </form>
  </td>
 </tr> 
</table>
</div>
<form name="form2" method="post" action="/project2/member2_servlet/view.do">
 <input type="hidden" name="userid">
</form>
</body>
</html>