<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
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
	<h2>주문 정보</h2>
		<h3>구매자 정보</h3>
		<table class="w-pct60">
			<tr>
				<th>이름</th>
				<td>${orderDTO.orderRec}</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>${orderDTO.orderPh }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${orderDTO.orderAddr }</td>
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
				<td>${orderDTO.orderPrice}</td>
			</tr>
				<tr>
				<th>결제 방식</th>
				<td>${orderDTO.orderPayment }</td>
			</tr>
		</table>
	<div class="btnSet">
		<a class="btn-fill" href = "/">메인</a> <a class="btn-empty"
			href="/hand/orderDelete?orderId=${orderDTO.orderId}">주문 취소</a>
	</div>
</body>
</html>
