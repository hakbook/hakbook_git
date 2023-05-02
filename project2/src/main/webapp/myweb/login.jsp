<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
body{
   background-color: #dddddd;
}

.navbar {
   margin-bottom: 0;
   border-radius: 0;
}
    
footer {
   background-color: #dddddd;
   padding: 25px;
   bottom: 0;
   width: 100%;
   position: absolute;
}
  
header{
   display:flex;
   justify-content: center;
   margin-top: 200px;
}
  
.div1 {
   margin: auto;
   width: 600px;
   border-radius: 5px;
   text-align: center;
   padding: 20px;
}
  
.in {
   margin-bottom: 20px;
}
 
input {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
    border-radius: 5px;
    border: none;
}

#btnLogin, #btnNew {
    background-color: #5b7484;
    margin-bottom: 20px;
    color: white;
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
    <li><a href="main.jsp">MOVIE DAY</a></li>
    <li><a href="../notice/index.jsp">공지사항</a></li>
    <li><a href="../movie/index.jsp">영화</a></li>
    <li><a href="../review/review.jsp">영화후기</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
 	<li class="active"><a href="../myweb/login.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
   </ul>
  </div>
 </div>
</nav>  
<header>
 <h2>Login</h2>
</header>
<div class="div1">
 <form name="input" method="post" action="${path}/member2_servlet/login_sha.do">
  <input type="text" id="userid" name="userid" placeholder="아이디" class="in">
  <input id="passwd" type="password" name="passwd" placeholder="비밀번호" class="in">
  <input type="submit" value="로그인" id="btnLogin">
  <a href="newlog3.jsp"target="_blank"><input type="button" value="가입하기" id="btnNew"></a>
  <table>
   <tr>
    <%
    String message = request.getParameter("message");
    if(message != null){ %>
    <td><h4 style="color: red;"><%= message %></h4></td>	
    <% } %>   
   </tr>
  </table>
 </form>
</div>
<footer class="container-fluid text-center">
 <p>이 페이지는 로그인을 하는 페이지입니다.</p>
</footer>
</body>
</html>