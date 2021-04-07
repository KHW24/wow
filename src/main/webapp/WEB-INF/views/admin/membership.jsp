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
	
	$(function(){
		// 쪽지보내기 팝업
		$(".sendMsg").click(function(){
	 		var sendMsgId = $(this).attr("id");
	 		console.log(sendMsgId);
	 		var getId = $("#"+sendMsgId).prev().val();
	 		console.log(getId);
	 		
		    var popUrl = "messagepopupMembership.do?getId="+getId;	//팝업창에 출력될 페이지 URL
		    var popOption = "width=500, height=430, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		    window.open(popUrl,"",popOption);
		});	
	});
	
	
	
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
    <th>멤버쉽 등급</th>
    <th>멤버쉽 기간</th>
    <th>쪽지 전송</th>
  </tr>
    <c:if test="${listCount != 0}">
   <c:forEach items="${adminMsList}" var="adminMs">
  <tr>
    <td><input type="checkbox" name="membershipCheck" value="${adminMs.mshipSeq}">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></td>
    <td><c:out value="${adminMs.mshipSeq}" /></td>
    <td>${adminMs.id}</td>
    <td>${adminMs.mshipGrade}</td>
    <fmt:formatDate value="${adminMs.mshipStart}"  var="mshipStart" pattern="yyyy-MM-dd"/>
    <fmt:formatDate value="${adminMs.mshipEnd}"  var="mshipEnd" pattern="yyyy-MM-dd"/>
    <td>${mshipStart} ~ ${mshipEnd}</td>  
    <td>  <input type="hidden" value="${post.id}" />
	    <button type="button" class="btn btn-default btn-sm sendMsg" id="sendMsg${status.count}" >쪽지 전송</button>
	    </td>
  </tr>
       </c:forEach>
    </c:if>
    <c:if test="${listCount == 0}">
    	<tr>
    		<td colspan="3" align="center">
    		<br><strong>게시글이 없습니다.</strong>
    		<br><br>
    		</td>
    	</tr>
    </c:if>
        <tr>
  	<td><button type="button" class="btn btn-default btn-sm" id="postDelete">게시글 삭제</td>
  	<td colspan="6"></td>
  </tr>
</table>
<br>
<br>
<!-- 글 있는 경우 -->
<c:if test="${listCount ne 0}">
	<div class="paging">
	  <!-- 페이지네이션 공간 -->
	</div>
</c:if>
<br>
<br>
<br>
</div>
<script>
	$(function(){
		var postCnt = "${listCount}";
		postList(postCnt); 
	 });
	
		// 페이징 처리
	var pageNum = "${page}";
	var paging = $(".paging");
	var url = "membership.do?page=";
	
	function postList(postCnt){
		var endNum = Math.ceil(pageNum/10.0)*10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*10>=postCnt){
			endNum = Math.ceil(postCnt/10.0);
		}
		
		if(endNum*10<postCnt){
			next = true;
		}
		
		var str = "<ul class='breadcrumb text-center'>";
		
		if(prev){
			str += "<li><a href='"+(startNum-1)+"'>이전</a></li>";
		}
		
		for(var i = startNum; i <= endNum; i++){
			var active = pageNum == i? "active":"";
			str +="<li class='"+active+"'><a href='"+i+"'>"+i+"</a></li>"; // 여기 a태그에 주소넣으면 안됨 아래에 넣어야됨
		}
		if(next){
			str+="<li><a href='"+(endNum+1)+"'>다음</a></li>";
		}
		str+="</ul>";
		console.log(str);
		paging.html(str);	// div 부분에 표시되게
		}
		
		
		//다음 페이지 눌렀을 때 리스트 나오게
		$(function(){
			paging.on("click","li a",function(e){
				e.preventDefault();
				console.log("page click");
				
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: "+targetPageNum);
				pageNum=targetPageNum;
				window.location.href="membership.do?page="+targetPageNum;	// 주소 주의해서 작성해야함
			});
					
		});
</script>