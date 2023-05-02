<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>newlog3</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	$("#userid").one("click", function() {
		$(".id_box").append("<span style='color: red; font-size: 12px'>영문자, 숫자를 사용해서 6~20자</span>");
	});
	
	$("#passwd").one("click", function() {
		$(".pwd1_box").append("<span style='color: red; font-size: 12px'> 영어 대/소문자 특수문자, 숫자 포함 8~32자</span>");
	});
	
	$("#pwd2").on("keyup", function() {
		if($("#passwd").val()==$("#pwd2").val()){
			$(".pwd2_box").html("<span style='color: blue; font-size: 12px'>일치합니다.</span>");
		}else {
			$(".pwd2_box").html("<span style='color: red; font-size: 12px'>일치하지않습니다.</span>");
		}
	})
});

function check() {
	var userid = document.getElementById("userid");
	var pwd1 = document.getElementById("passwd");
	var pwd2 = document.getElementById("pwd2");
	var name = document.getElementById("name");
	var hp = document.getElementById("hp");
	var email = document.getElementById("email");
	
	if(userid.value == ""){
		alert("아이디는 필수 입력입니다.");
		userid.focus();
		return;
	}
	
	var exp1 = /^[A-Za-z0-9]{6,20}$/;
	console.log("test : " + exp1.test(userid.value));
	if(!exp1.test(userid.value)){
		alert("아이디는 영문자, 숫자를 사용해서 6~20자로 입력하세요.");
		userid.focus();
		return;
	}
	if (passwd.value == ""){
		alert("비밀번호는 필수 입력입니다.");
		passwd.focus();
   		return;
	}
	if(name.value == ""){
		alert("이름은 필수 입력입니다.");
		name.focus();
		return;
	}
	if(hp.value == ""){
		alert("전화번호는 필수 입력입니다.");
		hp.focus();
		return;
	}
	if(email.value == ""){
		alert("이메일은 필수 입력입니다.");
		email.focus();
		return;
	}
	
	var exp2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*\d){8,32}/;
	if(!exp2.test(passwd.value)){
		alert("비밀번호를 영어 대/소문자 특수문자,숫자를 최소 하나씩 입력하세요.");
		passwd.focus();
		return;
	}
	if (passwd.value != pwd2.value){
		alert("비밀번호 불일치");
    	pwd2.focus();
		return;
	}
	alert("정상적으로 입력되었습니다.");
	var user = confirm("가입하시겠습니까?");
	if(user == true) {
		alert("가입이 완료되었습니다.");
		location.href = 'login.jsp';
	}else {
		alert("가입이 취소되었습니다.");
		location.href = 'newlog3.jsp';
	}
	
}

$(function() {//페이지가 로딩 되자마자 자동으로 실행되는 함수
	$("#submit").click(function() {
		insert();
	});
});

function insert() {
	var param="userid="+$("#userid").val()
	+"&passwd="+$("#passwd").val()
	+"&name="+$("#name").val()
	+"&email="+$("#email").val()
	+"&hp="+$("#hp").val()
	+"&zipcode="+$("#zipcode").val()
	+"&address1="+$("#address1").val()
	+"&address2="+$("#address2").val();
	$.ajax({
		type: "post",
		url : "/project2/member2_servlet/join_sha.do",
		data : param,
		success : function(){
			list(); //회원목록 갱신
			//입력값 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
			$("#zipcode").val("");
			$("#address1").val("");
			$("#address2").val("");
		}
	});
}
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

h5 {
	text-align: center;
	color: red;
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

#submit {
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
    <li class="active"><a href="main.jsp">MOVIE DAY</a></li>
    <li><a href="../notice/index.jsp">공지사항</a></li>
    <li><a href="../movie/index.jsp">영화</a></li>
    <li><a href="../review/review.jsp">영화후기</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
   </ul>
  </div>
 </div>
</nav>
<header>
 <h2>회원가입</h2>
</header>
 <h5><strong>비밀번호는 회원가입 후 변경이 불가능합니다.</strong></h5>
<div class="div1">
 <form>
  <b>아이디(필수입력)</b><input size="32" id="userid" class="in">
  <div class="id_box"></div>
  <b>패스워드(필수입력)</b><input type="password" size="32" id="passwd" class="in">
  <div class="pwd1_box"></div>
  <b>패스워드 확인</b><input type="password" size="32" id="pwd2" class="in">
  <div class="pwd2_box"></div>
  <b>이름(필수입력)</b><input size="15"id="name" class="in"><br>
  <b>전화번호(필수입력)</b><input size="32" id="hp" class="in"><br>
  <b>이메일(필수입력)</b><input size="32" id="email" class="in">
  <b>우편번호</b><input size="32" id="zipcode" class="in"><br>
  <b>기본주소</b><input size="32" id="address1" class="in"><br>
  <b>상세주소</b><input size="32" id="address2" class="in"><br>
  <button type="button" id="submit" onclick="check()">가입하기</button>
 </form>
</div>
<footer class="container-fluid text-center">
 <p>비밀번호는 회원가입 후 변경이 불가능합니다.</p>
</footer>
</body>
</html>