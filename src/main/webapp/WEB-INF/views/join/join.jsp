<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/joinAjax.js"></script>   
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
<h1></h1>

<form action="join.do" method="post" id="join" name="join">
<script>
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
</script>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
	<table style="margin: 0 auto; width: 35%; height: 300px;">
		<tbody>
			<tr>
				<td style="text-align: center;">아이디</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="joinId" name="id" required >
					</div>
				</td>
				<td>
					<input type="button" class="btn" style="width: 90%; height: 65%; margin-left: 10%" id="checkIdDup" onclick="idCheck();" value="중복확인">
					<input type="hidden" name="idCheckBox" value="">
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">닉네임</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="joinName" name="nickname" required >
					</div>
				</td>
				<td>
					<input type="button" class="btn" style="width: 90%; height: 65%; margin-left: 10%" id="checkNiDup" onclick="niCheck();" value="중복확인">
					<input type="hidden" name="niCheckBox" value="">
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">비밀번호</td>
				<td>
					<div class="form-group">
						<input type="password" class="form-control" id="joinPw" name="password"
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
						<input type="password" class="form-control" id="joinPwCon" required>
					</div>
				<td style="padding: 4%;">	
					<font id="checkPw" size="2"></font>	
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">이메일</td>
				<td>
					<div class="form-group">
						<input type="email" class="form-control" id="joinEmail" name="email" required>
					</div>
				</td>
				<td>
					<input type="button" class="btn" style="width: 90%; height: 65%; margin-left: 10%" value="이메일전송" onclick="mailCheck()" id="emailCheck">
					<input type="hidden" name="mailBox" value="">
				</td>
			</tr>
			<tr style="display:none" id="emailBox">
				<td style="text-align: center;">이메일 인증번호</td>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" id="joinEmailCon" name="emailCon" required>
					</div>
				</td>
				<td>
					<input type="button" class="btn" style="width: 90%; height: 65%; margin-left: 10%" value="인증번호확인" onclick="mailCheckCon()" id="mailConCheck">
					<input type="hidden" name="mailConBox" value="">
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">주소</td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
					<input type="text" class="form-control" id="postCode" name="postCode" placeholder="우편번호" required="required" size="25" readonly>
					</div>
				</td>
				<td>
					<input type="button" onclick="DaumPostcode()" class="btn" style="width: 90%; height: 65%; margin-left: 10%" value="우편번호 찾기 ">
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
					<input type="text" class="form-control" id="roadAddress" name="roadAddress" placeholder="도로명주소" size="35" required="required" readonly>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
					 <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" size="35" required="required">
					</div>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: center;">
		<input type="submit" class="btn" style="margin-bottom:2%;" value="완료" id="joinSubmit">
	</div>
</form>
