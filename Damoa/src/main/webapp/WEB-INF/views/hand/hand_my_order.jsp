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
<style>
/*
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
*/
.orderList li {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
}

.orderList span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
	margin-right: 10px;
}
</style>
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
	<jsp:include page="./hand_top_layout.jsp" flush="flase">
		<jsp:param name="pageNum" value="${pageMaker.cri.pageNum }" />
		<jsp:param name="amount" value="${pageMaker.cri.amount }" />
	</jsp:include>
	<!-- list -->

	<div class="container">
		<div class="row">

			<c:if test="${empty orderList}">
				<h2 class="text-center" id="category">주문 목록</h2>
				<h2 class="text-center">주문 내역이 없습니다.</h2>
			</c:if>

			<ul class="orderList">
				<c:forEach items="${orderList}" var="orderList">
					<li>
						<div>
							<p>
								<span>주문번호</span><a
									href="/hand/orderDetail?orderId=${orderList.orderId}">${orderList.orderId}</a>
							</p>
							<p>
								<span>수령인</span>${orderList.orderRec}</p>
							<p>
								<span>주소</span>${orderList.orderAddr}</p>
							<p>
								<span>가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderList.orderPrice}" />
								원
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="./hand_footer_layout.jsp" flush="false" />
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>