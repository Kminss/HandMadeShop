<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 뷰 페이지</title>
</head>
<body>
제목: ${handDTO.handTitle } <br>
내용: ${handDTO.handContent } <br>
종류: ${handDTO.handType }<br>
가격: ${handDTO.handPrice }<br>
<a href="../HandMainView.do"><button>목록</button></a>
</body>
</html>