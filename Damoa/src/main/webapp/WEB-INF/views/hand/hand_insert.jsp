<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
</head>
<body>
	<header>
		<h1>상품 등록</h1>
	</header>
	<main>
		<c:choose>
			<c:when test="${mId != null }">
				<form action="/hand/write" method="post">
					<fieldset>
						<legend>글 등록 폼</legend>
						<p>
							
							<label for="handTitle">제목</label> <input type="text"
								id="handTitle" name="handTitle" required
								placeholder="String varchar2 300">
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
							<label for="handContent">내용</label> <input type="text"
								id="content" name="handContent" required
								placeholder="String varchar2 3000">
						</p>
						<p>
							<label for="attachedfile">파일 첨부 </label> <input type="file"
								id="attachedfile" name="attachedfile" placeholder="파일 첨부">
						</p>
						<input type="hidden" value="${memberDTO.mId}" name="mId">
						<button type="submit">등록</button>
						<button type="reset">취소</button>
					</fieldset>
				</form>
			</c:when>
			<c:otherwise>
				<script>
					location.href = "../member/login"
				</script>
			</c:otherwise>
		</c:choose>
	</main>
</body>
</html>