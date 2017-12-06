<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ include file="../top.jsp"%>
<<<<<<< HEAD
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css" rel="stylesheet" />
=======
>>>>>>> branch 'master' of https://github.com/hellosy1217/project.git
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function checkDel(cate_num){
		var isDel = confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="bb_category_delete?cate_num="+cate_num;
		}
	}
</script>
<div align="center">
	<table border="1" width="400">
		<caption>여행 지역 카테고리목록</caption>
		<tr>
			<th width="10%">번호</th>
			<th width="30%">지역 카테고리 도</th>
			<th width="30%">지역 카테고리 시</th>
			<th width="20%">수정 | 삭제</th>
			<th width="10%"><a href="bb_category_insert">추가</a></th>
		</tr>
		<tr>
		<c:if test="${empty bbCategory}">
			<td colspan="5">등록된 카테고리목록이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${bbCategory}">
		<tr>
			<td align="right">${dto.cate_num}</td>
			<td align="center">${dto.cate_state}</td>
			<td align="center">${dto.cate_city}</td>
			<td>
			<a href="bb_category_edit?cate_num=${dto.cate_num}">수정</a> | 
			<a href="javascript:checkDel('${dto.cate_num}')">삭제</a></td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="../bottom.jsp"%>