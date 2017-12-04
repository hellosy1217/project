<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
   <form name="f" action="trval_prod_insert" method="post"
      enctype="multipart/form-data">
      <table width="700" class="outline">
         <caption>��ǰ ���</caption>
         <tr>
            <th class="m2" width="20%">ī�װ�</th>
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
            <th class="m2">��ǰ��</th>
            <td><input type="text" name="prod_name" class="box"></td>
         </tr>
         <tr>
            <th class="m2">�Ǹ��� �̸���</th>
            <td><input type="text" name="prod_email" class="box"></td>
         </tr>
         <tr>
            <th class="m2">�Ǹ��� ��ȭ��ȣ</th>
            <td><input type="text" name="prod_hp" class="box"></td>
         </tr>
         <tr>
            <th class="m2">�ο�</th>
            <td>
               <select name="prod_person" class="box">
                  <option>�ּ� �ο��� �������ּ���.</option>
                  <option value="min">1</option>
               </select>
               <select name="prod_person" class="box">
                  <option>�ִ� �ο��� �������ּ���.</option>
                  <option value="max">2</option>
               </select>
            </td>
         </tr>
         <tr>
            <th class="m2">��ǰ ����</th>
            <td><input type="text" name="prod_price" class="box"></td>
         </tr>
         <tr>
            <th class="m2">��ǰ ���� ��¥</th>
            <td><input type="text" name="book_date" class="box"></td>
         </tr>
         <tr>
            <th class="m2">�̹���</th>
            <td><input type="file" name="prod_img"></td>
         </tr>
         <tr>
            <th class="m2">�ּ�</th>
            <td><input type="text" name="prod_address1" class="box"></td>
         </tr>
         <tr>
            <th class="m2">�� �ּ�</th>
            <td><input type="text" name="prod_address2" class="box"></td>
         </tr>
         <tr>
            <th class="m2">��ǰ ����</th>
            <td><textarea name="prod_content" rows="4" cols="60"></textarea></td>
         </tr>
         <tr>
            <th class="m2">��ǰ �з�</th>
            <td>
               <select name="prod_pick" class="box">
                  <option>��ǰ�� �������ּ���.</option>
                  <option value="1">���</option>
                  <option value="2">����</option>
                  <option value="3">����</option>
               </select>
            </td>
         </tr>
         <tr>
            <td colspan="2" class="m1"><input type="submit" value="��ǰ ���">
               <input type="reset" value="�� ��"></td>
         </tr>
      </table>
   </form>
</div>

