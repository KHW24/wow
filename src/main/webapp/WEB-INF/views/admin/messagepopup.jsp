
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	  color: black;
	  border: 2px solid #e7e7e7;
	}
	
	.button4:hover {background-color: #e7e7e7;}
	
	.name {
	font-family : 맑은고딕, Malgun Gothic, dotum, gulim, sans-serif;
	font-size : 14px;
	}
		
    </style>


<br>
    <div class="name"><p><b>받는 사람</b> 닉네임(아이디)</p></div>
    <br>

    <textarea name="name" cols="60" rows="15">

    </textarea>
    <br><br>

    <form action='login_page.php'>
    <button class="button button4">보내기</button>
    <button class="button button4">취소</button>
    </form>
    
    <br>
