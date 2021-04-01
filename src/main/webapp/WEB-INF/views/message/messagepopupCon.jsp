<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
    <style>
    .button {
				  background-color: #4CAF50; /* Green */
				  border: none;
				  color: white;
				  padding: 10px 20px;
				  text-align: center;
				  text-decoration: none;
				  display: inline-block;
				  font-family : 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
				  font-size : 14px;
				  margin: 4px 2px;
				  transition-duration: 0.4s;
				  cursor: pointer;
			}
			
		.button4 {
				  background-color: white;
				  color: white;
				  background-color: #7F00FF;
				  border: 1px solid  #7F00FF;
				}
				
	.button4:hover {  background-color: white;
				  color: black;
				  border: 1px solid  #7F00FF;}
	
	.name {margin-top:120px;}
	* {text-align:center;}
	strong {font-size:20px;}
    </style>
	<script>
	function fnMessagePost(){
		self.close();
	}
	</script>
<br>
    <script>
			var csrfHeaderName ="${_csrf.headerName}";
			var csrfTokenValue="${_csrf.token}";
/* 			$(function(){
				$('#pop_btn').on('click',function(){
					alert("쪽지가 성공적으로 보내졌습니다.")
					window.open("about:blank","_self").close();
				});	
			}); */
			
		</script>	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
    <div class="name">
	<strong>쪽지가 성공적으로 전송되었습니다.</strong>
    </div>
    <button type="submit" id="pop_btn" style="margin-top:130px" class="button button4" onclick="fnMessagePost();">닫기</button>
    
    <br>