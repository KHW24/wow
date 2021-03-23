<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- 카카오 지도 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;;

            }
        }).open();
    }

</script>
<!-- /카카오 지도 API -->
<script type="text/javascript">

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue="${_csrf.token}";

	// 아이디 중복체크
	function idCheck(){
		
		idVal = $("#joinId").val();
			
		
		$.ajax({
			url: "checkIdDup.do",
			type: "POST",
			data : {id: idVal}, 
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType : 'json',
			success: function(data){
				if(data.result == 0){
					alert("사용가능한 아이디입니다.")
					//$("#submit").removeAttr("disabled");	
				}else{
					alert("중복된 아이디입니다.")
					//$("#submit").attr("disabled", "disabled");
				}
			},
			error : function(request, status, errorData){
				alert("error code: "+request.status + "\n"+"message : "+request.responseText+
						"\n"+"error : "+errorData);
				// request.status은 404/500과 같은 오류번호가 나오고, responseText는 오류에 대한 설명이 나온다. 
			}
		});
	};

	// 닉네임 중복체크
	function niCheck(){
		nickVal = $("#joinName").val();
			
		$.ajax({
			url: "checkNiDup.do",
			type: "POST",
			data : {nickname: nickVal}, 
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType : 'json',
			success: function(data){
				if(data.result == 0){
					alert("사용가능한 닉네임입니다.")
					$("#submit").prop("disabled", "");	
				}else{
					alert("중복된 닉네임입니다.")
					$("#submit").prop("disabled", "disabled");
				}
			},
			error: function(){
				alert("서버에러");
			}
		});
	};
</script>
    
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

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
<form action="join.do" method="post" id="join">
	<table style="margin: 0 auto; width: 35%; height: 300px;">
		<tbody>
			<tr>
				<td style="text-align: center;">아이디</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="joinId" name="id" required>
					</div>
				</td>
				<td>
					<input type="button" class="btn" style="width: 90%; height: 65%; margin-left: 10%" id="checkIdDup" onclick="idCheck();" value="중복확인">
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
					<input type="button" class="btn" style="width: 90%; height: 65%; margin-left: 10%" id="checkNiDup" onclick="niCheck();" value="중복확인">
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
						<input type="email" class="form-control" id="joinEmail" name="email" required>
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
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</tr>
		</tbody>
	</table>
	<div style="text-align: center;">
		<input type="submit" class="btn" style="margin-bottom:2%;" value="완료">
	</div>
</form>
