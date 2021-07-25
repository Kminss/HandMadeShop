<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${bool}">
<script type="text/javascript">
alert("수정되었습니다. 다시 로그인해주세요.")
location.href="./member/logoutpro.jsp"
</script>
</c:if>
<script type="text/javascript">
alert("수정실패 다시수정해주세요")
history.back()
</script>
</body>
</html>