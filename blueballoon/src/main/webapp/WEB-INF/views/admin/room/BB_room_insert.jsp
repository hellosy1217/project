<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script>
$(function() {
	  $( "#testDatepicker" ).datepicker({
	        showOn: "both", 
	        buttonImage: "button.png", 
	        buttonImageOnly: true 
	  });
	});
</script>
<div align="center">
   <form name="f" action="BB_room_insert" method="post" enctype="multipart/form-data">
      <table width="800">
         <caption>방 등록</caption>
         <tr>
            <th width="20%">숙소</th>
            <td>
               <select id="product" name="prod_num">
                  <c:if test="${empty cateList}">
                  	<option>등록된 카테고리가 없습니다.</option>
                  </c:if>
                  <c:forEach var="dto" items="${cateList}">
                     <option value="${dto.cate_state}-${dto.cate_city}">${dto.cate_state},${dto.cate_city}</option>
                  </c:forEach>
               </select>
            </td>
         </tr>
         <tr>
            <th>방 인원</th>
            <td>기준인원<select name="room_person">
            	<option value="2">2</option>
            	<option value="3">3</option>
            	<option value="4">4</option>
            	<option value="5">5</option>
            	<option value="6">6</option>
            	<option value="7">7</option>
            	<option value="8">8</option>
            	<option value="9">9</option>
            	<option value="10">10</option>
            </select></td>
            <td>최대인원 <select name="room_person">
            	<option value="2">2</option>
            	<option value="3">3</option>
            	<option value="4">4</option>
            	<option value="5">5</option>
            	<option value="6">6</option>
            	<option value="7">7</option>
            	<option value="8">8</option>
            	<option value="9">9</option>
            	<option value="10">10</option>
            </select> </td>
         </tr>
         <tr>
            <th>성수기 가격</th>
            <td><input type="text" name="room_peak_price"></td>
            <th>비 성수기 가격</th>
            <td><input type="text" name="prod_non_peak_price"></td>
         </tr>
         <tr>
            <th>주말 가격 증가율</th>
            <td><input type="text" name="prod_price" placeholder="백분율(%)로 기재요망"></td>
         </tr>
         <tr>
            <th>예약 가능한 기간</th>
            <td><input type="text" name="room_period" id="testDatepicker"></td>
         </tr>
         <tr>
            <th> 할인률</th>
            <td> <select name="room_discount">
                  <option value="0">0%</option>
                  <option value="1">1%</option>
                  <option value="2">2%</option>
                  <option value="3">3%</option>
                  <option value="4">4%</option>
                  <option value="5">5%</option>
                  <option value="6">6%</option>
                  <option value="7">7%</option>
                  <option value="8">8%</option>
                  <option value="9">9%</option>
                  <option value="10">10%</option>
               </select>
            </td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input type="submit" value="방 등록">
               <input type="reset" value="취 소"></td>
         </tr>
      </table>
   </form>
</div>

<%@ include file="../bottom.jsp"%>
