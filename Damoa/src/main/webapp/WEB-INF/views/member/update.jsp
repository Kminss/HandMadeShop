<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./MemberUpdate.me" method="post" id="regform">
		<fieldset>
			<legend>회원수정폼</legend>
			<table class="signup_table">
				<tr>
					<th style="width: 100px" scope="row"><label for="mId">아이디</label></th>
					<td><input type="text" id="mId" name="mId" value="${member.mId"/></td>
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
					<th scope="row"><label for="mName">이름</label></th>
					<td><input type="text" id="mName" name="mName" value="${member.mName }" /></td>
				</tr>
				<tr>
					<th scope="row"><label for="mBirth">생년월일</label></th>
					<td><input type="text" id="mBirth" name="mBirth" value="${member.mBirth }"/></td>
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
				<input type="submit" value="수정" /> <input type="reset"
					value="다시작성" />
			</div>
		</fieldset>
	</form>
</body>
</html>