<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.btn:hover {
	background-color: indigo;
	color: white;
}
</style>

<div style="text-align: center;">
	<h2>아이디찾기</h2>
	<hr>
</div>
<br>
<br>
<form class="form-horizontal" action="/action_page.php"
	style="width: 25%; margin: 0 auto;">
	<div class="radio" style="text-align: center;">
		<label><input type="radio" name="findId">아이디 찾기</label> <label><input
			type="radio" name="findId">비밀번호 찾기</label><br>
		<br>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="idname">닉네임:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="findIdName">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="idemail">이메일:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="findIdEmail">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10"
			style="text-align: center; padding-right: 20%;">
			<button type="submit" class="btn">아이디찾기</button>
		</div>
	</div>
</form>
