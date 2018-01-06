<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<script src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js"> </script >
<script type="text/javascript">
	function setSelected(){
		var prod_pick = ${getProduct.prod_pick};
		for (i = 0; i < document.getElementById("pick").options.length; i++) {
		    if (document.getElementById("pick").options[i].value == prod_pick) {
		        document.getElementById("pick").options[i].selected = "selected";
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
              <input type="text" name="prod_cate" value="${getProduct.prod_cate}">
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
            <td><a href="BB_prod_list">목록으로</a></td>
         </tr>
      </table>
   </form>
</div>

<%@ include file="../bottom.jsp"%>
