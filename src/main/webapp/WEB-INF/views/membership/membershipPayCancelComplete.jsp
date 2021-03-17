<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
.purple{
    color:rgb(173, 39, 173)
}
.icon{
    color: lightgray;
    text-align: center;
}
.table{
    width: 800px;
    margin-left:auto; 
    margin-right:auto;
    border : 1px solid lightgray;
}
th{
    background-color: lightgray;
    text-align: center;
    width: 300px;
}
td{
    width: 300px;
}
h3{
    font-weight: bold;
}
h3, p{
    text-align: center;
}
.center{
    text-align: center;
}
.btn{
    width: 100px;
}
.btn:hover{
    background-color: rgb(173, 39, 173);
    color: white;
}
</style>
</head>
<body>
    <div class="container">
        <div class="icon">
        <i class="fas fa-clipboard-check fa-6x"></i>
        </div>

        <h3>고객님, <span class="purple">취소요청</span>이 완료되었습니다.</h3>
        <br>
        <p>고객님의 취소 요청 내역은 다음과 같습니다.</p><br>
        
        <table class="table text-center">
            <tr>
                <th>거래번호</th>
                <td>10101010</td>
            </tr>
            <tr>
                <th>거래요청한 멤버십</th>
                <td>1주일 멤버십</td>
            </tr>
            <tr>
                <th>환불예정 금액</th>
                <td>1,000원(6일분/총7일)</td>
            </tr>
            <tr>
                <th>취소요청 일자</th>
                <td>2021.03.13</td>
            </tr>
            <tr>
                <th>취소요청 사유</th>
                <td>구매의사 없어짐</td>
            </tr>
        </table><br><br>
        <div class=center>
            <button class="btn btn1">확인</button>
        </div>
    </div>
</body>
</html>