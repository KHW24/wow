<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
	.form-group{margin-top: 4%; height: 30px;}  
	.btn:hover{
		background-color: indigo;
		color: white;
	}
</style>

<div style="text-align: center;">
	<h2>내 정보 수정</h2>
	<hr>
	<br>
	<br>
</div>
<form>
	<table style="margin: 0 auto; width: 30%; height: 300px;">
		<tbody>
			<tr>
				<td style="text-align: center;">닉네임</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="upName">
					</div>
				</td>
				<td>
					<button type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%">중복확인</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">아이디</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="upId">
					</div>
				</td>
				<td>
					<button type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%">중복확인</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">비밀번호</td>
				<td>
					<div class="form-group">
						<input type="password" class="form-control" id="upPw">
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">비밀번호확인</td>
				<td>
					<div class="form-group">
						<input type="password" class="form-control" id="upPwCon">
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">이메일</td>
				<td>
					<div class="form-group">
						<input type="email" class="form-control" id="upEmail">
					</div>
				</td>
				<td>
					<button type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%">이메일전송</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">이메일 인증번호</td>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" id="UpEmailCon">
					</div>
				</td>
				<td>
					<button type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%">이메일확인</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">주소</td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
						<input type="text" class="form-control" id="upAdd">
					</div>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: center;">
		<button type="button" class="btn">완료</button>
	</div>
</form>
