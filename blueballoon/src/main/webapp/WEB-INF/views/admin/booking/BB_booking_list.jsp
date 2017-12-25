<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css" rel="stylesheet" />
<h2 align="center">여행 예약 목록</h2>
<div align ="right">
	<table border="0" width="300">
		<tr>
			<th align="right"><a href="BB_prod_insert">추가</a></th>
		</tr>
	</table>
</div>
<script type="text/javascript">
	function checkDel(prod_num){
		var isDel = confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="BB_prod_delete?prod_num="+prod_num;
		}
	}
</script>
<div align="center">
	<table border="1" width="700">
	<caption>예약 목록</caption>
		<tr>
			<th width="10%">번호</th>
			<th width="15%">예약자 이메일</th> 
			<th width="20%">예약 일자</th>
			<th width="20%">패키지 여부</th>
			<th width="15%">결제 가격</th>
			<th width="10%">결제 일자</th>
			<th width="20%">수정</th>
		</tr>
		<tr>
		<c:if test="${empty ProductList}">
			<td colspan="7">등록된 예약 목록이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${ProductList}">
		<tr>
			<td align="right">${dto.prod_num}</td>
			<td align="center">${dto.prod_cate}</td>
			<td align="center">${dto.prod_name}</td>
			<td align="center">${dto.prod_phone}</td>
			<td align="center">${dto.prod_price}</td>
			<c:if test="${dto.prod_pick == 1}">
				<td align="center">지역</td>
			</c:if>
			<c:if test="${dto.prod_pick == 2}">
				<td align="center">맛집</td>
			</c:if>
			<c:if test="${dto.prod_pick == 3}">
				<td align="center">숙소</td>
			</c:if>
			<td><a href="BB_booking_edit">수정</a></td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="../bottom.jsp"%>