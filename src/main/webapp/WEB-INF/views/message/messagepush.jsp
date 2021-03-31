<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		$('#allSelects').click(function(){
			if($('#allSelects').prop('checked') == true) {
				$('input[name=select]').prop('checked',true);
			} else {
				$('input[name=select]').prop('checked',false);
			}
		});
	});
	
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
		<label><input type="radio" name="message" value="mepost" onclick="location.href='message.do?get_id=<sec:authentication property="principal.member.id"/>'" >받은 쪽지함 </label> 
		<label><input type="radio" name="message" value="mepush" onclick="location.href='messagepush.do?get_id=<sec:authentication property="principal.member.id"/>" checked> 보낸 쪽지함</label><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
		<input type="submit" class="btn" value="삭제" style="margin-left: 90.7%;">
		<table class="table table-condensed" >
			<thead>
				<tr>
					<th>글번호</th>
					<th>내용</th>
					<th>보낸 아이디</th>
					<th>날짜</th>
					<th>&nbsp;&nbsp;<input type="checkbox" name="select" id="allSelects"></th>
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
			<c:if test="${listCount != 0}">
			<c:forEach var="me" items="${pushlist}">
				<tr>
					<td>${me.msg_seq }</td>
					<td><a href="messageviewpopupUp.do?msg_seq=${me.msg_seq}" 
					onclick="window.open(this.href, '_blank', 'width=500, height=430'); return false;">${me.msg_contents }</a></td>
					<td>${me.get_id }</td>
					<td>${me.msg_date }</td>
					<td>&nbsp;&nbsp;<input type="checkbox" name="select"></td>
				</tr>
			</c:forEach>
			</c:if>
			</tbody>
		</table>
		
	</form>
</div>
<div style="text-align: center;">
	<ul class="pagination" style="text-align: center;">
		<li><a href="#">1</a></li>
		<li class="active"><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
	</ul>
</div>