<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

<div align="center">
   <form name="f" action="BB_room_insert" method="post" enctype="multipart/form-data">
    <input type="hidden" name="prod_num" value="${getRoom.prod_num}">
      <table width="800">
         <caption>방 등록</caption>
         <tr>
            <th width="20%">숙소 명</th>
            <td>${getRoom.room_name}</td>
         </tr>
         <tr>
            <th width="20%">방 코드</th>
            <td>${getRoom.room_code}</td>
         </tr>
         <tr>
            <th>방 인원</th>
            <td>기준인원 ,최대인원</td>
            <td>${getRoom.room_person}</td>
         </tr>
         <tr>
            <th>성수기 가격</th>
            <td>${getRoom.room_peak_price}</td>
            <th>비 성수기 가격</th>
            <td>${getRoom.room_non_peak_price}</td>
         </tr>
         <tr>
            <th>주말 가격 증가율</th>
            <td> ${getRoom.room_week_price}</td>
         </tr>
         <tr>
            <th>예약 가능한 기간</th>
            <td>${getRoom.room_period}</td>
         </tr>
         <tr>
            <th> 할인률</th>
            <td>${getRoom.room_offer}</td>
         </tr>
         <tr>
            <th>방 상세 설명</th>
            <td><textarea>${getRoom.room_content}</textarea></td>
         </tr>
      </table>
   </form>
</div>
<%@ include file="../bottom.jsp"%>