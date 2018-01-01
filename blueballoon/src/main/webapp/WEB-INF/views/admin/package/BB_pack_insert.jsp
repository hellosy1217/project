<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js"> </script >
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
<script>
function replaceElement(){
	var select=document.getElementById('mySelectMenu');
	var chosenoption=select.options[select.selectedIndex];
	var oChild= document.getElementsByTagName('input');
	var br1= document.getElementsByTagName('br');
	var brLeng=br1.length;

	if (brLeng - chosenoption.value > 0) {
 		var temp = brLeng - chosenoption.value;
 		alert(temp);
 		for(var i=0; i<temp; i++){
  		alert("박스삭제" + i);
  		myform.removeChild(oChild[0]);
  		alert("줄바꿈삭제" + i);
  		myform.removeChild(br1[0]);
 		}		
	}

 	if (brLeng - chosenoption.value < 0) {
 		var temp = -(brLeng - chosenoption.value);
		 for(var i=0; i<temp; i++){
 		 	alert("줄바꿈" + i);
  			var br2 = document.createElement('br');
  			myform.appendChild(br2);
  			alert("박스추가" + i);
  			var oNewChild=document.createElement('input');
  			oNewChild.setAttribute("type", "text");
  			oNewChild.setAttribute("size", "6");
  			myform.appendChild(oNewChild);
 			}
		}
}
</script>
<script type="text/javascript">
		function check(){
			if (f.pack_title.value==""){
				swal(
						 'Oops...',
						 '패키지 이름을 입력해주세요!',
						 'error'
						)
				f.pack_title.focus()
				return false
			}
			if (f.pack_phone.value==""){
				swal(
						 'Oops...',
						 '담당자 번호를 입력해 주세요!',
						 'error'
						)
				f.pack_phone.focus()
				return false
			}
			if (f.pack_price.value==""){
				swal(
						 'Oops...',
						 '패키지 가격을 입력해 주세요!',
						 'error'
						)
				f.pack_price.focus()
				return false
			}
			if (f.pack_content.value==""){
				swal(
						 'Oops...',
						 '패키지 설명을 입력해 주세요!',
						 'error'
						)
				f.pack_content.focus()
				return false
			}
			return true
		}
	</script>
<div align="center">
	<form name="f" action="BB_pack_insert" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<table width="800">
			<caption>패키지 상품 등록</caption>
			<tr>
				<th width="10%">패키지 이름</th>
				<td><input type="text" name="pack_title"
					placeholder="ex.맛깔나는 서울맛집투어 "></td>
			</tr>
			<tr>
				<th width="10%">담당 이메일</th>
				<td><input type="email" name="pack_email"></td>
			</tr>
			<tr>
				<th width="10%">담당 전화</th>
				<td><input type="text" name="pack_phone"
					placeholder="담당자 번호 입력해주세요."></td>
			</tr>
			<tr>
				<th width="10%">패키지 이미지</th>
				<td><input type="file" name="pack_org_img"></td>
			</tr>
			<tr>
				<th width="10%">패키지 가격</th>
				<td><input type="text" name="pack_price"></td>
			</tr>
			<tr>
				<th>패키지 기간</th>
				<td><input type="text" name="pack_period" id="fromDate"></td>
				<td><input type="text" name="pack_period" id="toDate"></td>
			</tr>
			<tr>
				<th>패키지 일수</th>
				<td>
				<select name="pack_days" id="mySelectMenu" onchange="replaceElement()">
						<c:forEach var="per" begin="1" end="20" step="1">
							<option value="${per}">${per}일</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th width=15%>패키지 설명</th>
				<td><textarea name="pack_content" rows="6" cols="100"></textarea></td>
			</tr>
			<tr>
				<th width="10%">패키지 구성 요소</th>
				<td><input type="text" id="packagePick" name="pack_config"></td>
				<td colspan="2" align="center"><input type="submit" value="등록"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>