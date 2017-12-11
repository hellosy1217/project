<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
<form name="f" action="BB_pack_insert" method="post" enctype="multipart/form-data">
      <table width="800">
		<caption>패키지 상품 등록</caption>
		<tr>
			<th width="10%">패키지 이름</th>
			<td><input type="text" name="pack_title"></td>
		</tr>
		<tr>
			<th width="10%">담당 이메일</th>
			<td><input type="email" name="pack_email"></td>
		</tr>
		<tr>
			<th width="10%">패키지 가격</th>
			<td><input type="text" name="pack_price"></td>
		</tr>
		<tr>
			<th width="15%">패키지 기간</th>
			<td><input type="text" name="pack_period"></td>
		</tr>
		<tr>
			<th width= 15%>패키지 설명</th>
			<td><textarea name="pack_content" rows="6" cols="100"></textarea></td>
         </tr>
         
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>