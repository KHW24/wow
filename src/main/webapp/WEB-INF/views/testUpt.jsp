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
   <h2>${id } 회원정보 수정하기</h2><hr>
</div>
<form action="memberUpt.do" method="post">
	<table style="margin: 0 auto; width: 30%; height: 300px;">
		<tbody>
			<tr>
				<td style="text-align: center;">아이디</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="joinId" name="id" value="${id }" required>
					</div>
				</td>
				<td>
					<button type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%">중복확인</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">닉네임</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="joinName" name="nickname" required>
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
						<input type="password" class="form-control" id="joinPw" name="password"
							required>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">이메일</td>
				<td>
					<div class="form-group">
						<input type="email" class="form-control" id="joinEmail" name="email" required>
					</div>
				</td>
				<td>
					<button type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%">이메일전송</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">주소</td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
						<input type="text" class="form-control" id="joinAdd" name="address">
					</div>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: center;">
		<input type="submit" class="btn" style="margin-bottom:2%;" value="완료">
	</div>
</form>
