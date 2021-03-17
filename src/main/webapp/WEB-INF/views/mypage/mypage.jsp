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
    .left{
        float: left;
    }
    h3{
        font-weight: bold;
        text-align: center;
    }
    a{
        font-size: 12px;
        margin: 2px;
    }
    .a{
        clear: both;
    }
    p{
        float: left;
        font-size: 12px;
        margin: 3px;
    }
    .user{
        color: lightgray;
    }
    table{
        margin-left:auto; 
    margin-right:auto;
    }
    .right{
        float: left ;
        margin-left: 20px;
        width: 500px;
        height: 200px;
        background-color: lightgray;
    }
    th{
        padding-right: 30px;
    }
    td{
        
        padding: 40px;
        
        text-align: center;
        font-weight: bold;
        background-color: lightgray;
    }
    .icon{
        color :black;
    }
</style>
</head>
<body>
    <div class="container">
        <h3>마이페이지</h3><br><br><br>
        <table>
            <tr>
                <th>
                    <div class="left">
                        <div class="user">
                        <i class="fas fa-user-circle fa-10x"></i>
                        </div>
                        <p>솜씨님 환영합니다.</p>
                        <a href="#" class="icon"><i class="far fa-envelope"></i></a>[0]<br>
                        <div class="a">
                        <a>나의멤버십</a><a>나의정보수정</a>
                       </div>
                    </div>
                </th>
                <td>
                    <a class="icon"><i class="fas fa-check-circle fa-6x"></i>
                    <br><br><br>관심 품목</a>
                </td>
                <td>
                    <a class="icon"><i class="fas fa-check-circle fa-6x"></i>
                    <br><br><br>내 글 보기</a>
                </td>
                <td>
                    <a class="icon"><i class="fas fa-check-circle fa-6x"></i>
                    <br><br><br>내 댓글 보기</a>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>