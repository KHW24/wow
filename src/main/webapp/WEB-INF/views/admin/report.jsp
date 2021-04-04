<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <h3 class="margin"><b>신고 회원 관리</b></h3>
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
    <th>전체선택 <input type="checkbox"></th>
    <th>게시글 작성자</th>
    <th>작성자 총 신고 횟수</th>
    <th>게시글 번호</th>
    <th>신고내용</th>
  </tr>
  <c:forEach items="${alert}" var="alert">
	  <tr>
	    <td><input type="checkbox"></td>
	    <td>${alert.id}</td>
	    <td>${alert.member[0].alert_cnt}</td>
		<td><a href="postSellerView.do?no=${alert.postNo}">${alert.postNo}</a></td>
	    <td>${alert.alertContents }</td>
	  </tr>
    </c:forEach>
  <tr>
  	<td><button type="button" class="btn btn-default btn-sm">신고내역 삭제</td>
    <td><button type="button" class="btn btn-default btn-sm">쪽지 전송</td>
    <td col="5"><button type="button" class="btn btn-default btn-sm">회원 탈퇴</td>
  </tr>
</table>
<br>
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

