<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<link rel="icon" href="img/favicon.ico">
<link href="/bootstrap/css/navbar-fixed-top.css" rel="stylesheet">
</head>

<!-- Fixed navbar -->
<nav class=" navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="true"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/"><font id="damoa-logo"
					size="6px">DAMOA</font></a>
			</div>
			<div id="navbar" class="navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/">홈</a></li>
					<li><a href="/hand/">인기상품</a></li>
					<li><a href="#contact">내상품</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">카테고리
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownMenuDivider">
							<li class="border"><a href="/hand/list?handType=0">전체</a></li>
							<li class="border"><a href="/hand/list?handType=1">인테리어</a> <a
								href="/hand/list?handType=2">악세서리</a> <a
								href="/hand/list?handType=3">가구</a> <a
								href="/hand/list?handType=4">주방,생활</a></li>

							<li><a href="/hand/list?handType=5">디저트</a></li>
						</ul></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li>
						<form class="searchForm" id="searchForm" action="/hand/list" method="get">
							<input  name="keyword" type="search" placeholder="Search"
								aria-label="Search">
							<input type="hidden" name="pageNum" value="${param.pageNum }">
                    		<input type="hidden" name="amount" value="${param.amount}">
							<button id="searchForm button" class="btn btn-outline-success my-2 my-sm-0"
								type="submit">검색</button>
						</form>
					</li>
					<li><a href="./member/login">로그인</a></li>
					<li><a href="./member/join">회원가입</a></li>
					<li class="active"><a href="./">고객센터(미구현) <span
							class="sr-only">(current)</span></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<script src="/js/jquery-3.5.1.min.js"></script>
	<script>
		let searchForm = $("#searchForm");

		/* 작거 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e){
			
			e.preventDefault();
			
			/* 검색 키워드 유효성 검사 */
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			
			searchForm.submit();
			
		});

	
	</script>
	</html>