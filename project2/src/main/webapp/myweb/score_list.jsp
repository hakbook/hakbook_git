<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.3.min.js"></script>
<%@ include file="../include/header.jsp" %>
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
 <h4>평균점수 : <fmt:formatNumber pattern=".00">${avg}</fmt:formatNumber></h4>
<body>
<form name="form1" method="post">
<table border="1" style="width: 100%">
<c:forEach var="row" items="${list}">
 <tr>
  <td><h5>
   ${row.writer}(<fmt:formatDate value="${row.score_date}" 
   pattern="yyyy-MM-dd"/>) 점수:${row.score} <br>
   ${row.content}
  </h5></td>
  <c:if test="${sessionScope.result eq '관리자'}">
  <td>
   <a href="${path}/movie_servlet/scoreDel.do?score_num=${row.score_num}">삭제</a>
  </td>
  </c:if>
 </tr>
</c:forEach>
</table>
</form>
</body>
</html>