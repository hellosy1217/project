<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>회원수정</title>
<script type="text/javascript">
		function check(){
			if (f.member_passwd.value==""){
				alert("비밀번호를 입력하세요")
				f.passwd.focus()
				return
			}
			document.f.submit()
	}
	function checkExt()
	{

	    var IMG_FORMAT = "\.(bmp|gif|jpg|jpeg|png)$";

	    if((new RegExp(IMG_FORMAT, "i")).test(document.f.member_org_img.value)) return true;

	    alert("이미지 파일만 첨부하실 수 있습니다.   ");

	    return false;
	}
	</script>
</head>

<body onload="f.member_name.focus()">
	<form name="f" method="POST" action="BB_member_edit"
		enctype="multipart/form-data">
		<input type="hidden" name="member_num" value="${getMember.member_num}">
		<table width="550" align="center" class="outline">
			<tr>
				<td colspan="2" align=center class="m2">회원수정</td>
			</tr>
			<tr>
				<td width="150" class="m3">이름</td>
				<td class="m3"><input type="text" name="member_name"
					class="box" value="${getMember.member_name}"></td>
			<tr>
				<th bgcolor="yellow" width="20%">프로필사진</th>
				<td><input type="file" name="member_org_img" size="50"
					onchange="checkExt()"></td>
			</tr>
			<tr>
				<td width="150" class="m3">이메일</td>
				<td class="m3"><input type="text" name="member_email"
					class="box" value="${getMember.member_email}"></td>
			<tr>
				<td width="150" class="m3">전화번호</td>
				<td class="m3"><input type="text" name="member_phone"
					class="box" value="${getMember.member_phone}"></td>
			</tr>
			<tr>
				<td width="150" class="m3">생일</td>
				<td class="m3"><input type="text" name="member_birth"
					class="box" value="${getMember.member_birth}"></td>

			</tr>
			<tr>
				<td width="150" class="m3">성별</td>
				<td class="m3"><input type="text" name="member_gender"
					class="box" value="${getMember.member_gender}"></td>
			</tr>
			<tr>
				<td width="150" class="m3">비밀번호</td>
				<td class="m3"><input type="password" name="member_passwd"
					value="${getMember.member_passwd }" class="box"></td>
			</tr>
			<tr>
				<td width="150" class="m3">비밀번호확인</td>
				<td class="m3"><input type="password" name="member_ck_passwd"
					class="box"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a href="javascript:check()">[수정]</a>
					<a href="#">[취소]</a></td>
			</tr>
		</table>
	</form>
</body>
</html>