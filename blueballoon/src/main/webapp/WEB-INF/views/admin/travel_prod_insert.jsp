<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample4_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    //����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<div align="center">
   <form name="f" action="travel_prod_insert" method="post"
      enctype="multipart/form-data">
      <table width="700" class="outline">
         <caption>��ǰ ���</caption>
         <tr>
            <th class="m2" width="20%">ī�װ�</th>
            <td>
               <select name="prod_cate" class="box">
                  <c:forEach var="dto" items="${cateList}">
                     <option value="${dto.cate_state}${dto.cate_city}">${dto.cate_state},${dto.cate_city}
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
            <td><input type="email" name="prod_email" class="box"></td>
         </tr>
         <tr>
            <th class="m2">�Ǹ��� ��ȭ��ȣ</th>
            <td><input type="text" name="prod_hp" class="box" 
            placeholder="��) 010-1111-2222"> " - " ���� ��ü �ڸ��� �Է����ּ���.</td>
         </tr>
         <tr>
            <th class="m2">��ǰ ����</th>
            <td><input type="text" name="prod_price" class="box"></td>
         </tr>
         <tr>
            <th class="m2">�̹���</th>
            <td><input type="file" name="prod_img"></td>
         </tr> 
         <tr>
					<th>�����ȣ</th>
					<td>
					   <input type="text" id="sample4_postcode" placeholder="�����ȣ">
						<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
						<input type="text" name="prod_address1" id="sample4_roadAddress" placeholder="���θ��ּ�">
						<input type="text" name="prod_address1" id="sample4_jibunAddress" placeholder="�����ּ�">
						<span id="guide" style="color:#999"></span>
					</td>
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
                  <option>��ǰ�� �з����ּ���.</option>
                  <option value="1">����</option>
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

