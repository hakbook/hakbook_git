<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function view(userid) {
	document.form1.userid.value = userid;
	document.form1.submit();//수동 submit
}
$(function() {
	$("#btnLogout").click(function() {
		if(confirm("로그아웃 하시겠습니까?")) {
		location.href = "${path}/member2_servlet/logout.do";
		}
	});
});
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
   <a class="navbar-brand" href="main.jsp"><img src="../img/logo.jfif" style="width: 55px"></a>
  </div>
  <div class="collapse navbar-collapse" id="myNavbar">
   <ul class="nav navbar-nav">
    <li class="active"><a href="main.jsp">MOVIE DAY</a></li>
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
<div id="myCarousel" class="carousel slide" data-ride="carousel">
 <ol class="carousel-indicators">
  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
  <li data-target="#myCarousel" data-slide-to="1"></li>
  <li data-target="#myCarousel" data-slide-to="2"></li>
  <li data-target="#myCarousel" data-slide-to="3"></li>
  <li data-target="#myCarousel" data-slide-to="4"></li>
  <li data-target="#myCarousel" data-slide-to="5"></li>
 </ol>
 <div class="carousel-inner" role="listbox">
  <div class="item active">
   <a href="${path}/movie_servlet/view.do?num=51"><img src="../img/action/dungeons.jfif" alt="Image"></a>
  </div>
  <div class="item">
   <a href="${path}/movie_servlet/view.do?num=46"><img src="../img/comedy/otto.jfif" alt="Image"></a>
  </div>
  <div class="item">
   <a href="${path}/movie_servlet/view.do?num=58"><img src="../img/horror/horror1.jpg" alt="Image"></a>
  </div>
  <div class="item">
   <a href="${path}/movie_servlet/view.do?num=57"><img src="../img/roman/roman1.jfif" alt="Image"></a>
  </div>
  <div class="item">
   <a href="${path}/movie_servlet/view.do?num=68"><img src="../img/sf/sf1.jfif" alt="Image"></a>
  </div>
  <div class="item">
   <a href="${path}/movie_servlet/view.do?num=83"><img src="../img/drama/whiplash.jpg" alt="Image"></a>
  </div>
 </div>
 <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
  <span class="sr-only">Previous</span>
 </a>
 <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
  <span class="sr-only">Next</span>
 </a>
</div>
<div class="container text-center"> <br>
 <div class="row">
  <div class="col-sm-4" id="div1">
   <a href="${path}/movie_servlet/view.do?num=67"><img src="../img/sf/sf2.jpg" class="img-responsive center-block" style="width:400px; height: 300px;"></a>
   <p>많이 본 영화</p>
  </div>
  <div class="col-sm-4"  id="div1"> 
   <a href="${path}/movie_servlet/view.do?num=45"><img src="../img/drama/show.jpg" class="img-responsive center-block" style="width:400px; height: 300px;"></a>
   <p>가장 높은 평점</p>    
  </div>
  <div class="col-sm-4">
   <div class="well">
    <p><a href="#">지금 가장 핫한 영화</a></p>
   </div>
   <div class="well">
    <p><a href="#">미개봉작 미리 평가하기</a></p>
   </div>
   <div class="well">
    <p><a href="#">높은 평점순</a></p>
   </div>
  </div>
 </div>
</div><br>
<footer class="container-fluid text-center">
 <p>이 페이지는 메인 페이지 입니다.</p>
</footer>
<form name="form1" method="post" action="/project2/member2_servlet/view.do">
 <input type="hidden" name="userid">
</form>
</body>
</html>