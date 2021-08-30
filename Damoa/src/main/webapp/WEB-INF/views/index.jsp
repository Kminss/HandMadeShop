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
	<jsp:include page="/WEB-INF/views/hand/hand_top_layout.jsp" flush="false" />

	<div class="container mt-2">
		<!-- Main component for a primary marketing message or call to action -->
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="/img/time_1.jpg" alt="firest-slide">
				</div>
				<div class="item">
					<img src="/img/time_2.jpg" alt="second-slide">
				</div>
				<div class="item">
					<img src="/img/time_3.jpg" alt="third-slide">
				</div>
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
	<!-- list -->
	<div class="container">
		<h3>최신작품</h3>
		<div class="row">
			<c:forEach var="item" items="${list}">
				<div class="col-sm-6 col-md-3" >
					<div class="thumbnail">
						<c:choose>
							<c:when test="${empty item.handImgList[0].fileName}">
							<img src="/resources/img/NoImage.png" class="img-responsive" alt="Responsive image" style="height: 150px;">
							 </c:when>
							<c:otherwise>
							<c:set var="img" value="${item.handImgList[0]}"/>
							<img  class="img-responsive" alt="Responsive image" src="/file/display?fileName=${fn:replace(img.uploadPath,'\\','/') }/s_${img.uuid}_${img.fileName}" style="height: 150px;">
							
							 </c:otherwise>
						</c:choose>
						<div class="caption">
							<h3>${item.handTitle}</h3>
							<p>
								<span class="badge badge-secondary">${item.handType} </span>
							</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">바로구매(미구현)</a> <a
									href="/hand/detail?handNum=${item.handNum}" class="btn btn-default" role="button">상세정보</a>
							</p>
							<p>등록일 : <fmt:formatDate value="${item.handDate}" pattern="yyyy-MM-dd"/></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- footer -->
	<div>
		<jsp:include page="/WEB-INF/views/hand/hand_footer_layout.jsp" flush="false" />
	</div>
	
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>