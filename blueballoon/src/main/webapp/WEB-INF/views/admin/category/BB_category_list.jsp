<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp"%>
<script src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js"> </script >
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function checkDel(cate_num){
		swal({
			  title: '삭제를 원하세요?',
			  text: "삭제하시면 다시 복구할 수 없습니다!",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#DD6B55',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소',
			  confirmButtonClass: 'btn btn-success',
			  cancelButtonClass: 'btn btn-danger',
			  buttonsStyling: false,
			  reverseButtons: true
			}).then((result)=>{
			  if (result.value) {
			    swal(
			      '성공!',
			      '카테고리가 삭제되었습니다.',
			      'success'
			    ).then(function () {
			    	//여기에 ajax가 통신되면 굳이 redirect 하는 시간이 준다.. 이건 추후에 생각!!
		            location.replace('BB_category_delete?cate_num='+cate_num);
		          });
			  // result.dismiss can be 'cancel', 'overlay',
			  // 'close', and 'timer'
			  } else if (result.dismiss === 'cancel') {
			    swal(
			      '취소!',
			      '카테고리 삭제를 취소합니다.',
			      'error'
			    )
			  }
			})
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
			<th width="10%"><a href="BB_category_insert">추가</a></th>
		</tr>
		<tr>
		<c:if test="${empty BBCategory}">
			<td colspan="5">등록된 카테고리목록이 없습니다.</td>
		</c:if>
		</tr>	
		<c:forEach var="dto" items="${BBCategory}">
		<tr>
			<td align="right">${dto.cate_num}</td>
			<td align="center">${dto.cate_state}</td>
			<td align="center">${dto.cate_city}</td>
			<td>
			<a href="BB_category_edit?cate_num=${dto.cate_num}">수정</a> | 
			<a href="javascript:checkDel('${dto.cate_num}')">삭제</a></td>
		</tr>
		</c:forEach>	
	</table>
</div>
<%@ include file="../bottom.jsp"%>