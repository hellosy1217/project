<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
	function categoryChange(e) {
		var city_0 = [ "강남구", "종로구", "마포구", "중구" ,"용산구"];
		var city_1 = [ "평창시", "춘천시", "강릉시", "횡성시" ,"양양시"];
		var city_2 = [ "용인시", "파주시", "의정부시", "수원특별시", "인천광역시" ];
		var city_3 = [ "부산광역시", "거제시", "통영시", "남해시", "대구광역시", "울산광역시"  ];
		var city_4 = ["광주광역시", "춘천시", "여수시", "전주시", "남원시"];
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
			opt.value = d[x]
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
</script>
<div align="center">
	<form name="f" action="travel_category_edit" method="post">
	<input type="hidden" name="cate_num" value="${param.cate_num}">
		<table border="1" width="300">
			<caption>여행 지역 카테고리 수정</caption>
			<tr>
				<th bgcolor="yellow">카테고리 도</th>
				<td>
				<select onchange="categoryChange(this)" name="cate_state">
						<option>등록할 도를 선택해주세요.</option>
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
				<th bgcolor="yellow">카테고리 시</th>
				<td>
				<!-- selected 연구 더해보기...ㅠㅠ -->
				<select id="city" name="cate_city">
						<option>수정할 시를 선택해주세요.</option>
						<c:forEach var="dto" items="${getCategory}"> 
							<option value="${dto.cate_city}">${dto.cate_city}</option>
								<c:if test="${dto.cate_city == getCategory.cate_city }"></c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="m2"><input type="submit"
					value="수정"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>