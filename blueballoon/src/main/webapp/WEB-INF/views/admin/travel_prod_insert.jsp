<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
   <form name="f" action="trval_prod_insert" method="post"
      enctype="multipart/form-data">
      <table width="700" class="outline">
         <caption>상품 등록</caption>
         <tr>
            <th class="m2" width="20%">카테고리</th>
            <td>
               <select name="prod_cate" class="box">
                  <c:forEach var="dto" items="${cateList}">
                     <option value="">
                        
                     </option>
                  </c:forEach>
               </select>
            </td>
         </tr>
         <tr>
            <th class="m2">상품명</th>
            <td><input type="text" name="prod_name" class="box"></td>
         </tr>
         <tr>
            <th class="m2">판매자 이메일</th>
            <td><input type="text" name="prod_email" class="box"></td>
         </tr>
         <tr>
            <th class="m2">판매자 전화번호</th>
            <td><input type="text" name="prod_hp" class="box"></td>
         </tr>
         <tr>
            <th class="m2">인원</th>
            <td>
               <select name="prod_person" class="box">
                  <option>최소 인원을 선택해주세요.</option>
                  <option value="min">1</option>
               </select>
               <select name="prod_person" class="box">
                  <option>최대 인원을 선택해주세요.</option>
                  <option value="max">2</option>
               </select>
            </td>
         </tr>
         <tr>
            <th class="m2">상품 가격</th>
            <td><input type="text" name="prod_price" class="box"></td>
         </tr>
         <tr>
            <th class="m2">상품 예약 날짜</th>
            <td><input type="text" name="book_date" class="box"></td>
         </tr>
         <tr>
            <th class="m2">이미지</th>
            <td><input type="file" name="prod_img"></td>
         </tr>
         <tr>
            <th class="m2">주소</th>
            <td><input type="text" name="prod_address1" class="box"></td>
         </tr>
         <tr>
            <th class="m2">상세 주소</th>
            <td><input type="text" name="prod_address2" class="box"></td>
         </tr>
         <tr>
            <th class="m2">상품 정보</th>
            <td><textarea name="prod_content" rows="4" cols="60"></textarea></td>
         </tr>
         <tr>
            <th class="m2">상품 분류</th>
            <td>
               <select name="prod_pick" class="box">
                  <option>상품을 선택해주세요.</option>
                  <option value="1">경로</option>
                  <option value="2">맛집</option>
                  <option value="3">숙소</option>
               </select>
            </td>
         </tr>
         <tr>
            <td colspan="2" class="m1"><input type="submit" value="상품 등록">
               <input type="reset" value="취 소"></td>
         </tr>
      </table>
   </form>
</div>

