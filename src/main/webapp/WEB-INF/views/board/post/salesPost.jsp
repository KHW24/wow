<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
 .page-title{
    text-align: center;
    line-height: 150px;
    font-size: 25px;
    font-weight: bold;
  }

  label{
    font-size: 16px;
  }
</style>
  <div class="container">
  <div class="page-title">
    게시글 작성
  </div>
<form class="form-horizontal" action="postWrite.do" method="POST">
<script>
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
</script>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
  <div class="form-group">
    <label for="category" class="col-sm-2 control-label">카테고리</label>
    <div class="col-sm-8">
      <select class="form-control input-lg" id="category" name="post_code">
      	<option name="post_code" value="food">음식</option>
        <option name="post_code" value="accessories">악세사리</option>
        <option name="post_code" value="pet" >애견용품</option>
        <option name="post_code" value="interior">인테리어소품</option>
        <option name="post_code" value="etc">기타</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="title" class="col-sm-2 control-label">제목</label>
    <div class="col-sm-8">
      <input type="text" class="form-control input-lg" id="title" name="post_title" />
    </div>
  </div>
  <div class="form-group">
    <label for="location" class="col-sm-2 control-label">지역</label>
    <div class="col-sm-8">
    <input type="text" class="form-control input-lg" id="location" name="post_address">
      <!-- <select class="form-control input-lg" id="loaction" name="location">
        <option>서울시 종로구</option>
        <option>서울시 중구</option>
        <option>서울시 용산구</option>
        <option>서울시 성동구</option>
        <option>서울시 광진구</option>
        <option>서울시 동대문구</option>
      </select> -->
    </div>
  </div>
  <div class="form-group">
    <label for="price" class="col-sm-2 control-label">가격</label>
    <div class="col-sm-8">
      <input type="text" class="form-control input-lg" id="price" name="post_price">
    </div>
  </div>
  <div class="form-group">
    <br>
    <div class="col-sm-offset-1">
      <textarea class="form-control" rows="20" id="comment" name="post_contents" placeholder="내용을 입력해주세요."></textarea>
    </div>
  </div>
  <div class="form-group">
    <label for="attached-images" class="col-sm-2 control-label">
      첨부파일
    </label>
    <input type="file" id="attached-images"/>
  </div>
  <div class="form-group">
    <label for="hashtags" class="col-sm-2 control-label">
      해쉬태그
    </label>
    <div class="col-sm-8">
    <input type="text" class="form-control input-lg" id="hashtags" name="post_tags" placeholder="#태그 선택">
   </div>
  </div>
  <div class="form-group">
    <br>
    <div class="col-sm-offset-1">
      <input type="hidden" value="<sec:authentication property="principal.member.id"/>" name="id">
      <input type="submit" class="btn btn-default" value="등록">&nbsp;&nbsp;
      <a href="boardList.do" class="btn btn-default">취소</a>
      <br><br><br><br>
  </div>
</form>
  </div>