<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
  </head>

  <body width="100%" height="100%">
    <form action="../member/login" method="post" class="loginForm">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="id" name="mId" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" class="pw" name="mPw" placeholder="PW">
      </div>
     <input type="hidden" name="url" value="${request.getRequestURI }">
      <button type="submit" class="btn">
        로그인
      </button>
     
      <div class="bottomText">
        아이디가 없으신가요? <a href="./join">회원가입</a>
      </div>
    </form>
  </body>
</html>