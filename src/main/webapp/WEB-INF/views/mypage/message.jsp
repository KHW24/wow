<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
*{text-align:center;}
 .btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
   th {text-align:center;}
</style>

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
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
		<input type="submit" class="btn" value="삭제" style="margin-left: 79%;">
		<table class="table table-condensed" >
			<thead >
				<tr>
					<th>NO</th>
					<th>CONTENT</th>
					<th>NAME</th>
					<th>DATE</th>
					<th>SELECT</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>구매할랭</td>
					<td>또치</td>
					<td>2021-03-29</td>
					<td><input type="checkbox" name="messageDle"></td>
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