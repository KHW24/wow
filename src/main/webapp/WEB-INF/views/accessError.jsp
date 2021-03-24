<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    }
    .anno{
      text-align: center;
      font-weight: bold;
      margin-top: 200px;
    }
    .strong{
      font-size:25px;
    }
  </style>
</head>
<body>
	<div class="anno">
		<p class="strong anno">죄송합니다.</p>
		<br>
		<p>요청하신 페이지를 찾을 수 없습니다. 관리자에게 문의바랍니다.</p>
		<br>
		<br>
		<button class="btn btn-default" onclick="history.back();">이전페이지</button>
</body>
</html>