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
	<form class="form-signin" action="selectMember" method="post">
		<img class="form-control mb-4 border-0" src="resources/image/adminLogo.png"> 
		<!-- Id -->
		<input type="hidden" name="type" value="10">
    	<input type="text" id="userid" name="userid" class="form-control form-control-sm mb-4" placeholder="ID">
	    <!-- Password -->
	    <input type="password" id="userpwd" name="userpwd" class="form-control form-control-sm mb-4" placeholder="Password">
		 <!-- Sign in button -->
    	<button class="btn btn-secondary btn-block mt-4" type="submit" id="loginbtn">Login</button>	
	</form>
	</div>
	
	


</body>
</html>