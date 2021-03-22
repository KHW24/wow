<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
 .btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
</style>

<div style="text-align: center;">
	<h2>댓글 보기</h2>
	<hr>
</div>
<div class="container" style="height: 700px">
	<form style="margin-top:3%">
		<input type="submit" class="btn" value="삭제" style="margin-left: 83%;">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th>NO</th>
					<th>CONTENT</th>
					<th>NAME</th>
					<th>DELETE</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>구매할랭</td>
					<td>또치</td>
					<td><input type="checkbox"></td>
				</tr>
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
