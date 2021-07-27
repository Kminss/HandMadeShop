<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
</head>
<body>
	<c:choose>
		<c:when test="${memberDTO.mId != null }">
			<form action="/hand/update" method="post">
				번호 : <input type="text" name="handNum" value="${param.handNum}">
				<p>
					<label for="handTitle">제목</label> <input type="text" id="handTitle"
						name="handTitle" required placeholder="String varchar2 300">
				</p>
				<p>
					<label for="handPrice">가격</label> <input type="text" id="price"
						name="handPrice" maxlength="10" size="11" required
						placeholder="Number 10자리">
				</p>
				<p>
					<label for="handType">종류</label> <select name="handType">
						<option value="">선택</option>
						<option value="1">기타</option>
						<option value="2">주방</option>
						<option value="3">악세서리</option>
						<option value="4">가전</option>
					</select>
				</p>
				<p>
					<label for="handContent">내용</label> <input type="text" id="content"
						name="handContent" required placeholder="String varchar2 3000">
				</p>
				<%-- 파일 첨부를 확인한다.--%>
				<c:if test="${!empty handDTO.attachedfile}">
					<p>
						<label for="attachedfile">파일 첨부</label><br>
						${handDTO.attachedfile}&nbsp;&nbsp;&nbsp; <a
							href="./hboardUpload ${handDTO.attachedfile}"> 파일 다운 </a> <input
							type="hidden" name="oldfile" value="${handDTO.attachedfile}">
					</p>
				</c:if>
			<!-- 	<p>
					<label for="oldfile">파일 수정</label> <input type="file" id="oldfile"
						name="oldfile">
				</p> -->
				<input type="hidden" value="${memberDTO.mId}" name="mId">
				<button type="submit">수정</button>
			</form>
		</c:when>
		<c:otherwise>
			<script>
				location.href = "../member/login"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>