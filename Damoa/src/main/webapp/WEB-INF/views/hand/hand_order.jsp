<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문</title>
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
	<form action="/hand/order" method="post" name="order_form"
		enctype="multipart/form-data">
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
				<th>제목</th>
				<td>${handDTO.handTitle}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><fmt:formatNumber pattern="###,###,###" value="${handDTO.handPrice}" />원</td>

			</tr>
		</table>
		<h3>결제 정보</h3>
		<table class="w-pct60">
			<tr>
				<th>총가격</th>
				<td><fmt:formatNumber pattern="###,###,###" value="${handDTO.handPrice}" />원</td>
			</tr>
			<tr>
				<th>결제 방법</th>
				<td><input type="radio" name="orderPayment" value="card">신용카드
					<input type="radio" name="orderPayment" value="transfer">계좌이체 <input
					type="radio" name="orderPayment" value="phone">휴대폰</td>

			</tr>
		</table>
		<input type="hidden" value="${member.mId}" name="mId">
		<input type="hidden" value="${member.mName}" name="orderRec">
		<input type="hidden" value="${member.mPost}" name="orderPost">
		<input type="hidden" value="${member.mAddr}" name="orderAddr">
		<input type="hidden" value="${member.mPh}" name="orderPh">
		<input type="hidden" value="${handDTO.handPrice}" name="orderAmount">
		<input type="hidden" value="${param.handNum}" name="handNum">
	</form>
	<div class="btnSet">
		<a class="btn-fill" onclick="formCheck()">결제</a> <a class="btn-empty"
			href="/">취소</a>
	</div>
</body>
<script type="text/javascript">
function formCheck() {
    var payment = document.forms[0].orderPayment.value;
 
    if (payment == null || payment == "") { 
        alert('결제방법을 선택하세요'); 
        document.forms[0].orderPayment.focus(); 
        return false; 
    }
    document.order_form.submit();
}
</script>
</html>

