<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이웃의 솜씨</title>
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/post/postView.css"/>
<style>
	#header1 {height:200px;}
	#center1 {}
	#footer1 {height:300px;}
 </style>
</head>
<body>
	<!-- header -->
	<div id="header1">
	<%@ include file="header.jsp" %> 
	</div>
	
	<!-- center -->
	<div id="center1">
	<jsp:include page="${center}"/>
	</div>
	
	<!-- footer -->
	<div id="footer1">
	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>