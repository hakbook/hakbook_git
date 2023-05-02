<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
function list(){
	$.ajax({
		type: "post",
		url: "/project2/notice_servlet/list.do",
		success: function(result){
			console.log(result);
			$("#niList").html(result);
		}
	});
}
$(function() {
	list();
	
});
</script>
</head>
<body>
<div id="niList"></div>
</body>
</html>