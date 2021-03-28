<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- 제이쿼리  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/pwFind.css"/>

    <div class="container">

        <h3 class="h3">비밀번호 찾기</h3><br><br><br>
        <form action="pwFind.do" method="post">
        <script>
			var csrfHeaderName ="${_csrf.headerName}";
			var csrfTokenValue="${_csrf.token}";
		</script>	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
            <div class="center"><input type="radio" name="find" onclick="location.href='idFind.do'"> 아이디 찾기　 <input type="radio" name="find" checked> 비밀번호 찾기</div><br><br>
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="id" id="id" size="25" placeholder="아이디를 입력해주세요." required></td>
                    <td></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="email" id="email" size="25" placeholder="이메일을 입력해주세요." required></td>
                    <td><input type="button" class="btn btn1" id="sendEmail" value="인증번호 전송"></td>
                </tr>
                <tr>
                    <th>인증번호</th>
                    <td><input type="text" name="emailnum" id="authKey" size="25" placeholder="인증번호를 입력해주세요." required></td>
                    <td><input type="button" class="btn btn1" id="authKeyC" value="인증번호 확인">
                    <input type="hidden" name="authKeyCBox" value="y">
					<span class="compare-text"></span>
                    </td>
                </tr>
            </table>
            <br><br>
            <div class="center">
            <input type="submit" style="width:120px;" class="btn btn1 btn_submit" id="submitbtn" value="비밀번호 변경">
            </div>
        </form>
    </div>
    <br><br><br><br><br><br>
    
<!-- 이메일 인증  -->
<script>

var authKey;
$(function () {$("#sendEmail").click(function(){
	var mail = $("#email").val()
	
	if (mail == ""){
		alert("메일 주소가 입력되지 않았습니다.");
	}else {
		authKey = '';
		$.ajax({
			url : "sendEmail.do",
			type : "POST",
			//contentType : 'text/html; charset=utf-8;',
			data: {mail : mail},
			dataType: "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(data){
				alert(data.key);
				authKey = data.key;
				alert("인증번호가 전송되었습니다.");
				isCertification=true; //추후 인증 여부를 알기위한 값
			},
		    error: function (request,status,errorData){   
		    	alert('error code: '+request.status+"\n"
		    			+'message:' +request.reponseText+'\n'
		    			+ 'error :'+  errorData);
		    }
		});
	}
});
});
	


$(function () {$("#authKeyC").click(function() {
	if($("#authKey").val() == ""){
		alert("인증번호를 입력해주세요.");
		isCertification = false;
	}else if ($("#authKey").val() == authKey) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
		$(".compare-text").text("인증 성공!").css("color", "black");
		$("input[name=authKeyCBox]").val('y');  //인증 성공여부 check
	} else {
		$(".compare-text").text("불일치!").css("color", "red");
		$("input[name=authKeyCBox]").val(''); //인증 실패
	}
});
});

// 빈칸 없는지 확인하기
$(function(){
	$("#submitbtn").click(function(){
		if($("input[name=id]").val()==''){
			alert("아이디를 입력해주세요.");
			$("input[name=id]").focus();
			return false;
		}else if($("input[name=email]").val()==''){
			alert("이메일을 입력해주세요");
			$("input[name=email]").focus();
			return false;
		}else if($("input[name=emailnum]").val()==''){
			alert("이메일 인증번호를 입력해주세요");
			$("input[name=emailnum]").focus();
			return false;
		}
	});
});

</script>