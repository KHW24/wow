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
</style>

<script>

	// 전체 선택되면 체크되는 기능
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for(var i=0; i<chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		});
		
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			}
			else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	
	// 체크박스로 삭제 기능
	function deleteValue(){
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		var message = ${list};
		for(var i=0; i<list.length; i++) {
			if(list[i].checked) {	// 선택되어 있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		}
		else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : "messageDelete.do",
				type : "POST",
				traditional : true,
				data : {
					valueArr : valueArr	// 보내고자 하는 data 변수 설정
				},
				success : function(jdata) {
					if(jdata = 1) {
						alert("삭제 성공");
						//location.replace("redirect:message.do") list로 페이지 새로고침
					}
					else {
						alert("삭제 실패");
					}
				}
			});
		}
	};
	
	


</script>

<div style="text-align: center;">
	<h2>쪽지함</h2>
	<hr>
</div>
<div class="container" style="height: 700px">
	<form style="margin-top:3%">
	    <script>
			var csrfHeaderName ="${_csrf.headerName}";
			var csrfTokenValue="${_csrf.token}";
		</script>	
		<label><input type="radio" name="message" value="mepost" onclick="window.location.href='message.do?get_id=<sec:authentication property="principal.member.id"/>';" checked>받은 쪽지함 </label> 
		<label><input type="radio" name="message" value="mepush" onclick="window.location.href='messagepush.do?get_id=<sec:authentication property="principal.member.id"/>';"> 보낸 쪽지함</label><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
		<button class="btn" onclick="deleteValue();" style="margin-left: 89.3%;">삭제</button>
		<table class="table table-condensed" >
			<thead>
				<tr>
					<th style="width:10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">글번호</th>
					<th style="width:60%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">내용</th>
					<th style="width:10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">보낸 아이디</th>
					<th style="width:10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">날짜</th>
					<th style="width:10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">&nbsp;&nbsp;<input type="checkbox" name="allCheck" id="allCheck"></th>
				</tr>
			</thead>
			<tbody>
			<!-- 글이 없을 경우 -->
			<c:if test="${listCount == 0}">
				<tr>
					<td colspan="6" align="center"><br>
					<br><strong style="color:red;">받은 쪽지가 없습니다.</strong><br>
					<br></td>
				</tr>
			</c:if>
			<c:if test="${listCount != 0}">
			<c:forEach var="me" varStatus="status" items="${list}">
				<tr>
					<td>${fn:length(list)-status.index}</td>
					<td><a href="messageviewpopup.do?msg_seq=${me.msg_seq}" 
					onclick="window.open(this.href, '_blank', 'width=500, height=430'); return false;">${me.msg_contents }</a></td>
					<td>${me.id }</td>
					<td>${me.msg_date }</td>
					<td>&nbsp;&nbsp;<input type="checkbox" name="RowCheck" value="${me.msg_seq}"></td>
				</tr>
			</c:forEach>
			</c:if>
			</tbody>
		</table>
	</form>
</div>
<div style="text-align:center;">
	<ul class="pagination" style="text-align: center;">
		<li><a href="#">1</a></li>
		<li class="active"><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
	</ul>
</div>