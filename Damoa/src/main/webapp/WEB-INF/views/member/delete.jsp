<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var delConfirm = confirm('탈퇴하시겠습니까?');
if (delConfirm) {
   location.href="./MemberDelete.me"
}
else {
   history.back()
}
</script>
</body>
</html>