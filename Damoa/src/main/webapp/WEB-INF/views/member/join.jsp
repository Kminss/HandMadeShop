<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAMOA : 회원가입</title>
<style type="text/css">
table tr td {
	text-align: left;
}

table tr td input[name=mPh] {
	width: 40px;
}

table tr td input[name=mAddr] {
	width: calc(100% - 14px);
	/* {속성값 !important } 우선순위 지정 */
}

.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
}
	
.valid, .invalid { 
	font-size: 11px;
	font-weight: bold; 
}

.valid { color: green; }

.invalid { color: red; }	
}

</style>
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="../css/common.css?v=<%=new java.util.Date().getTime() %>">
</head>	
<body>
<h3>회원가입</h3>
<p class="w-pct60 right" style="margin: 0 auto; padding-bottom: 5px; font-size: 13px;">*는 필수 입력 항목입니다.</p>
<form action="./join" method="post">
	<table class="w-pct60">
		<tr>
			<th class="w-px160">* 성명</th>
			<td><input type="text" name="mName" /></td>
		</tr>
		<tr>
			<th>* 아이디</th>
			<td>
				<input type="text" title="아이디" name="mId" class="chk" id="mId"/><a id="btn-id" class='btn-fill-s'>중복 확인</a><br>
				<div class='valid'>아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)</div>
			</td>
		</tr>
		<tr>
			<th>* 비밀번호</th>
			<td>
				<input type="password" title="비밀번호" name="mPw" id="mPw" class="chk" />
				<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
			</td>
			
		</tr>
		<tr>
			<th>* 비밀번호 확인</th>
			<td>
				<input type="password" title="비밀번호 확인" name="mPwc" id="mPwc" class="chk" />
				<div class="valid">비밀번호를 다시 입력하세요. </div>
			</td>
		</tr>
		<tr>
			<th>* 이메일</th>
			<td>
				<input type="text" title="이메일" name="mEmail" id="mEMail" class="chk" />
				<div class="valid">이메일을 입력하세요.</div>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" name="mBirth" readonly />
				<span id="delete" style="color: red; position: relative; right: 25px; display: none;"><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="mPh" /> - 
				<input type="text" name="mPh" /> - 
				<input type="text" name="mPh" />
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<a class='btn-fill-s' onclick="daum_post()">우편번호 찾기</a>
				<input type="text" name="mPost"  class="w-px60" readonly />
				<input type="text" name="mAddr" id="mAddr" readonly/>
				<input type="text" name="mAddr" />
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="go_join()">회원가입</a>
	<a class="btn-empty" href="./join">취소</a>
</div>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-migrate-3.3.2.js"></script>
<script type="text/javascript" src="../js/validation.js?v=<%=new java.util.Date().getTime()%>"></script>
<!-- cdnjs.com에서 가져온 fontawesome cdn 라이브러리 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script> 
<script src="../js/jquery-ui.min.js"></script>	<!-- jQuery ui -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	<!-- 다음 우편번호 api -->
<script src="/resources/js/member/join.js" type="text/javascript"></script>
</body>
</html>