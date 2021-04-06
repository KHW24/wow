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
	
	.name {
	font-family : 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
	font-size : 14px;
	}
		
    </style>
<br>

    <form action="messagepost.do" name="myForm" method="post">
    <script>
			var csrfHeaderName ="${_csrf.headerName}";
			var csrfTokenValue="${_csrf.token}";

			function fnMessagePost(){
				self.close();
			}
	</script>	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
    <div class="name">
    	<p>
    		<b>
    		
    			<c:set var="writer" value="${list.id}"/>
    			받는 사람 : 
    			<sec:authorize access="hasRole('ROLE_MEMBER')">
    				<input type="text" name="get_id" value="${list.id }" readonly/>
    			</sec:authorize>	
    			<sec:authorize access="hasRole('ROLE_ADMIN')">
    				<input type="text" name="get_id" value="${getId}" readonly/>
    			</sec:authorize>	
    			<br/>
    		
    		</b>
    	<sec:authorize access="isAuthenticated()">
            	<b> 보내는 사람 : <input type="text" name="id" 
            value="<sec:authentication property="principal.member.id"/>" readonly/></b>
        </sec:authorize>
        </p>
       		</div>
    <br>

 		<sec:authorize access="hasRole('ROLE_ADMIN')">
    		<textarea name="msg_contents" cols="60" rows="15" >
게시물이 신고처리되어 삭제하였습니다. 
신고 누적 시 회원탈퇴 조치가 취해질 수 있습니다.
    		</textarea>
    	</sec:authorize>
    	<sec:authorize access="hasRole('ROLE_MEMBER')">
	    	<textarea name="msg_contents" cols="60" rows="15">
    		</textarea>
    	</sec:authorize>
    <br><br>


    <button type="submit" id="pop_btn" class="button button4" >보내기</button>
    <button class="button button4" onclick="fnMessagePost();">취소</button>
    </form>
    
    <br>