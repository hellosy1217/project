<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<script type="text/javascript">
	function setSelected(){
		function setSelected(){
			var prod_cate = ${getProduct.prod_cate};
			var state = prod_cate.split(",");
			alert(state);
			for (i = 0; i < document.getElementById("category").options.length; i++) {
			    if (document.getElementById("category").options[i].value == state) {
			        document.getElementById("category").options[i].selected = "selected";
			    }
		}
}
</script>
<div align="center">
   <form name="f" action="BB_prod_edit" method="post" enctype="multipart/form-data">
   <input type="hidden" name="prod_num" value="${getProduct.prod_num}">
      <table width="700">
         <caption>상품 수정</caption>
         <tr>
            <th width="20%">카테고리</th>
            <td>
               <select id="category" name="prod_cate">
                  <c:forEach var="dto" items="${cateList}">
                     <option value="${dto.cate_state}-${dto.cate_city}">${dto.cate_state},${dto.cate_city}</option>
                  </c:forEach>
               </select>
            </td>
         </tr>
         <tr>
            <th>상품명</th>
            <td><input type="text" name="prod_name" value="${getProduct.prod_name }"></td>
         </tr>
         <tr>
            <th>판매자 이메일</th>
            <td><input type="email" name="prod_email" value="${getProduct.prod_email}"></td>
         </tr>
         <tr>
            <th>판매자 전화번호</th>
            <td><input type="text" name="prod_phone"
            placeholder="예) 010-1111-2222" value="${getProduct.prod_phone}"> " - " 포함 전체 자리를 입력해주세요.</td>
         </tr>
         <tr>
            <th>상품 가격</th>
            <td><input type="text" name="prod_price" value="${getProduct.prod_price}"></td>
         </tr>
         <tr>
            <th>이미지</th>
            <td><input type="file" name="prod_org_img" value="${getProduct.prod_org_img}">${getProduct.prod_org_img}<img src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_product${getProduct.prod_pick}/${getProduct.prod_str_img}"></td>
         </tr> 
         <tr>
					<th>우편번호</th>
					<td>
					   <input type="text" name="prod_post_number" id="sample4_postcode" placeholder="우편번호" value="${getProduct.prod_post_number}">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="prod_road_address" id="sample4_roadAddress" placeholder="도로명주소" value="${getProduct.prod_road_address}">
						<input type="text" name="prod_old_address" id="sample4_jibunAddress" placeholder="지번주소" value="${getProduct.prod_old_address}">
						<span id="guide" style="color:#999"></span>
					</td>
				</tr>
         <tr>
            <th>상세 주소</th>
            <td><input type="text" name="prod_detail_address" value="${getProduct.prod_detail_address}"></td>
         </tr>
         <tr>
            <th>상품 정보</th>
            <td><textarea name="prod_content" rows="4" cols="60"> ${getProduct.prod_content}</textarea></td>
         </tr>
         <tr>
            <th>상품 분류</th>
            <td>
               <select name="prod_pick" id="pick">
                   	<option>상품을 분류해주세요.</option>
                 	<option value="1" <c:if test="${getProduct.prod_pick eq '1'}">selected </c:if>>지역</option>
                  	<option value="2" <c:if test="${getProduct.prod_pick eq '2'}">selected </c:if>>맛집</option>
                  	<option value="3" <c:if test="${getProduct.prod_pick eq '3'}">selected </c:if>>숙소</option>
               </select>
            </td>
         </tr>
         <tr>
            <td colspan="2"><input type="submit" value="상품 수정">
               <input type="reset" value="취 소"></td>
         </tr>
      </table>
   </form>
</div>

<%@ include file="../bottom.jsp"%>
