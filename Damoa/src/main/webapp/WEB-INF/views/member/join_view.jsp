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
		<c:when test="${bool}">
			<script>
				alert("등록되었습니다.")
				location.href="./index.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("실패하였습니다. 다시등록해주세요")
				location.href="./index.jsp"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>