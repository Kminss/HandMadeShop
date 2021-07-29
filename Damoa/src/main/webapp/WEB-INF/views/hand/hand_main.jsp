<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAMOA</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ItemList.css">

</head>
<body>

	<header>
		<h1 align="center">
			<a id="damoaIcon" href="/">DAMOA</a>
			<br> <font color=" #368AFF">공예품 마켓</font> <br>
			<c:if test="${!empty member.mId }">${member.mId}님 환영합니다!</c:if>
				<c:if test="${!empty admin.mId }">$관리자님 환영합니다!</c:if>

		</h1>

	</header>
	<nav>

		<input type="button" value="상품 조회"
			onclick="location.href='./list'"> <input
			type="button" value="상품 등록" onclick="location.href='./write'">

	</nav>
	<main>
		<c:forEach var="item" items="${list}" begin="0" end="5">
			<div class="item_table">
				<table border="1">
					<tbody>
						<tr>
							<td>제목</td>
							<td width="150">${item.handTitle}</td>
						</tr>
					</tbody>
					</tbody>
					<tr>
						<td>가격</td>
						<td width="150">${item.handPrice }</td>
					</tr>
					<tr>
						<td>종류</td>
						<td width="150">${item.handType }</td>
					</tr>
					<tr>
						<td>등록일</td>
						<td width="150">${item.handDate }</td>
					</tr>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</main>

	<footer></footer>
</body>
</html>