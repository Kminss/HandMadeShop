<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="./css/join.css">
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.min.css">

<script type="text/javascript" src="./js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="./js/jquery-migrate-3.3.2.js"></script>
<script type="text/javascript" src="./js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="./js/validation/additional-methods.min.js"></script>
<script type="text/javascript" src="./js/validation/messages_ko.min.js"></script>
<script type="text/javascript" src="./js/validation/validation.js"></script> 
</head>
<body>
	<form action="/Join" method="post" id="regform">
		<fieldset>
			<legend>회원가입폼</legend>
			<table class="signup_table">
				<tr>
					<th style="width: 100px" scope="row"><label for="mId">아이디</label></th>
					<td><input type="text" id="mId" name="mId" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="mPw">패스워드</label></th>
					<td><input type="password" id="mPw" name="mPw" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="mPwc">패스워드확인</label></th>
					<td><input type="password" id="mPwc" name="mPwc" /></td>
				</tr>
				
				<tr>
					<th scope="row"><label for="mBirth">생년월일</label></th>
					<td><input type="text" id="mBirth" name="mBirth" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="mEmail">이메일</label></th>
					<td><input type="text" id="mEmail" name="mEmail" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="mPh">전화번호</label></th>
					<td><input type="text" id="mPh" name="mPh" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="mAddr">주소</label></th>
					<td><input type="text" id="mAddr" name="mAddr" /></td>
				</tr>
			</table>
			<div class="form_btn">
				<input type="submit" >회원가입 <input type="reset"
					value="다시작성" />
			</div>
		</fieldset>
	</form>
</body>
</html>