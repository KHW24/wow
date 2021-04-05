<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
 .btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
 a {text-decoration:none; color: #000;}
/*  td {overflow:hidden;text-overflow:ellipsis; width:10} */
</style>
<script>
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "messagepushDelete.do";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
					beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            success: function(jdata){
		                if(jdata = "redirect:messagepush.do") {
		                    alert("삭제를 성공했습니다.");

		                }
		                else{
		                    alert("삭제를 실패했습니다.");
		                }
		            },  error: function (request,status,errorData){   
				    	alert('error code: '+request.status+"\n"
				    			+'message:' +request.reponseText+'\n'
				    			+ 'error :'+  errorData);
				    }
				});
			}
		}
/* 		function newPage(){  
		      //$("#container").load(window.location.href + "#container");
				location.replace("messagepush.do");
		} */
	
</script>

<div style="text-align: center;">
	<h2>쪽지함</h2>
	<hr>
</div>
<div class="container" id="container" style="height: 700px">
	<form style="margin-top:3%">
	    <script>
			var csrfHeaderName ="${_csrf.headerName}";
			var csrfTokenValue="${_csrf.token}";
		</script>	
		<label><input type="radio" name="message" value="mepost" onclick="location.href='message.do?get_id=<sec:authentication property="principal.member.id"/>'" >받은 쪽지함 </label> 
		<label><input type="radio" name="message" value="mepush" onclick="location.href='messagepush.do?get_id=<sec:authentication property="principal.member.id"/>" checked> 보낸 쪽지함</label><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
		<input type="button" class="btn" style="margin-left: 89.3%;" onclick="deleteValue();" value="삭제"/>
		<!-- 페이징 때문에 값 가져오기 -->
		<input type="hidden" id="cnt" value="${listCount}"/>
		<input type="hidden" id="page" value="${page}"/>
		<table class="table table-condensed" style="table-layout: fixed">
			<thead>
				<tr>
					<th style="width:10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">글번호</th>
					<th style="width:60%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">내용</th>
					<th style="width:10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">보낸 아이디</th>
					<th style="width:10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">날짜</th>
					<th style="width:10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;<input type="checkbox" name="allCheck"></th>
				</tr>
			</thead>
			<tbody>
			<!-- 글이 없을 경우 -->
			<c:if test="${listCount == 0}">
				<tr>
					<td colspan="6" align="center"><br>
					<br><strong style="color:red;">보낸 쪽지가 없습니다.</strong><br>
					<br></td>
				</tr>
			</c:if>
			<!-- 글 있는 경우 -->
			<c:if test="${listCount != 0}">
			<!-- items에 list만 적으면 오류남.. 리스트는 forEach 안됨 -->
			<c:forEach var="me" varStatus="status" items="${list.list}">
				<tr>
					<td>${fn:length(list.list)-status.index}</td>
					<td>
					<a href="messageviewpopupUp.do?msg_seq=${me.msg_seq}" 
					onclick="window.open(this.href, '_blank', 'width=500, height=430'); return false;">${me.msg_contents }</a>
					</td>
					<td>${me.get_id }</td>
					<td>${me.msg_date }</td>
					<td>&nbsp;&nbsp;<input type="checkbox" name="RowCheck" value="${me.msg_seq }"></td> 
				</tr>
			</c:forEach>
			</c:if>
			</tbody>
		</table>
	</form>
	<!-- 글 있는 경우 -->
	<c:if test="${listCount ne 0}">
	<div class="paging">
      <!-- 페이지네이션 -->
	</div>
	</c:if>
</div>
<script>

	$(function(){
		messageList(); 
	 });

	var messageCnt = $('#cnt').val();
	var page = $('#page').val();
	
 	// 댓글 페이징 처리
	var pageNum = 1;
	var paging = $(".paging");
	var url = "messagepush.do?get_id=${get_id }&page=";
	
	function messageList(messageCnt){
		var endNum = Math.ceil(pageNum/10.0)*10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		
//		alert("endNum"+endNum+"startnum"+startNum+"prev"+prev+"next"+next);
		
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
				window.location.href="messagepush.do?get_id=${get_id }&page="+targetPageNum;	// 주소 주의해서 작성해야함
			});
					
		});
    
</script>