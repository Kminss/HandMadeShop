<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
history.back()
</script>
</c:when>
<c:otherwise>
<script>
alert("아이디 또는 비밀번호가 틀렸습니다.")
history.back()
</script>
</c:otherwise>
</c:choose>

</body>
</html>