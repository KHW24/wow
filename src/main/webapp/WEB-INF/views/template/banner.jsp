<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script language="JavaScript">
   //쿠키저장 함수
   function setCookie( name, value, expiredays ) { 
      var todayDate = new Date(); 
      todayDate.setDate( todayDate.getDate() + expiredays ); 
      document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
   }

   $(document).ready(function(){
      $("#promotionBanner .btnClose").click(function(){
         //오늘만 보기 체크박스의 체크 여부를 확인 해서 체크되어 있으면 쿠키를 생성한다.
         if($("#chkday").is(':checked')){
            setCookie( "topPop", "done" , 1 ); 
            //alert("쿠키를 생성하였습니다.");
         }
         //팝업창을 위로 애니메이트 시킨다. 혹은 slideUp()
         //$('#promotionBanner').animate({height: 0}, 500);
         $('#promotionBanner').slideUp(500); 
      });
   });

</script>

</head>
<body>

<!-- Layer POPUP -->
<div id="promotionBanner">
   <div class="popContents">
      <h4 id="bah3">이웃의 솜씨 OPEN 기념</h4>
      <a href="#"><img id="baimg"src="${pageContext.request.contextPath}/resources/images/banner.PNG"></a>
      <div class="popClose">
      <input type="checkbox" value="checkbox" name="chkbox" id="chkday"/><label for="chkday"> 오늘 하루 그만보기 </label> 
        <a href="#none" class="btnClose" id="closebtn">닫기</a></div>
   </div>
</div>  

<script language="Javascript">
   //저장된 해당 쿠키가 있으면 창을 안 띄운다 없으면 뛰운다.
   cookiedata = document.cookie;    
   if ( cookiedata.indexOf("topPop=done") < 0 ){      
      document.all['promotionBanner'].style.display = "block";
      } 
   else {
      document.all['promotionBanner'].style.display = "none"; 
   }
</script>