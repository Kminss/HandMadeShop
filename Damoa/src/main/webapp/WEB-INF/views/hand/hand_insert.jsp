<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<style type="text/css">
.fileDrop {
	width: 100%;
	height: 200px;
	border: 2px dotted #0b58a2;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>

</head>
<body>
	<header>
		<h1>상품 등록</h1>
	</header>
	<form action="/hand/write" method="post">
		<fieldset>
			<legend>글 등록 폼</legend>
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
			<div class="form_section">
				<div class="form_section_title">
					<label>상품 이미지</label>
				</div>
				<div class="form_section_content">
					<input type="file" multiple id="fileItem" name='uploadFile'
						style="height: 30px;">
				</div>
			</div>


			<div class="box-footer">
				<button type="button" class="btn btn-primary listBtn">
					<i class="fa fa-list"></i> 목록
				</button>
				<button type="reset" class="btn btn-warning">
					<i class="fa fa-reply"></i> 초기화
				</button>
				<button type="submit" class="btn btn-success">
					<i class="fa fa-save"></i> 저장
				</button>
			</div>
			<input type="hidden" value="${member.mId}" name="mId">
		</fieldset>
	</form>
	<script>
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {
		alert("동작");
		}
</script>
</body>
</html>

