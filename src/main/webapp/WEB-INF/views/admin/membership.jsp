<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function popupOpen(){
    var popUrl = "/project/messagepopup.do";	//팝업창에 출력될 페이지 URL
    var popOption = "width=450, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
        window.open(popUrl,"",popOption);
    };
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
    <th> 전체선택 <input type="checkbox"></th>
    <th>No.</th>
    <th>Name</th>
    <th>Value</th>
  </tr>
   <c:forEach items="${adminList}" var="admin">
  <tr>
    <td><input type="checkbox"></td>
    <td><c:out value="${admin.mshipSeq}" /></td>
    <td>${admin.id}</td>
    <fmt:formatDate value="${admin.mshipStart}"  var="mshipStart" pattern="yyyy-MM-dd"/>
    <fmt:formatDate value="${admin.mshipEnd}"  var="mshipEnd" pattern="yyyy-MM-dd"/>
   
    <td>${mshipStart} ~ ${mshipEnd}</td>  
  </tr>
      </c:forEach>
</table>
<br>
<a href="#" class="btn btn-default btn-lg">삭제
</a>
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
