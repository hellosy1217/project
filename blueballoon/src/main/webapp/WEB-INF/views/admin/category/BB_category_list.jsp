<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function checkDel(cate_num){
		var isDel;
		swal({
		      title: "삭제하시겠습니까?", 
		      text: "삭제버튼을 누르시면 복구할 수 없습니다.", 
		      type: "warning",
		      showCancelButton: true,
		      confirmButtonColor: "#DD6B55",
		      confirmButtonText: "삭제",
		      cancelButtonText: "취소",
		      closeOnConfirm: true,
		      closeOnCancel: true,
		    } , function() {
		    	isDel = confirm();
		    	if(isDel){
		    		window.location.href="BB_category_delete?cate_num="+cate_num;	
		    	}
		    });
		/* var isDel = confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="BB_category_delete?cate_num="+cate_num;
		} */
	}
	function myAlertFunction(event) {
		  event.preventDefault()
		  swal({
		      title: "Remove book?",
		      text: "Watch out",
		      type: "warning",
		      showCancelButton: true,
		      confirmButtonColor: "#DD6B55",
		      confirmButtonText: "Yes.",
		      cancelButtonText: "No.",
		      closeOnConfirm: false,
		      closeOnCancel: false
		    },
		    function(isConfirm) {
		      if (isConfirm) {
		        swal({
		          title: "Deleted.",
		          text: "Done.",
		          type: "success"
		        }, function() {
		          $("#remove_book").submit();
		        });
		      } else {
		        swal("Cancelled", "Not done.", "error");
		      }
		    });
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