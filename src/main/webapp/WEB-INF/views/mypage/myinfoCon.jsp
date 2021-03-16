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
	<h2>본인확인</h2>
	<br>
	<h5>기존 회원 비밀번호와 본인 확인 비밀번호가 일치하는 경우에만 내 정보 보기가 가능합니다.</h5>
	<hr>
	<br>
	<br>
</div>
<form method="POST" action="">
	<table
		style="text-align: center; margin-right: auto; margin-left: auto; width: 30%;">
		<tr>
			<td><label for="usr">비밀번호:</label></td>
			<td><input type="text" class="form-control" id="infoConPw"
				placeholder="비밀번호를 입력해주세요"><br></td>
		</tr>
		<tr>
			<td><label for="pwd" style="padding-right: 18%;">비밀번호
					확인:</label></td>
			<td><input type="password" class="form-control"
				id="infoConPwCon" placeholder="다시 한 번 입력해주세요"><br></td>
		</tr>
		<tr>
		</tr>

		<tr>
			<td></td>
			<td style="padding-right: 30%;">
				<button type="button" class="btn">확인</button>
				<button type="button" class="btn">취소</button>
			</td>
			<td></td>
		</tr>
	</table>

</form>
