<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<style type="text/css">
.fileDrop {
	width: 100%;
	height: 200px;
	border: 2px dotted #0b58a2;
}

#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}

table tr td {
	text-align: left;
}

table tr td input[name=handTitle] {
	width: 600px;
}

table tr td input[name=handContent] {
	width: 300px;
	/* {속성값 !important } 우선순위 지정 */
}

textarea {
	width: 100%;
}

.valid, .invalid {
	font-size: 11px;
	font-weight: bold;
}

.valid {
	color: green;
}

.invalid {
	color: red;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}
</style>
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="/css/common.css?v=<%=new java.util.Date().getTime()%>">
<script type="text/javascript" src="/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h2>상품 수정</h2>
	<p class="w-pct60 right"
		style="margin: 0 auto; padding-bottom: 5px; font-size: 13px;">*는
		필수 입력 항목입니다.</p>
	<form action="./update" method="post" name="product_form"
		enctype="multipart/form-data">
		<table class="w-pct60">
			<tr>
				<th>* 제목</th>
				<td><input type="text" id="handTitle" name="handTitle" required
					placeholder="String varchar2 300" value="${handDTO.handTitle }">
					<div class="valid">제목을 입력하세요.</div></td>
			</tr>
			<tr>
				<th>* 가격</th>
				<td><input type="text" title="가격" name="handPrice"
					id="handPrice" class="handPrice" value="${handDTO.handPrice}" />&nbsp;
					원
					<div class="valid">가격를 입력하세요.</div></td>

			</tr>
			<tr>
				<th>* 카테고리</th>
				<td><select name="handType">
						<option value="">선택</option>
						<option value="1">기타</option>
						<option value="2">주방</option>
						<option value="3">악세서리</option>
						<option value="4">가전</option>
				</select>
					<div class="valid">카테고리를 선택하세요.</div></td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="5" cols="" id="content"
						name="handContent"></textarea>
			</tr>
			<tr>

				<td colspan="2">
					<div class="form_section">
						<div class="form_section_title">
							<label>상품 이미지</label>
						</div>
						<div class="form_section_content">
							<input type="file" multiple id="uploadFile" name='uploadFile'
								style="height: 30px;">
						</div>
						<div id="uploadResult">

							<c:forEach var="img" items="${handDTO.handImgList}"
								varStatus="vs">
								<div id='result_card'>
									<img
										src="/file/display?fileName=${fn:replace(img.uploadPath,'\\','/') }/s_${img.uuid}_${img.fileName}">
									<div class='imgDeleteBtn'
										data-file="${fn:replace(img.uploadPath,'\\','/') }/${img.uuid}_${img.fileName}">x</div>

									<input type='hidden' name='handImgList[${vs.index}].fileName'
										value='${img.fileName}'> <input type='hidden'
										name='handImgList[${vs.index}].uuid' value='${img.uuid}'>
									<input type='hidden' name='handImgList[${vs.index}].uploadPath'
										value="${fn:replace(img.uploadPath,'\\','/') }">
								</div>
							</c:forEach>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<input type="hidden" value="${member.mId}" name="mId">
		<input type="hidden" value="${handDTO.handNum }" name="handNum">
	</form>
	<div class="btnSet">
		<a class="btn-fill" onclick="formCheck()">수정</a> <a class="btn-empty"
			href="myList">취소</a>
	</div>
</head>
<script src="/js/hand/hand-update.js" type="text/javascript"></script>
</body>
</html>

