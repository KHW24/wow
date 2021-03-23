<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
 .btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
</style>

<div style="text-align: center;">
	<h2>아이디찾기</h2>
	<hr>
</div>


<form class="form-horizontal" action="findId.do" method="post" style="width: 30%; margin-left: 40%;">
	<div class="radio" style="margin-left:10%;">
		<label><input type="radio" name="find" value="idFind" checked>아이디 찾기</label> 
		<label><input type="radio" name="find" value="pwFind" onclick="location.href='pwFind.do'">비밀번호 찾기</label><br>
		<br>
	</div>
	<div class="form-group" >
		<label class="control-label col-sm-2" for="idname" style="width:100px">닉네임:</label>
		<div class="col-sm-10" style="width:200px;">
			<input type="text" class="form-control" id="findIdName" name="nickname" style="width:200px; margin:0 auto;">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="idemail" style="width:100px">이메일:</label>
		<div class="col-sm-10" style="width:200px;">
			<input type="text" class="form-control" id="findIdEmail" name="email" style="width:200px; margin:0 auto;">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10" style="text-align: center; padding-right: 55%;">
			<input type="submit" class="btn" style="margin-left:10%; margin-bottom:10%" value="아이디찾기"/>
		</div>
	</div>
</form>
<script>
// msg로 넘어오는 값이 없으면 알람안뜨게함.
if('${msg}'!='')
	alert('${msg}');
</script>
<br><br><br><br><br><br>