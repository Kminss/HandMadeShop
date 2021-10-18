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
<title>내 상품</title>

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
	<jsp:include page="../hand/hand_top_layout.jsp" flush="flase">
		<jsp:param name="pageNum" value="${pageMaker.cri.pageNum }" />
		<jsp:param name="amount" value="${pageMaker.cri.amount }" />
	</jsp:include>
	<!-- list -->

	<div class="container">
		<div class="row">
			<h2 class="text-center" id="category">마이 페이지</h2>
				<h3>회원 관리</h3>
				<ul>
					<li><a href="/member/mUpdate">회원정보 수정</a></li>
					<li><a href="/member/mDelete">회원 탈퇴</a></li>
				</ul>
				<h3>주문 관리</h3>
				<ul>
					<li><a href="/hand/myOrder">주문목록</a></li>
				</ul>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../hand/hand_footer_layout.jsp" flush="false" />
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
