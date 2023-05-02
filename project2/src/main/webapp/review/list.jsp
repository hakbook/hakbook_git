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
function view2(num) {
	document.form1.num.value = num;
	document.form1.submit();
}
function relist(page) {
	location.href="${path}/review_servlet/list.do?curPage="+page;
}
$(function() {
	$("#btnWrite").click(function() {
		location.href="${path}/review/write.jsp";
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
<style>
.navbar {
   margin-bottom: 0;
   border-radius: 0;
  }
  
  body {
   background-color: #dddddd;
}
    
footer {
   background-color: #dddddd;
   padding: 25px;
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
    <li class="active"><a href="review.jsp">영화후기</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
    <c:if test="${sessionScope.userid eq null}">
	 <li><a href="../myweb/login.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
	</c:if>
	<c:if test="${sessionScope.userid ne null}">
	 <li><a href="#" id="btnWrite"><span class="glyphicon glyphicon-log-in">글쓰기</span></a></li>
	 <li><a href="#" id="view" onclick="view('<%=session.getAttribute("userid")%>')"><span class="glyphicon glyphicon-log-in"><%=session.getAttribute("userid")%></span></a></li>
	 <li><a href="#" id="btnLogout" ><span class="glyphicon glyphicon-log-in">로그아웃</span></a></li>
	</c:if>
   </ul>
  </div>
 </div>
</nav>

<div align="center">
<h1>영화후기</h1>
<table border="1" style="width: 70%;">
 <tr>
  <th>글번호</th>
  <th>작성자</th>
  <th>제목</th>
  <th>조회수</th>
  <th>작성일자</th>
  <th>첨부파일</th>
  <c:if test="${sessionScope.result eq '관리자'}">  
   <th>첨부파일용량</th>
   <th>IP주소</th>
  </c:if>
 </tr>
<c:forEach var="dto" items="${list}">
 <tr align="center">
  <td>${dto.num}</td>
  <td>${dto.writer}</td>
  <td><a href="#" onclick="view2('${dto.num}')">${dto.subject}</a></td>
  <td>${dto.readcount}</td>
  <td>${dto.review_date}</td>
  <td>
   <c:if test="${dto.filesize > 0}">
    <a><img src="/tomcatImg/${dto.filename}" style="width: 150px; height: 150px;"></a>
   </c:if>
  </td>
  <c:if test="${sessionScope.result eq '관리자'}"> 
   <td>${dto.filesize}</td>
   <td>${dto.ip}</td>
  </c:if> 
 </tr>
 </c:forEach>
 <tr>
  <td colspan="8" align="center">
   <c:if test="${page.curPage > 1}">
    <a href="#" onclick="relist('1')">[처음]</a>
   </c:if>
   <c:if test="${page.curBlock > 1}">
    <a href="#" onclick="relist('${page.prevPage}')">[이전]</a>
   </c:if>
   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
    <c:choose>
     <c:when test="${num == page.curPage}">
      <span style="color: red">${num}</span>
     </c:when>
     <c:otherwise>
      <a href="#" onclick="relist('${num}')">${num}</a>
     </c:otherwise>
    </c:choose>
   </c:forEach>
   <c:if test="${page.curBlock < page.totBlock}">
    <a href="#" onclick="relist('${page.nextPage}')">[다음]</a>
   </c:if>
   <c:if test="${page.curPage < page.totPage}">
    <a href="#" onclick="relist('${page.totPage}')">[끝]</a>
   </c:if>   
  </td>
 </tr> 
</table>
</div>
<footer class="container-fluid text-center">
 <p>이 게시판은 사용자가 영화에 대한 후기을 올리는 게시판입니다.</p>
</footer>
<form name="form1" method="post" action="/project2/review_servlet/view.do">
 <input type="hidden" name="num">
</form>
<form name="form2" method="post" action="/project2/member2_servlet/view.do">
 <input type="hidden" name="userid">
</form>
</body>
</html>