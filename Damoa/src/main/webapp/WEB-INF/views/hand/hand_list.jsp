<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공예품 마켓</title>
<style type="text/css">
.par {
	width: 1000px;
	margin: 5px auto;
	overflow: visible;
	padding: 3px 0 3px 3px;
	display: flex;
	flex-wrap: wrap;
}

.item_table {
	width: 1000px;
	margin: 0 auto;
	overflow: visible;
	padding: 3px 0 3px 3px;
	display: flex;
	flex-wrap: wrap;
}

#damoaIcon {
	font-size: 40pt;
	color: #368AFF;
	text-decoration: none;
}

a {
	color: #368AFF;
	text-decoration: none;
}
</style>
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<header>
		<h1 align="center">
			<a id="damoaIcon" href="/"><font color="#368AFF">DAMOA</font></a> <br>
			<a href="./main"><font color=" #368AFF">공예품 마켓</font></a>
		</h1>
		<h2 align="center">판매리스트</h2>
		<div align="center">
			<input type="button" value="상품 등록" onclick="location.href='./write'">
		</div>
	</header>
	
	<div class="par">
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="list" items="${list}">
					<div class="item_table">

						<table border="1"
							onclick="location.href='./select?handNum=${list.handNum}'"
							style="cursor: pointer">
							<tbody>
								<tr>
									<td>제목</td>
									<td width="150">${list.handTitle}</td>
								</tr>
							</tbody>
							</tbody>
							<tr>
								<td>가격</td>
								<td width="150">${list.handPrice}</td>
							</tr>
							<tr>
								<td>종류</td>
								<td width="150">${list.handType }</td>
							</tr>
							<tr>
								<td>등록일</td>
								<td width="150">${list.handDate }</td>
							</tr>
							</tbody>
					
						</table>
						<c:if test = "${list.mId eq member.mId }">
						<button onClick="location.href='./update?handNum=${list.handNum}'">수정</button>
						<button id="del_btn" onClick="delConfirm('${list.handNum}')">삭제</button>
						</c:if>
						
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:out value="<script>alert('등록된 상품이 없습니다.')</script>"
					escapeXml="false" />
				<c:out value="<script>location.href='./write'</script>"
					escapeXml="false" />
			</c:otherwise>
		</c:choose>

	</div>
</body>

<script>
	//삭제 확인
	function delConfirm(handNum) {
		
		if (confirm("삭제를 하시겠습니까?")) {
			
			$.ajax({
				url : '/hand/delete',
				type : 'GET',
				data : {'handNum' : handNum},
				success : function(result) {
					if (result =="success") {
						location.reload();
					} else {
						alert("삭제에 실패하였습니다.");
					}
				}
			});
		} return false;
	}
</script>
</html>
