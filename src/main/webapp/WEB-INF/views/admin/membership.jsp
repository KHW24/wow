<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	
<script>
	$(function(){
		var check = document.getElementsByName("membershipCheck");
		var rowCnt = check.length;
		
		$("input[name='allCheck']").click(function(){
			var chkListArr = $("input[name='membershipCheck']");
			for(var i=0; i<chkListArr.length; i++){
				chkListArr[i].checked = this.checked;
			}
		})
		$("input[name='membershipCheck']").click(function(){
			if($("input[name='membershipCheck'] : checked").length == rowCnt){
				$("input[name ='allCheck']")[0].checked = true;
			}else{
				$("input[name ='allCheck']")[0].checked = false;
			}
		})
	});
	
	function deleteMembership(){
		var csrfHeaderName ="${_csrf.headerName}";
		var csrfTokenValue="${_csrf.token}";
		
   		var valueArr = new Array();
   		var list = $("input[name='membershipCheck']");
   		for(var i=0; i<list.length; i++){
   			if(list[i].checked){
   				valueArr.push(list[i].value);
   			}
   		}
   		if(valueArr.length == 0){
   			alert("선택된 항목이 없습니다.");
   		}else{	
   			$.ajax({
			url: "deleteMembership.do",
			type: "POST",
			traditional : true,	 //배열의 값을 자바단에 넘겨줄수 있게 만든다
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data : {
		    	valueArr : valueArr        
		    },
	   		beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
	   		success : function(data){
	   			if(data == "success"){
	   				alert("삭제되었습니다.");
	   				location.href = "membership.do"
	   			}
	   		},
			error: function (request,status,errorData){   
		    	alert('error code: '+request.status+"\n"
		    			+'message:' +request.reponseText+'\n'
		    			+ 'error :'+  errorData);
		    }
   		});
	}
	}	
</script>	

 <style>
 
   /* 테이블 */
  table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 70%;
    margin-left: auto;
    margin-right: auto;
    color:black;
    text-align: center;
  }
  td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
    text-align: center;
  }
  tr:nth-child(even) {
    background-color: #dddddd;
    text-align: center;
  }
  
  /* 페이징 처리 */
  .pagination {
    display: inline-block;
  }
  .pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
  }
  .pagination a.active {
    background-color: gray;
    color: white;
    border-radius: 5px;
  }
  .pagination a:hover:not(.active) {
    background-color: #ddd;
    border-radius: 5px;
  }
  
  
  </style>
  

 <!-- Category -->
<div class="container-fluid bg-3 text-center">
  <h3 class="margin"><b>멤버쉽 회원 관리</b></h3>
  <br>
  <a href="membership.do" class="btn btn-default btn-lg">멤버쉽 회원 관리<br>
  </a>
  <a href="report.do" class="btn btn-default btn-lg">신고 회원 관리<br>
  </a>
  <a href="postmanage.do" class="btn btn-default btn-lg">게시물 관리<br>
  </a>

<br><br><br>
<!--CRUD-->
<table>
  <tr>
    <th> 전체선택 <input id ="allAdminMs"  type="checkbox" name="allCheck"></th>
    <th>No.</th>
    <th>ID</th>
    <th>Membership Period</th>
  </tr>
   <c:forEach items="${adminMsList}" var="adminMs">
  <tr>
    <td><input type="checkbox" name="membershipCheck" value="${adminMs.mshipSeq}">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></td>
    <td><c:out value="${adminMs.mshipSeq}" /></td>
    <td>${adminMs.id}</td>
    <fmt:formatDate value="${adminMs.mshipStart}"  var="mshipStart" pattern="yyyy-MM-dd"/>
    <fmt:formatDate value="${adminMs.mshipEnd}"  var="mshipEnd" pattern="yyyy-MM-dd"/>
    <td>${mshipStart} ~ ${mshipEnd}</td>  
  </tr>
      </c:forEach>
</table>
<br>
<input type="button" value="삭제" class="btn btn-outlin-info" id="membershipDelet" onclick="deleteMembership();">

<br>
<div class="pagination">
  <a href="#">&laquo;</a>
  <a href="#">1</a>
  <a href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
</div>
<br>
<br>
<br>
</div>