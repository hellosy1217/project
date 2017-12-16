<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<div align="center">
	<h3>회원삭제</h3>
	<form name="f" action="BB_member_delete" method="post">
		<input type="hidden" name="member_num" value="${param.member_num}" />
		<table border="1" width="300">
			<tr bgcolor="yellow">
				<th>비밀번호를 입력해 주세요</th>
			</tr>
			<tr>
				<td align="center">비밀번호 : <input type="password"
					name="member_passwd" class="box">
				</td>
			</tr>
			<tr bgcolor="yellow">
				<td align="center"><input type="submit" value="글삭제"> <input
					type="button" value="글목록"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%> 

