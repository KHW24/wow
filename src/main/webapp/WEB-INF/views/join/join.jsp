<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<style>
	.form-group{margin-top: 4%; height: 30px;}
    .btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
</style>
<div style="text-align: center;">
   <h2>회원가입</h2><hr>
</div>
<form>
	<table style="margin: 0 auto; width: 30%; height: 300px;">
		<tbody>
			<tr>
				<td style="text-align: center;">닉네임</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="joinName" required>
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
						<input type="text" class="form-control" id="joinId" required>
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
						<input type="password" class="form-control" id="joinPw"
							placeholder="8자 이상의 영문+숫자+특수문자 조합" required
							pattern="^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$">
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">비밀번호확인</td>
				<td>
					<div class="form-group">
						<input type="password" class="form-control" id="joinPwCon"
							required>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">이메일</td>
				<td>
					<div class="form-group">
						<input type="email" class="form-control" id="joinEmail" required>
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
						<input type="text" class="form-control" id="joinEmailCon" required>
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
						<input type="text" class="form-control" id="joinAdd">
					</div>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: center;">
		<button type="button" class="btn" style="margin-bottom:2%">완료</button>
	</div>
</form>
