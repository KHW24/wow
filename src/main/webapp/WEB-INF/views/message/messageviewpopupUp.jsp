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

    <form action="messageviewpopupUp.do" name="myForm" method="post">
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
    			<c:set var="me" value="${list}"/>
    			받는 사람 : <input type="text" name="get_id" value="${list.id }" readonly/><br/>
    		</b>
    		
            	<b> 보내는 사람 : <input type="text" name="id" 
            value="${list.get_id }" readonly/></b>
		<br/>
        		<b>보낸 날짜 : <input type="text" name="msg_date" value="${list.msg_date }" readonly /></b>
        </p>
       		</div>
    <br>
    	<input type="hidden" name="msg_seq" value="${list.msg_seq }"/>
	    <textarea name="msg_contents" name="msg_contents"cols="60" rows="15"  >
	           ${me.msg_contents }
	    </textarea>
    <br><br>

    <button type="submit" id="pop_btn" class="button button4">수정 하기</button>
    <button onclick="fnMessagePost();" class="button button4">닫기</button>
    </form>

    
    <br>