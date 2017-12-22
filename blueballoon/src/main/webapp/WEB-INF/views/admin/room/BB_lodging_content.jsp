<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<b>글내용 보기</b>
	<table border="1" width="500">
		<tr>
			<th width="15%">숙소 번호</th>
			<td align="center" width="35%">${getProduct.prod_num}</td>
			<th  width="15%">숙소 이름</th>
			<td align="center" width="35%">${getProduct.prod_name}</td>
		</tr>
		<tr>
			<th width="15%">담당자 메일</th>
			<td align="center" width="35%">${getProduct.prod_email}</td>
			<th bgcolor="yellow" width="15%">담당자 연락처</th>
			<td align="center" width="35%">${getProduct.prod_phone}</td>
		</tr>
		<tr>
			<th width="15%">숙소 주소</th>
			<td align="center" colspan="3">${getProduct.prod_road_address}</td>
			<td align="center" colspan="3">${getProduct.prod_detail_address}</td>
		</tr>
		<tr>
			<th  width="15%">숙소 최저가</th>
			<td align="center" colspan="3">${getProduct.prod_price}</td>
		</tr>
		<tr>
			<th width="15%" >이미지</th>
			<c:if test="${empty getProduct.prod_str_img}">
				<td colspan="3" align="center">"이미지가 없습니다."</td>
			</c:if>
			<c:if test="${not empty getProduct.prod_str_img}">
			<td colspan="3" align="center">
				<img src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_product3/${getProduct.prod_str_img}" width="80" height="80">
			</td>
			</c:if>
		</tr>
		<tr>
			<th width="15%">상세 내용</th>
			<td colspan="3">${getProduct.prod_content}</td>
		</tr>
		</table>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript">
	$(function() {
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		//시작일
		$('#fromDate').datepicker(
				{
					dateFormat : "yy-mm-dd",
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					buttonText : "날짜선택",
					dateFormat : "yy-mm-dd", // 날짜의 형식
					changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
					minDate : 0,
					maxDate : 180, // 0 : 오늘 이후 날짜 선택 불가 : 최대 선택 가능한 날짜.
					onClose : function(selectedDate) {
						// 시작일(fromDate) datepicker가 닫힐때
						// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
						$("#toDate").datepicker("option", "minDate",
								selectedDate);
					}
				});

		//종료일
		$('#toDate').datepicker(
				{
					dateFormat : "yy-mm-dd",
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					dateFormat : "yy-mm-dd",
					changeMonth : true,
					minDate : 0,
					maxDate : 180, // 오늘 이후 날짜 선택 불가
					onClose : function(selectedDate) {
						// 종료일(toDate) datepicker가 닫힐때
						// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
						$("#fromDate").datepicker("option", "maxDate",
								selectedDate);
					}
				});
	});
</script>
<div align="center">
   <form name="f" action="BB_room_insert" method="post" enctype="multipart/form-data">
      <table width="800">
         <caption>방 등록</caption>
         <tr>
            <th width="20%">숙소</th>
            <td>
               <select id="product" name="prod_num">
                  <c:if test="${empty cateList}">
                  	<option>등록된 카테고리가 없습니다.</option>
                  </c:if>
                  <c:forEach var="dto" items="${cateList}">
                     <option value="${dto.cate_state}-${dto.cate_city}">${dto.cate_state},${dto.cate_city}</option>
                  </c:forEach>
               </select>
            </td>
         </tr>
         <tr>
            <th>방 인원</th>
            <td>기준인원<select name="room_person">
            	<c:forEach var="per" begin="2" end="10" step="1">
                  <option value="${per}">${per}명</option>
             </c:forEach>
            </select></td>
            <td>최대인원 <select name="room_person">
            <c:forEach var="per" begin="2" end="15" step="1">
                  <option value="-${per}">${per}명</option>
             </c:forEach>
            </select> </td>
         </tr>
         <tr>
            <th>성수기 가격</th>
            <td><input type="text" name="room_peak_price"></td>
            <th>비 성수기 가격</th>
            <td><input type="text" name="prod_non_peak_price"></td>
         </tr>
         <tr>
            <th>주말 가격 증가율</th>
            <td><input type="text" name="prod_price" placeholder="백분율(%)로 기재요망"></td>
         </tr>
         <tr>
            <th>예약 가능한 기간</th>
            <td><input type="text" name="room_period" id="fromDate"></td>
            <td><input type="text" name="room_period" id="toDate"></td>
         </tr>
         <tr>
            <th> 할인률</th>
            <td> <select name="room_discount">
            <c:forEach var="per" begin="0" end="70" step="1">
                  <option value="${per}">${per}%</option>
             </c:forEach>
               </select>
            </td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input type="submit" value="방 등록">
               <input type="reset" value="취 소"></td>
         </tr>
      </table>
   </form>
</div>
<div align ="right">
<table border="0">
		<tr>
			<th align="right"><a href="BB_room_insert">숙소추가</a></th>
		</tr>
	</table>
</div>
<div align="center">
	<table border="1" width="700">
		<tr>
			<th width="10%">방 번호</th>
			<th width="10%">방 이름</th>
			<th width="15%">기준 인원 - 최대 인원</th> 
			<th width="15%">성수기 가격</th>
			<th width="15%">비 성수기 가격</th>
			<th width="15%">주말 가격 증가율</th>
			<th width="10%">예약 가능기간</th>
			<th width="20%">수정 | 삭제 </th>
		</tr>
		<tr>
		<c:if test="${empty roomList}">
			<td colspan="7">등록된 카테고리목록이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${roomList}">
		<tr>
			<td align="right">${dto.room_num}</td>
			<td align="right">${dto.room_name}</td>
			<td align="center">${dto.room_person}</td>
			<td align="center">${dto.room_peak_price}</td>
			<td align="center">${dto.room_non_peak_price}</td>
			<td align="center">${dto.room_week_preminum}</td>
			<td align="center">${dto.room_period}</td>
			<td align="center">${dto.room_offer}</td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="../bottom.jsp"%>