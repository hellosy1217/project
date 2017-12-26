<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   <form name="f" action="BB_room_insert" method="post">
    <input type="hidden" name="prod_num" value="${getRoom.prod_num}">
      <table width="800">
         <caption>방 수정</caption>
         <tr>
            <th width="20%">숙소 명</th>
            <td>
            <input type="text" name="room_name"  value="${getRoom.room_name}">
            </td>
         </tr>
         <tr>
            <th width="20%">방 코드</th>
            <td>
            <input type="text" name="room_code"  value="${getRoom.room_code}">
            </td>
         </tr>
         <tr>
            <th>방 인원</th>
            <td>기준인원<select name="room_person">
            	<c:forEach var="per" begin="2" end="10" step="1">
                  <option value="${per}">${per}명</option>
             </c:forEach>
            </select></td>
            <td>최대인원<select name="room_person">
            <c:forEach var="per" begin="2" end="15" step="1">
                  <option value="${per}">${per}명</option>
             </c:forEach>
            </select> </td>
         </tr>
         <tr>
            <th>성수기 가격</th>
            <td><input type="text" name="room_peak_price" value="${getRoom.room_peak_price}"></td>
            <th>비 성수기 가격</th>
            <td><input type="text" name="room_non_peak_price" value="${getRoom.room_non_peak_price}"></td>
         </tr>
         <tr>
            <th>주말 가격 증가율</th>
            <td> <select name="room_week_premium">
            <c:forEach var="per" begin="0" end="100" step="1">
                  <option value="${per}">${per}%</option>
             </c:forEach>
               </select>
            </td>
         </tr>
         <tr>
            <th>예약 가능한 기간</th>
            <td><input type="text" name="room_period" id="fromDate" value="${getRoom.room_period}"></td>
            <td><input type="text" name="room_period" id="toDate" value="${getRoom.room_period}"></td>
         </tr>
         <tr>
            <th> 할인률</th>
            <td><select name="room_offer">
            <c:forEach var="per" begin="0" end="70" step="1">
                  <option value="${per}">${per}%</option>
             </c:forEach>
               </select>
            </td>
         </tr>
         <tr>
            <th>방 상세 설명</th>
            <td><textarea name="room_content" rows="10" cols="100">${getRoom.room_period}</textarea></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input type="submit" value="방 수정">
               <input type="reset" value="취 소"></td>
         </tr>
      </table>
   </form>
</div>

<%@ include file="../bottom.jsp"%>