<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- memberAll.jsp -->
<%@ include file="../top.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css" rel="stylesheet" />
	<div align="center" class="c">
		<hr color="green" width="300">
		<h2>회 원 목 록 보 기</h2>
		<hr color="green" width="300">
		<table width="1000" border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>프로필사진</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>생일</th>
				<th>성별</th>
				<th>가입일</th>
				<th>수정 | 삭제</th>
				<th>메일 발송</th>
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
					<td>	<c:choose>
							<c:when test="${empty dto.member_str_img}">
								<img src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/img/person.jpg" width="85" height="65">
							</c:when>
							<c:otherwise>
							<img src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_member/${dto.member_str_img}" width="85" height="65">
							</c:otherwise>
						</c:choose>
					</td>
					<td>${dto.member_email}</td>
					<td>${dto.member_phone}</td>
					<td>${dto.member_birth}</td>
					<td>${dto.member_gender}</td>
					<td>${dto.member_reg_date}</td>
					<td><a href="member_passwd?member_num=${dto.member_num}">수정</a> |
						<a href="BB_member_delete?member_num=${dto.member_num}">삭제</a></td>
					<td><a href="BB_member_mail?member_email=${dto.member_email}">메일 보내기</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
<%@ include file="../bottom.jsp"%> 

