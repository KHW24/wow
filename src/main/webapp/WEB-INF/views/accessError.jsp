<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    .btn{
      background-color: rgb(179, 55, 179);
      color:#ffff;
      font-size:20px;
    }
    .anno{
      text-align: center;
      font-weight: bold;
      margin-top: 200px;
    }
    .strong{
      font-size:40px;
    }
    .sentence{
    	font-size:20px;
    }
  </style>
</head>
<body>
	<div class="anno">
		<p class="strong anno">죄송합니다.</p>
		<br>
		<p class="sentence">
		<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
			잘못된 요청입니다.	400 error
		</c:if>
		<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
			요청하신 페이지를 찾을 수 없습니다.   404 error	
		</c:if>
		<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
			요청된 메소드가 허용되지 않습니다.    405 error
		</c:if>
		<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
			서버에 오류가 발생하여 요청을 수행할 수 없습니다.   500error
		</c:if>
		<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
			서비스를 사용할 수 없습니다.   503error
		</c:if>
			<br>관리자에게 문의 바랍니다.
		</p>
		<br>
		<br>
		<button class="btn btn-default" onclick="location.href='main.do';">메인페이지</button>
</body>
</html>