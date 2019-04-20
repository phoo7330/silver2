<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>


	<title>Login</title>

	<!-- 인코딩 -->
	<meta charset="UTF-8">
	<meta  name="viewport" content="width-device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS 추가 -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	
	<!-- Custom CSS 추가 -->
	<link rel="stylesheet" href="resources/css/admin.css">
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- jQuery javaScript 추가 -->
	<script src="resources/js/jquery.min.js"></script>
	
	<!-- Popper javaScript 추가 -->
	<script src="resources/js/popper.min.js"></script>
	
	<!-- Bootstrap javaScript 추가 -->
	<script src="resources/js/bootstrap.min.js"></script>

</head>

<body style="background-color: white;">

	<!-- 로그인 폼 : id 임의 지정해놓음. -->
	<div class="div-signin text-center">
	<form class="form-signin" action="" method="post">
		<img class="form-control mb-4 border-0" src="resources/image/adminLogo.png"> 
		<!-- Id -->
    	<input type="text" id="admin-id" class="form-control form-control-sm mb-4" placeholder="ID">
	    <!-- Password -->
	    <input type="password" id="admin-password" class="form-control form-control-sm mb-4" placeholder="Password">
		 <!-- Sign in button -->
    	<button class="btn btn-secondary btn-block mt-4" type="button" id="loginbtn">Login</button>	
	</form>
	</div>
	
	
	<!-- 로그인 연결 후 지우세요 -->
	<footer class="footer mt-auto py-3 text-center">
	  <div class="container">
	  	<a class="text-musted" href="memberpage">adminMain 연결 : 로그인 연결 후 지우세요.</a>
	  </div>
	</footer>
	<!-- 여기까지 삭제 -->
	

</body>
</html>