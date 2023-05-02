<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>review</title>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function list(){
	$.ajax({
		type: "post",
		url: "/project2/review_servlet/list.do",
		success: function(result){
			console.log(result);
			$("#rvList").html(result);
		}
	});
}
$(function() {
	list();
	
});
</script>
</head>
<body>
<div id="rvList"></div>
</body>
</html>