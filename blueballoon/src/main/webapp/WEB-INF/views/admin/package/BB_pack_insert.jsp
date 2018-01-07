<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script
	src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js">
	
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/admin/js/admin1.js?ver=12"></script>
<script type="text/javascript">
	function addInput(inputNo) {
		var strInput = "";
		inputBox.innerHTML = "";
		for (var i = 1; i <= inputNo; i++) {
			strInput += "<textarea id='content'+i rows='6' cols='100'></textarea>&nbsp;&nbsp;";
		}
		inputBox.innerHTML = strInput;
	}

	function addInputTimes(inputNo) {
		var strInput = "";
		inputStart.innerHTML = "";
		for (var i = 1; i <= inputNo; i++) {
			strInput += "<input type='text' name='pack_start_date' class='datepicker'><br>";
		}
		inputStart.innerHTML = strInput;
		$(document).find("input[id=datepicker]").removeClass('hasDatepicker')
				.datepicker();
	}
</script>
<script type="text/javascript">
	function addRow(inputNo) {
		for (var i = 0; i < inputNo; i++) {
			$(".datepicker")
					.append(
							"<input type='text' name='pack_start_date' class='datepicker' value=''><br>");
			$(document).find("input[id=datepicker]").removeClass(
					'hasDatepicker').datepicker();
			$('.datepicker').each(function() {
				$(this).datepicker();
			});
		}
	}
</script>
<script type="text/javascript">
	function insert() {
		num = document.f.pack_days.value;
		var htm = '';
		for (var i = 1; i <= num; i++) {
			var c = 'content' + i;
			if (document.getElementById(c).value != '') {
				htm += document.getElementById(c).value;
				htm += '#@!,';
			}
		}
		document.f.pack_content.value = htm;
		check();
	}
	function check() {
		if (f.pack_title.value == "") {
			swal('Oops...', '패키지 이름을 입력해주세요!', 'error')
			f.pack_title.focus()
			return false
		}
		if (f.pack_phone.value == "") {
			swal('Oops...', '담당자 번호를 입력해 주세요!', 'error')
			f.pack_phone.focus()
			return false
		}
		if (f.pack_price.value == "") {
			swal('Oops...', '패키지 가격을 입력해 주세요!', 'error')
			f.pack_price.focus()
			return false
		}

		document.f.submit();
	}
</script>
<div align="center">
	<form name="f" action="BB_pack_insert" method="post"
		enctype="multipart/form-data">
		<table border="1">
			<caption>패키지 상품 등록</caption>
			<tr>
				<th>패키지 이름</th>
				<td><input type="text" name="pack_title"
					placeholder="ex.맛깔나는 서울맛집투어 "></td>
				<th>패키지 지역</th>
				<td><select id="category" name="pack_place">
						<option value="서울특별시">서울특별시</option>
						<option value="강원도">강원도</option>
						<option value="경기도">경기도</option>
						<option value="경상도">경상도</option>
						<option value="전라도">전라도</option>
						<option value="제주도">제주도</option>
						<option value="충청도">충청도</option>
				</select></td>
			</tr>
			<tr>
				<th>담당 이메일</th>
				<td><input type="email" name="pack_email"></td>
				<th>담당 전화</th>
				<td><input type="text" name="pack_phone"
					placeholder="담당자 번호 입력해주세요."></td>
			</tr>
			<tr>
				<th>패키지 이미지</th>
				<td><input type="file" name="pack_org_img"></td>
				<th>패키지 가격</th>
				<td><input type="text" name="pack_price"></td>
			</tr>
			<tr>
				<th>패키지 시작 날짜</th>
				<td><input type="text" name="pack_period" id="fromDate"></td>
				<th>패키지 끝 날짜</th>
				<td><input type="text" name="pack_period" id="toDate"></td>
			</tr>
			<tr>
				<th>패키지 출발 횟수</th>
				<td><select id="times" onchange="addInputTimes(this.value);">
						<c:forEach var="per" begin="1" end="10" step="1">
							<option value="${per}">${per}회</option>
						</c:forEach>
				</select></td>
				<th>패키지 출발일</th>
				<td id="inputStart"><input type="text" name="pack_period"
					class="datepicker"><br></td>
			</tr>
			<tr>
				<th>패키지 일수</th>
				<td><select name="pack_days" id="mySelectMenu"
					onchange="addInput(this.value);">
						<c:forEach var="per" begin="1" end="20" step="1">
							<option value="${per}">${per}일</option>
						</c:forEach>
				</select></td>
				<th>패키지 총인원</th>
				<td><select name="pack_person">
						<c:forEach var="per" begin="1" end="100" step="1">
							<option value="${per}">${per}명</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th colspan="2">일차 대로 패키지 설명을 작성해 주세요.</th>
			</tr>
			<tr>
				<th width=15%>패키지 설명</th>
				<td height="30" id="inputBox"><textarea rows="6" cols="100"
						id="content1"></textarea> <input type="hidden" name="pack_content"
					id="pack_con"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="등록"
					onclick="insert()">&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="취소">
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>