<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
			<c:when test="${memberDTO.mId != null }">
	<form action="./Delete.do" method="post">
		번호 : <input type="text" name="handNum"
			value="<%=request.getParameter("handNum")%>">
		<button type="submit">삭제</button>
	</form>
	</c:when>
	<c:otherwise>
		<script>
			location.href = "./LoginView.do"
		</script>
	</c:otherwise>
	</c:choose>
</body>
</html>