<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- css 파일 -->
	<link href="${pageContext.request.contextPath}/resources/css/boardlist.css"
		rel="stylesheet" type="text/css" />
<script>
$(function(){
    $('button[name="hbtn"]').on('click', function(){
       if($(this).hasClass('glyphicon glyphicon-heart-empty')== true){
          $(this).removeClass('glyphicon glyphicon-heart-empty');
          $(this).addClass('glyphicon glyphicon-heart');
       }else{
          $(this).removeClass('glyphicon glyphicon-heart');
          $(this).addClass('glyphicon glyphicon-heart-empty');
       }
    });
 });
</script>
        <!-- 전체 div -->
        <div class="wraps">
            <!-- 카테고리 드롭다운 -->
            <div class="dropdown" id="dropdown">
                <button class="btn btn-default" type="button" data-toggle="dropdown">Category
                <span class="caret"></span></button>
                <ul class="dropdown-menu">
                  <li><a href="#">Food</a></li>
                  <li><a href="#">Accessory</a></li>
                  <li><a href="#">Pet</a></li>
                  <li><a href="#">Interior</a></li>
                  <li><a href="#">etc</a></li>
                </ul>
            </div>
            <!-- 판매중/판매완료 라디오버튼 -->
            <div class="radiobtn">
                <input type="radio" name="goods" value="판매중"> &nbsp;판매중 &nbsp;&nbsp;
                <input type="radio" name="goods" value="판매완료"> &nbsp;판매완료
            </div> 
            <!-- 썸네일 게시물 리스트 -->
            <div class="fixed_img_col">
                <ul>
                    <!-- li가 게시물 하나하나 -->
                    <li>
                        <span class="thumb">
                            <em>카테고리명</em>
                            <a href="#"><img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/sample.jpg" alt=""></span>
                            <Strong>글 제목</Strong>
                        </a>
                        <p>작성자(or지역) 12-18(날짜)</p>
                        <p id="price">5,000원</p>
                        <button name="hbtn" id="hbtn" class="glyphicon glyphicon-heart-empty"></button>
                    </li>
                    <li>
                        <span class="thumb">
                            <em>카테고리명</em>
                            <a href="#"><img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/sample.jpg" alt=""></span>
                            <Strong>글 제목</Strong>
                        </a>
                        <p>작성자(or지역) 12-18(날짜)</p>
                        <p id="price">5,000원</p>
                        <button name="hbtn" id="hbtn" class="glyphicon glyphicon-heart-empty"></button>
                    </li>
                    <li>
                        <span class="thumb">
                            <em>카테고리명</em>
                            <a href="#"><img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/sample.jpg" alt=""></span>
                            <Strong>글 제목</Strong>
                        </a>
                        <p>작성자(or지역) 12-18(날짜)</p>
                        <p id="price">5,000원</p>
                        <button name="hbtn" id="hbtn" class="glyphicon glyphicon-heart-empty"></button>
                    </li>
                    <li>
                        <span class="thumb">
                            <em>카테고리명</em>
                            <a href="#"><img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/sample.jpg" alt=""></span>
                            <Strong>글 제목</Strong>
                        </a>
                        <p>작성자(or지역) 12-18(날짜)</p>
                        <p id="price">5,000원</p>
                        <button name="hbtn" id="hbtn" class="glyphicon glyphicon-heart-empty"></button>
                    </li>
                    <li>
                        <span class="thumb">
                            <em>카테고리명</em>
                            <a href="#"><img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/sample.jpg" alt=""></span>
                            <Strong>글 제목</Strong>
                        </a>
                        <p>작성자(or지역) 12-18(날짜)</p>
                        <p id="price">5,000원</p>
                        <button name="hbtn" id="hbtn" class="glyphicon glyphicon-heart-empty"></button>
                    </li>
                </ul>
            </div>
        </div>
            <button type="button" id="more" class="btn btn-default">더보기</button><br/>
            <button id="enbtn" type="button" class="btn btn-default">글 등록</button>