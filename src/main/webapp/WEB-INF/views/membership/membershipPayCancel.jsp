<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>      
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/membershipPayCancel.css"/>
<!-- <script>
	function cancelConfrim() {
		var confirm = confirm('취소하시겠습니까?');
		var selV = $("#cancel").val();
		
		if(confirm === true) {
			location.href="payCancleSuccess.do?cancel="+selV;
		}else {
			return false;
		}
	}
</script> -->
	<br><br><br>
    <div class="container">
        <div class="div1"><br>
	            <h3 class="h3">멤버십을 <span class="purple">취소</span>합니다.</h3>
	            <hr><br>
	            <h3 class="h3 purple">
					<c:if test="${payment.mshipGrade eq 1}">
            			1주 멤버십
            		</c:if>
            		<c:if test="${payment.mshipGrade eq 2}">
            			2주 멤버십
            		</c:if>
            		<c:if test="${payment.mshipGrade eq 3}">
            			한달 멤버십
            		</c:if>	
				</h3>
	            <br><br>
	            <table>
	                <tr>
	                    <th><h4 class="h4">취소사유　</h4></th>
	                    <td>
	                        <select name="cancel" id="cancel">
	                            <option value="구매의사없음">구매의사 없음</option>
	                            <option value="멤버십변경">멤버십 변경</option>
	                            <option value="타사이트이용">타사이트이용</option>
	                        </select>
	                        </form>
	                    </td>
	                </tr>
	            </table>
	            <br><br><br>
	            <div class=center>
	            <a href="javascript:history.back()"><button class="btn btn1">뒤로가기</button></a>
	            <a href="payCancleSuccess.do"><button class="btn btn1" onclick = "return confirm('삭제하시겠습니까?')">취소요청</button></a>
	            <!-- onclick = "cancelConfrim()" -->
	            </div>
        </div>
    </div>
    <br><br><br><br><br>
