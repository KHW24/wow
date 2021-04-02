<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
 .btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
</style>

<div style="text-align: center;">
	<h2><strong>내 댓글 보기</strong></h2>
	<hr>
</div>
<div class="container" style="height: 700px">
	
	<form  action="myReplyDelete.do" method="post">
		<input type="submit" class="btn" value="삭제" style="margin-left: 83%;"/>
		
		<table style="margin-top:3%" class="table table-condensed">
			<thead>
				<tr>
					<th>NO</th>
					<th>CONTENT</th>
					<th>ID</th>
					<th>DELETE</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${myReplies}" var="myReply" varStatus="status">
			
				<tr>
					<td>${status.count}</td>
					<td><a href="postSellerView.do?no=${myReply.postNo}">${myReply.repContents }</a></td>
					<td>${myReply.id }</td>
				
					<td>
					<input type="checkbox" name="delNos" value="${myReply.repSeq}">
					
					</td>
				</tr>
				
			</c:forEach>
		
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
