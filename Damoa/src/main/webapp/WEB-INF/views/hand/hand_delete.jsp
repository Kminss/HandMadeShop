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
			<c:when test="${member != null}">
	<form action="./delete" method="post">
		번호 : <input type="text" name="handNum"
			value="${handNum }">
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