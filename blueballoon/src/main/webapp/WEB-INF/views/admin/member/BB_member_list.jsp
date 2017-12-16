<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- memberAll.jsp -->
<%@ include file="../top.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div align="center">
		<hr color="green" width="300">
		<h2>회 원 목 록 보 기</h2>
		<hr color="green" width="300">
		<table width="100%" class="outline">
			<tr>
				<th class="m3">번호</th>
				<th class="m3">이름</th>
				<th class="m3">프로필사진</th>
				<th class="m3">이메일</th>
				<th class="m3">전화번호</th>
				<th class="m3">생일</th>
				<th class="m3">성별</th>
				<th class="m3">가입일</th>
				<th class="m3">수정 | 삭제</th>
			</tr>
			<c:if test="${empty listMember}">
				<tr>
					<td colspan="7">등록된 회원이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${listMember}">
				<tr align="center">
					<td>${dto.member_num}</td>
					<td>${dto.member_name}</td>
					<td><img src="/blueballoon/resources/files/${dto.member_org_img}"
						width="80" height="60" /></td>
					<td>${dto.member_email}</td>
					<td>${dto.member_phone}</td>
					<td>${dto.member_birth}</td>
					<td>${dto.member_gender}</td>
					<td>${dto.member_reg_date}</td>
					<td><a href="member_passwd?member_num=${dto.member_num}">수정</a> |
						<a href="BB_member_delete?member_num=${dto.member_num}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
<%@ include file="../bottom.jsp"%> 

