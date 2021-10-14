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
	<jsp:include page="./hand_top_layout.jsp" flush="flase">
		<jsp:param name="pageNum" value="${pageMaker.cri.pageNum }" />
		<jsp:param name="amount" value="${pageMaker.cri.amount }" />
	</jsp:include>
	<!-- list -->

	<div class="container">
		<div class="row">
			<h2 class="text-center" id="category">내 상품</h2>
			<div class="text-right">
				<a href="/hand/write" class="btn btn-primary" role="button">상품등록</a>
			</div>
			<nav class="text-right">
				<ul class="pagination" id="pagination">
					<c:if test="${pageMaker.prev }">
						<li><a href="${pageMaker.startPage -1 }"
							aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage }">
						<li class=${pageMaker.cri.pageNum == num ? "active":"" }><a
							href="${num}" id="page">${num } <span class="sr-only">(current)</span></a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li><a href="${pageMaker.endPage + 1 }" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><form id="moveForm" method="get">
							<input type="hidden" name="handType"
								value="${param.handType == null? 0 : param.handType}"> <input
								type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount"
								value="${pageMaker.cri.amount }">
						</form></li>
				</ul>

			</nav>
			<c:if test="${empty myList}">
				<h2 class="text-center">등록된 상품이 없습니다.</h2>
			</c:if>
			<c:forEach var="item" items="${myList}">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<c:choose>
							<c:when test="${empty item.handImgList[0].fileName}">
								<img style="height: 150px;" src="/resources/img/NoImage.png">
							</c:when>
							<c:otherwise>
								<c:set var="img" value="${item.handImgList[0]}" />
								<img style="height: 150px;"
									src="/file/display?fileName=${fn:replace(img.uploadPath,'\\','/') }/s_${img.uuid}_${img.fileName}" />
							</c:otherwise>
						</c:choose>
						<div class="caption" id="item">
							<h3>${item.handTitle}</h3>
							<p>
								<span class="badge badge-secondary">${item.typeName} </span>
							</p>
							<p>
								<a href="/hand/update?handNum=${item.handNum}"
									class="btn btn-default" role="button">수정</a> <a href=""
									onclick="delHand(${item.handNum});" class="btn btn-default"
									role="button">삭제</a> <a
									href="/hand/detail?handNum=${item.handNum}"
									class="btn btn-default" role="button">상세정보</a> <br>
							</p>
							<p>
								등록일 :
								<fmt:formatDate value="${item.handDate}" pattern="yyyy-MM-dd" />
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="./hand_footer_layout.jsp" flush="false" />

	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="/bootstrap/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		let moveForm = $('#moveForm');
		onclick = 'preventClick(event)'

		$("li #page").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/hand/myList");
			moveForm.submit();
		});
		//글 삭제
		function delHand(handNum){
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					url: '/hand/delete',
					data : {"handNum" : handNum},
					type : 'GET',
					success : function(result){
						$("#item").remove;
					},
					error : function(result){
						alert("파일을 삭제하지 못하였습니다.")
					}
		       });
				}
			}
	</script>
</body>
</html>