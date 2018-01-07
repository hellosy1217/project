<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>My Member Settings on BlueBalloon - BlueBalloon</title>
<link rel="manifest" href="/manifest.json">
<link
	href="${pageContext.request.contextPath}/resources/user/member/css/edit1.css?ver=1"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/user/member/css/edit2.css?ver=1"
	rel="stylesheet" type="text/css" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/js/responsive.min.js"></script>
<script src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js"> </script >
<script type="text/javascript">
	var js_params = {
		"pending_count" : 0,
		"pending_date" : false,
		"balance" : "0.00",
		"sandbox" : false,
		"errors" : false,

	};

	var IntProfileSettings = setInterval(function() {
		if (typeof $ == 'function') {
			clearInterval(IntProfileSettings);
			$(document).ready(function() {
				new ProfileSettings(js_params).init();
			});
		}
	}, 10);
</script>
<script type="text/javascript">
	function changePasswd() {
		alert("123") return false;
		if(f.newPasswd1.value=""){
			swal(
					 '이런...',
					 '비밀번호를 입력칸이 비었어요!',
					 'error'
					)
			f.newPasswd1.focus()
			return false
		}
		if(f.newPasswd2.value=""){
			swal(
					 '이런...',
					 '비밀번호 재 입력이 비었어요!',
					 'error'
					)
			f.newPasswd2.focus()
			return false
		}
		document.f.submit();
	}
</script>
</head>
<body class=" ">
	<%@include file="../../header2.jsp"%>
	<c:if test="${req eq 'close'}">
		<c:if test="${!empty msg}">
			<script type="text/javascript">
				alert("${msg}");
			</script>
		</c:if>
		<script type="text/javascript">
			if (window.opener && !window.opener.closed)
				window.opener.location = '${url}';
			window.open("about:blank", "_self").close();
		</script>
	</c:if>
	<div id="fb-root"></div>
	<div id="content" class="clearfix profile" style="padding-top: 20px;">
		<div id="content_details"
			class="clearfix profile profile-settings container-fluid">
			<div class="row-fluid">
				<div class="span8 settings-left">
					<div class="profile-left span12" id="block-edit">
						<h2>내 정보 수정</h2>
						<form name ="editMyprofile" method="post" action="member_edit"  enctype="multipart/form-data">
						<input type="hidden" name="member_num" value="${getMember.member_num}">
							<div class="form">
								<div class="row">
									<div class="title">프로필 사진</div>
									<div class="value">
										<input type="file" name="userpick" /><br />
									</div>
								</div>
								<div class="row">
									<div class="title">이름</div>
									<div class="value">
										<input type="text" name="member_name" value="${getMember.member_name}" />
									</div>
								</div>
								<div class="row">
									<div class="title">Email</div>
									<div class="value">
										<input type="text" disabled value="${getMember.member_email}"/>
										<input type ="hidden" name="member_email" vlaue="${getMember.member_email}">
									</div>
								</div>
								<div class="row">
									<div class="title">비밀번호</div>
									<div class="value">
										<input type="text" disabled value="${pwlen}"/><a href="#password_popup" id="password_link">변경</a>
									</div>
								</div>
								<div class="row">
									<div class="title">휴대전화</div>
									<div class="value">
										<input type="text" name="member_phone" value="${getMember.member_phone}" />
									</div>
								</div>
								<div class="row">
									<div class="title">생년월일</div>
									<div class="value">
										<input type="text" name="member_birth" value="${getMember.member_birth}"
											id="date" />
									</div>
								</div>
								<div class="row">
									<div class="title">성별</div>
									<div class="value">
										<select name="member_gender">
										<option value="">-- 선택 --</option>
											<option value="male" <c:if test="${getMember.member_gender eq 'male'}">selected </c:if>>남성</option>
											<option value="female" <c:if test="${getMember.member_gender eq 'female'}">selected </c:if>>여성</option></select>
									</div>
								</div>
							</div>
							<div class="footer">
								<input type="hidden" name="action" value="save_info" /><input
									type="submit" class="button button-blue" value="저장하기" />
							</div>
						</form>
					</div>
					<div class="profile-left span12" id="block-logout"
						style="margin-bottom: 50px">
						<h2>로그아웃</h2>
						<p>BlueBalloon에서 로그아웃하시면 더 이상 BlueBalloon의 모든 기능을 사용할 수 없습니다.</p>
						<div class="footer">
							<a href="/travellers/logout?type=web">
							<input type="submit" class="button button-grey" value="로그아웃" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="hidden">
			<div id="password_popup" class="clearfix popup">
				<form name="f" id="change_password" onsubmit="return false" method="POST">
					<div>
						<strong>1.</strong> 새로운 비밀번호를 입력해주세요:
					</div>
					<div>
						<input type="password" name="newPasswd1" />
					</div>
					<div>
						<strong>2.</strong> 새로운 비밀번호를 다시 입력해주세요:
					</div>
					<div>
						<input type="password" name="newPasswd2"/>
						<input type="button" class="multi-line-button flat blue" value="확인" onclick="changePasswd()"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>