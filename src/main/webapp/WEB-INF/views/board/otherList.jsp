<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="/readmore-js/readmore.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- css 파일 -->
	<link href="${pageContext.request.contextPath}/resources/css/otherlist.css"
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
            <!-- 프로필 이미지 & 다른 게시물 보기 링크 부분 -->
            <div class="imgdiv">
                <a href="#"><img id="pimg" src="./images/내정보.jpg"></a>
                <a href="#"><h5><strong>판매자님의 다른 게시물</strong></h5></a>
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
            <button type="button" id="more" class="btn btn-default">더보기</button>