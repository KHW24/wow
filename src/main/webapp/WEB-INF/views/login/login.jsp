<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
	.form-group{margin-top: 4%; height: 30px;}
     .btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
</style>
<c:if test="${!empty SPRING_SECURITY_LAST_EXCEPTION}">
	<script type="text/javascript">
	 window.onload= function(){
		 var loginError = document.getElementById("loginError");
		 var msg = "<font color='red'>아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해주세요.</font>";
			loginError.innerHTML = msg;
	 }
	</script>
	<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
</c:if>
<div style="text-align: center; font:bold 30px black; margin:3% 0 1% 0;">로그인</div>
<div class="container" style="margin: 0 auto; width: 30%; height: 400px; background-color: #c4bfbe;">
<form class="form-horizontal" action="${pageContext.request.contextPath}/login" method="post" style="margin:10% 13% 0 0;">
        
        <div class="form-group">
            <label class="control-label col-sm-2" for="id"></label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="id" name="id" value="${cookie.saved_id.value}" placeholder="ID를 입력하세요">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="pwd"></label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="pw" name="password" placeholder="Password를 입력하세요">
            </div>
        </div>       
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10" >
                <button type="submit" class="btn" style="width:340px">로그인</button>
            </div>
           
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                	<c:if test="${not empty cookie.saved_id.value}">
                		<c:set value="checked" var="checked"/>
                	</c:if>
                    <label><input type="checkbox" name="remember_id" value="저장"  ${checked}>아이디 저장</label>
                </div>
            </div>
        </div>
         <div class="row ">
            <div class="col-sm-12 text-right" id="loginError">
            
         	</div>
           </div>
        <div style="margin: 0 auto;">
            <div style="margin-left: 25%; margin-top: 2%; margin-right: 20%; display:flex; flex-direction: row;">
			<!-- 네이버 로그인 -->
            <div id="naver_id_login" style="text-align:center"><a href="${url}">
            	<img width="250" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
            </a></div>
            </div>
            <div style="margin-left: 25%; margin-top: 3%;">
            <a href="idFind.do"><button type="button" class="btn btn-link">아이디/비밀번호찾기</button></a>
            <a href="join.do"><button type="button" class="btn btn-link">회원가입</button></a>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </div>
    </div>
    </form>
<div style="height:50px; width:100%">
</div>