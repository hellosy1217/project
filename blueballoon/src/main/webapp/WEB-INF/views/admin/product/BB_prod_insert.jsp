<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js"> </script >
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
		function check(){
			if (f.prod_name.value==""){
				swal(
						 '이런...',
						 '여행 상품 이름을 입력해주세요!',
						 'error'
						)
				f.prod_name.focus()
				return false
			}
			if (f.prod_phone.value==""){
				swal(
						 '이런...',
						 '전화 번호를 입력해 주세요!',
						 'error'
						)
				f.prod_phone.focus()
				return false
			}
			if (f.prod_price.value==""){
				swal(
						 '이런...',
						 '가격을 입력해 주세요!',
						 'error'
						)
				f.prod_price.focus()
				return false
			}
			if (f.prod_org_img.value==""){
				swal(
						 '이런...',
						 '사진을 등록해 주세요!',
						 'error'
						)
				f.prod_org_img.focus()
				return false
			}
			if (f.prod_cate.value==""){
				swal(
						 '이런...',
						 '카테고리를 입력해 주세요!',
						 'error'
						)
				f.prod_cate.focus();
				return false
			}
			if (f.prod_post_number.value=="" || f.prod_road_address.value==""){
				swal(
						 '이런...',
						 '주소를 입력해 주세요!',
						 'error'
						)
				f.prod_post_number.focus();
				f.prod_road_address.focus();
				return false;
			}
			/* if(f.prod_content.value=""){
				swal(
						 '이런...',
						 '상품 내용을 입력해 주세요!',
						 'error'
						)
				f.prod_content.focus();
				return false;
			} */
			return true
		}
	</script>
<div align="center">
   <form name="f" action="BB_prod_insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
      <table width="700">
         <caption>상품 등록</caption>
         <tr>
            <th width="20%">여행 상품 지역</th>
            <td>
               <select id="category" name="prod_cate">
                  <c:forEach var="cate" items="${cateList}">
                  	<option value="${cate.cate_state},${cate.cate_city}">${cate.cate_state},${cate.cate_city}</option>
                  	</c:forEach>
               </select>
            </td>
         </tr>
         <tr>
            <th>상품명</th>
            <td><input type="text" name="prod_name"></td>
         </tr>
         <tr>
            <th>판매자 이메일</th>
            <td><input type="email" name="prod_email"></td>
         </tr>
         <tr>
            <th>판매자 전화번호</th>
            <td><input type="text" name="prod_phone"
            placeholder="예) 010-1111-2222"> " - " 포함 전체 자리를 입력해주세요.</td>
         </tr>
         <tr>
            <th>상품 가격</th>
            <td><input type="text" name="prod_price"></td>
         </tr>
         <tr>
            <th>이미지</th>
            <td><input type="file" name="prod_org_img"></td>
         </tr> 
         <tr>
					<th>우편번호</th>
					<td>
					   <input type="text" name="prod_post_number" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="prod_road_address" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" name="prod_old_address" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999"></span>
					</td>
				</tr>
         <tr>
            <th>상세 주소</th>
            <td><input type="text" name="prod_detail_address" ></td>
         </tr>
         <tr>
            <th>상품 정보</th>
            <td><textarea name="prod_content" rows="10" cols="100"></textarea></td>
         </tr>
         <tr>
            <th>상품 분류</th>
            <td>
               <select name="prod_pick">
                  <option>상품을 분류해주세요.</option>
                  <option value="1">지역</option>
                  <option value="2">맛집</option>
                  <option value="3">숙소</option>
               </select>
            </td>
         </tr>
         <tr>
            <td colspan="2"><input type="submit" value="상품 등록">
               <input type="reset" value="취 소"></td>
         </tr>
      </table>
   </form>
</div>

<%@ include file="../bottom.jsp"%>
