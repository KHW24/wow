<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이웃의 솜씨</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/post/postView.css"/>
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %> 
	
	<!-- center -->
	<jsp:include page="${center}"/>
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>