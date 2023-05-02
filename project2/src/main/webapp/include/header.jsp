<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
1) JSTL(Jsp Standard Tag Library, JSP 표준 태그 라이브러리)
2) JSTL 사용 이유 : model1은 jsp페이지 중심, model2는 java코드 중심, jsp웹페이지에서
java코드를 안쓸 수는 없지만 이를 최소화 하기 위해 JSTL과 EL기법을 씀,즉 jsp 내부의
복잡한 자바 코드를 대체하기 위한 태그
3) taglib uri="태그라이브러리의 식별자" prefix="태그 접두어"
4) Core tag(핵심태그, 제일 자주 사용되는 태그들)
 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

