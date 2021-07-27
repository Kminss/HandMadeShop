<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 조회 페이지</title>
</head>
<body>
게시글번호: ${handDTO.handNum} <br>
제목: ${handDTO.handTitle } <br>
내용: ${handDTO.handContent } <br>
종류: ${handDTO.handType } <br>
가격: ${handDTO.handPrice } <br>
작성일: ${handDTO.handDate } <br>
</body>
</html>