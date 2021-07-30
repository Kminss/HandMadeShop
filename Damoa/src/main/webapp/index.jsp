<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAMOA</title>
<link rel="stylesheet" href="./css/header.css">
</head>
<body>
	<header>
		<h1 align="center">
			<a  id="damoaLogo" href="/">DAMOA</a>
		</h1>
	</header>
	<nav>
		<ul class="menu">
			<li class="noticeMenu"><b>공지사항</b></li>
			<li class="infoMenu"><b>정보</b>
				<ul class="infoMenu_s submenu">
					<li><a href="../eboard/Board/main/home.html">경제정보</a></li>
					<li><a href="../main/Main.html">맛집정보</a></li>
				</ul></li>
			<li class="comuMenu"><b>커뮤니티</b>
				<ul class="comuMenu_s submenu">
					<li>경제게시판</li>
					<li><a href="../freeboard/boardMain/mainView.html">자유게시판</a></li>
				</ul></li>
			<li class="marketMenu"><b>마켓</b>
				<ul class="marketMenu_s submenu">
					<li><a href="../gamemarket/Main/Main.html">게임마켓</a></li>
					<li><a href="./HandMainView.do">공예품마켓</a></li>
				</ul></li>
			<li class="supportMenu"><b>고객센터</b></li>
		</ul>
	</nav>

	<main>
		<div class="login">
			<c:choose>
				<c:when test="${empty member.mId }">
					<fieldset>
						<legend>로그인</legend>
						<div class="loginform">
							<button type="button"
								onClick="location.href='./member/login'" class=loginBtn>로그인</button>
						</div>
						<div>
							<button type="button"
								onClick="location.href='./member/join'" id="signUpBtn">회원가입</button>
							<button type="button" onClick="location.href='PAGENAME.html'"
								id="findIdBtn">아이디/비밀번호찾기</button>
						</div>

					</fieldset>
				</c:when>
				<c:otherwise>
			${member.mId }님 반갑습니다.
			<div>
			<a href="./member/logout"  >로그아웃</a> /
			<a href="./member/mypage.jsp">마이페이지</a>
			</div>
			</c:otherwise>
			</c:choose>
		</div>
		<br> <br> <br>
		<div class="cast" align="center">
			<button>맛집</button>
			<button>경제</button>
			<button>게임</button>
			<button>공예품</button>
			<button>자유</button>
		</div>
		<div class="table-par">
			<div class="item-table" align="center">
				<table border="1">
					<tr>
						<td colspan="2" width="150" height="150">이미지</td>
					</tr>
					<tbody>
						<tr>
							<td>제목</td>
							<td width="150">dfasdf</td>
						</tr>
					</tbody>
					</tbody>
					<tr>
						<td>가격</td>
						<td width="150">222</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="item-table" align="center">
				<table border="1">
					<tr>
						<td colspan="2" width="150" height="150">이미지</td>
					</tr>
					<tbody>
						<tr>
							<td>제목</td>
							<td width="150">dfasdf</td>
						</tr>
					</tbody>
					</tbody>
					<tr>
						<td>가격</td>
						<td width="150">222</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="item-table" align="center">
				<table border="1">
					<tr>
						<td colspan="2" width="150" height="150">이미지</td>
					</tr>
					<tbody>
						<tr>
							<td>제목</td>
							<td width="150">dfasdf</td>
						</tr>
					</tbody>
					</tbody>
					<tr>
						<td>가격</td>
						<td width="150">222</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</main>


</body>
</html>