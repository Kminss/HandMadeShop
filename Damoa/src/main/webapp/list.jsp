<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:include page="./WEB-INF/views/hand/hand_top_layout.jsp" flush="flase" />
	<!-- list -->

	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="/img/s_bf13e2fa-bfbb-4137-9d6a-a535c40f8d5f_fds.png"
						alt="...">
					<div class="caption">
						<h3>수제악세서리</h3>
						<p>
							<span class="badge badge-secondary">Secondary</span>
						</p>
						<p>....</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="/img/s_bf13e2fa-bfbb-4137-9d6a-a535c40f8d5f_fds.png"
						alt="...">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>...</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="/img/s_bf13e2fa-bfbb-4137-9d6a-a535c40f8d5f_fds.png"
						alt="...">
					<div class="caption">
						<h3>수제악세서리</h3>
						<p>
							<span class="badge badge-secondary">Secondary</span>
						</p>
						<p>....</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div>
		<jsp:include page="./WEB-INF/views/hand/hand_footer_layout.jsp"
			flush="false" />\
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="./js/jquery-3.5.1.min.js"></script>
		<script src="./bootstrap/js/bootstrap.min.js"></script>
	</div>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="./js/jquery-3.5.1.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>