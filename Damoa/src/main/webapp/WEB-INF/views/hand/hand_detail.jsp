<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>부트스트랩 101 템플릿</title>

<!-- 부트스트랩 -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<jsp:include page="./hand_top_layout.jsp" flush="flase">
		<jsp:param name="pageNum" value="${pageMaker.cri.pageNum }" />
		<jsp:param name="amount" value="${pageMaker.cri.amount }" />
	</jsp:include>
	<main class="mt-3">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- Main component for a primary marketing message or call to action -->
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
							<c:set var="img" value="${handDTO.handImgList}" />
							<c:forEach var="li" items="${img}" varStatus="cnt" begin="0">
								<li data-target="#carousel-example-generic"
									data-slide-to="${cnt.index}"></li>
							</c:forEach>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							
							<img
								src="/file/display?fileName=${fn:replace(img[0].uploadPath,'\\','/') }/${img[0].uuid}_${img[0].fileName}">
						</div>
							<c:forEach var="img1" items="${img}"
								varStatus="vs" begin="1">
								<div class="item">
									<img
										src="/file/display?fileName=${fn:replace(img1.uploadPath,'\\','/')}/${img1.uuid}_${img1.fileName}">
								</div>
							</c:forEach>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="thumbnail">
					<div class="card">
						<h3>${handDTO.handTitle}</h3>
						<p>
							<span class="badge badge-secondary">${handDTO.typeName} </span>
						</p>
						<h4>${handDTO.handPrice}원</h4>
						<p>
							<a href="/hand/order?handNum=${handDTO.handNum}" class="btn btn-primary" role="button">구매</a> <a
								href="#"
								class="btn btn-default" role="button">장바구니(미구현)</a> <br>
						</p>
						<p>
							등록일 :
							<fmt:formatDate value="${handDTO.handDate}" pattern="yyyy-MM-dd" />
						</p>

					</div>
				</div>
			</div>
		</div>
		<c:if test="${!empty handDTO.handContent}">
		<div class="row-md-3">
		<h2 class="text-center">상세 내용</h2>
		<p class="text-center" style="white-space: pre-line;">${handDTO.handContent}</p>
		</div>
		</c:if>
	</div>
	</main>
	<!-- footer -->
	<jsp:include page="./hand_footer_layout.jsp" flush="false" />

	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
<script>
$(document).ready(
		/* function() {
			//handType  한글로 수정 출력
				let handTypeBadge = document.getElementsByClassName("badge badge-secondary")
						var badge = handTypeBadge[0];
						if(badge.innerText == '1'){ badge.innerHTML = "인테리어"}
						if(badge.innerText == '2'){ badge.innerHTML = "악세서리"}
						if(badge.innerText == '3'){ badge.innerHTML = "가구"}
						if(badge.innerText == '4'){ badge.innerHTML = "주방/생활"}
						if(badge.innerText == '5'){ badge.innerHTML = "디저트"}
						if(badge.innerText == '6'){ badge.innerHTML = "기타"}
		}); */
</script>
</body>
</html>