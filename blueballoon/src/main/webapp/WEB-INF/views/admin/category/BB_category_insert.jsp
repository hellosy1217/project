<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css" rel="stylesheet" />
<script src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js"> </script >
<script type="text/javascript">
	function categoryChange(e) {
		var city_0 = [ "강남구", "종로구", "마포구", "중구" ,"용산구","영등포구","송파구"];
		var city_1 = [ "평창시", "춘천시", "강릉시", "횡성시" ,"양양시"];
		var city_2 = [ "용인시", "파주시", "의정부시", "수원시", "인천광역시", "안산시", "하남시"];
		var city_3 = [ "부산광역시", "거제시", "통영시", "남해시", "대구광역시", "울산광역시","포항시" ,"경주시" ,"함양군"];
		var city_4 = ["광주광역시", "순천시", "여수시", "전주시", "남원시", "진도군"];
		var city_5 = ["제주시", "서귀포시" ];
		var city_6 = [ "대전광역시","보령시", "천안시", "청주시" ];
		var target = document.getElementById("city");

		if (e.value == "0")
			var d = city_0;
		else if (e.value == "1")
			var d = city_1;
		else if (e.value == "2")
			var d = city_2;
		else if (e.value == "3")
			var d = city_3;
		else if (e.value == "4")
			var d = city_4;
		else if (e.value == "5")
			var d = city_5;
		else if (e.value == "6")
			var d = city_6;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
</script>
<script type="text/javascript">
		function check(){
			if (f.cate_state.value==""){
				swal( 'Oops...', ' "도"카테고리를 선택해주세요!', 'error');
				f.cate_state.focus();
				return false;
			}
			if (f.cate_city.value==""){
				swal('Oops...', ' "시" 카테고리를 선택해주세요!', 'error');
				f.cate_city.focus();
				return false;
			}
			return true;
		}
	</script>

<div align="center">
	<form name="f" action="BB_category_insert" method="post" onsubmit="return check()">
		<table border="1" width="300">
			<caption>여행 지역 카테고리 등록</caption>
			<tr>
				<th>카테고리 도</th>
				<td>
				<select onchange="categoryChange(this)" name="cate_state">
						<option>등록할 '도'를 선택해 주세요.</option>
						<option value="0">서울특별시</option>
						<option value="1">강원도</option>
						<option value="2">경기도</option>
						<option value="3">경상도</option>
						<option value="4">전라도</option>
						<option value="5">제주도</option>
						<option value="6">충청도</option>
				</select> </td>
			</tr>
			<tr>
				<th>카테고리 시</th>
				<td>
				<select id="city" name="cate_city">
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="등록"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>