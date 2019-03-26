<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>실버서퍼에 오신 것을 환영합니다.</title>
</head>
<body>
<h1>
	실버서퍼 시작 1
</h1>

<c:if test="${sessionScope.loginId!=null}">
<h1>${sessionScope.loginId}님 환영합니다.</h1>
	<h3><a href="logout">로그아웃</a></h3>
</c:if>

<c:if test="${sessionScope.loginId==null}">
		<h3><a href="signup">회원가입하기</a></h3>
		<h3><a href="login">로그인하기</a></h3>
	</c:if>


<form action="insertTest">
id:<input type="text" name="id">
pw:<input type="password" name="pw">
<input type="submit" value="전송">
</form>


</body>
</html>
