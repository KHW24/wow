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
<style>
.purple{
    color:rgb(173, 39, 173)
}
.div1{
    background-color: lightgray;
    width:500px;
    height: 400px;
    margin-left:auto; 
    margin-right:auto;
}
hr{
    width: 400px;

}
h3, h4{
    text-align: center;
    font-weight: bold;
}
.center{
    text-align: center;
}
.btn{
    margin: 20px;
    background-color: white;
}
table{
    margin-left:auto; 
    margin-right:auto;
    
}
.btn:hover{
    background-color: rgb(173, 39, 173);
    color: white;
}
</style>
</head>
<body>
    <div class="container">
        <div class="div1"><br>
            <h3>멤버십을 <span class="purple">취소</span>합니다.</h3>
            <hr><br>
            <h3 style="color: purple;">1주일 멤버십</h3>
            <br><br>
            <table>
                <tr>
                    <th><h4>취소사유　</h4></th>
                    <td>
                        <select>
                            <option>구매의사 없어짐</option>
                            <option>구매의사 없어짐</option>
                            <option>구매의사 없어짐</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br><br><br>
            <div class=center>
            <button class="btn">뒤로가기</button>
            <button class="btn">취소요청</button>
            </div>
        </div>
    </div>
</body>
</html>