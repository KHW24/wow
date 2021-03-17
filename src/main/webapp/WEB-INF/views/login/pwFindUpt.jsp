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
    .btn_submit{
        width: 100px;
        text-align: center;
    }
    .btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
    table{
        margin-left:auto; 
        margin-right:auto;
    }
    h3{
        font-weight: bold;
        text-align: center;
    }
    th, td{
       padding: 10px;
    }
    th{
        text-align: right;
    }
    .center{
        text-align: center;
    }
</style>
</head>
<body>
    <div class="container">
        <h3>비밀번호 변경</h3><br><br><br>
        <form>
            <div class="center"><input type="radio" name="find" > 아이디 찾기　 <input type="radio" name="find"> 비밀번호 찾기</div><br><br>
            <table>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" size="30" placeholder="비밀번호를 입력해주세요." required></td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" size="30" placeholder="비밀번호를 한번더 입력해주세요." required></td>
                </tr>
            </table>
            <br><br>
            <div class="center">
            <input type="submit"  class="btn btn_submit" value="완료">
            </div>
        </form>
    </div>
</body>
</html>