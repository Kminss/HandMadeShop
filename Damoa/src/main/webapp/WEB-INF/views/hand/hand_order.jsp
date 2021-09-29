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
	<h2>상품 주문</h2>
	<form action="./write" method="post" name="product_form" enctype="multipart/form-data">
		<h3>구매자 정보</h3>
		<table class="w-pct60">
			<tr>
				<th>이름</th>
				<td>${member.mName}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${member.mEmail}</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>${member.mPh }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${member.mAddr }</td>
			</tr>
		</table>
		<h3>상품 정보</h3>
		<table class="w-pct60">
			<tr>
				<th>이름</th>
				<td>${handDTO.handTitle}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${handDTO.handPrice}</td>

			</tr>
		</table>
	<h3>결제 정보</h3>
		<table class="w-pct60">
			<tr>
				<th>총가격</th>
				<td>${handDTO.handPrice}</td>
			</tr>
			<tr>
				<th>결제 방법</th>
				<td><input type="radio" name="payment" value="card">신용카드
				<input type="radio" name="payment" value="transfer">계좌이체
				<input type="radio" name="payment" value="phone">휴대폰</td>

			</tr>
		</table>
		<input type="hidden" value="${member.mId}" name="mId">
	</form>
	<div class="btnSet">
		<a class="btn-fill" onclick="formCheck()">결제</a> <a class="btn-empty"
			href="./hand/main">취소</a>
	</div>
</head>
<script>
function formCheck() {
    var title = document.forms[0].handTitle.value;
    var price = document.forms[0].handPrice.value;
    var content = document.forms[0].handContent.value;
    var type = document.forms[0].handType.value;
 
    if (title == null || title == "") { 
        alert('제목을 입력하세요'); 
        document.forms[0].handTitle.focus(); 
        return false; 
    }
    if (price == null || price == "") {
        alert('가격을 입력하세요');
        document.forms[0].writer.focus();
        return false;
    }
    if(price.match(/^\d+$/ig) == null){
        alert('가격엔 숫자만 입력가능합니다.'); 
        document.forms[0].handPrice.focus();                      
        return false; 
    }
    if (type == null || type == "") {
        alert('카테고리를 선택해주세요');
        document.forms[0].handType.focus();
        return false;
    }
    document.product_form.submit();
}
	
	var fileCnt=0;
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e) {
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		
		console.log(fileCnt);
		//업로드 개수 제한
		for (let i = 0; i < fileList.length; i++) {
			if(fileCnt > 5 | fileList.length > 4 ){
				alert('5개까지 등록가능합니다.');
				return}
			formData.append("uploadFile", fileList[i]);
		}

		$.ajax({
			url : '/file/uploadFile',
			type : 'POST',
			processData : false,
			contentType : false,
			data : formData,
			dataType : 'json',
			success : function(result) {
				showUploadImage(result)
			},
			error : function(result) {
				alert("이미지 파일이 아닙니다.");
			}
		});
	});
	

	//이미지 출력
	function showUploadImage(uploadResultArr) {
		fileCnt += uploadResultArr.length;
		if(fileCnt > 5) {
			alert("5개까지 등록가능합니다.")
			$("input[type='file']").val("");
			return}
		//이미지데이터 확인
		if ( uploadResultArr[0] === "" || uploadResultArr.length == 0) {
			return
		}
		
		let uploadResult = $("#uploadResult");
		let obj = new Array(uploadResultArr.length);
		let fileCallPath = new Array(uploadResultArr.length);
		let str = "";
		
		for (var i = 0; i < obj.length; i++) {
			obj[i] = uploadResultArr[i];
			fileCallPath[i] = encodeURIComponent(obj[i].uploadPath.replace(/\\/g, '/') + "/s_" + obj[i].uuid + "_" + obj[i].fileName);
		}
		console.log('collpathLength : ' + fileCallPath.length)
		for (var i = 0; i < fileCallPath.length; i++) {
			
			str += "<div id='result_card'>";
			str += "<img src='/file/display?fileName=" + fileCallPath[i] + "'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath[i] + "'>x</div>";
			//form에 submit시 이미지전송할 input
			str += "<input type='hidden' name='handImgList["+ i +"].fileName' value='"+ obj[i].fileName +"'>";
			str += "<input type='hidden' name='handImgList["+ i +"].uuid' value='"+ obj[i].uuid +"'>";
			str += "<input type='hidden' name='handImgList["+ i +"].uploadPath' value='"+ obj[i].uploadPath +"'>";	
			str += "</div>";
		}
		uploadResult.append(str);
	}
	
	// 파일 삭제 이벤트
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
	//파일 삭제
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/file/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				targetDiv.remove();
				fileCnt -= 1;
				$("input[type='file']").val("");
			},
			error : function(result){
				alert("파일을 삭제하지 못하였습니다.")
			}
       });
	}
</script>
</body>
</html>

