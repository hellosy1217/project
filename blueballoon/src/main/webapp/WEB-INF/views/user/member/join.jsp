<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>Sign up - BlueBalloon</title>
<link
	href="${pageContext.request.contextPath}/resources/member/css/join1.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/member/css/join2.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/async.v1512324069.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/ttip.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/js/responsive.min.js"></script>
</head>
<body class="reg-page-bg ">
	<div id="content" class="clearfix wrapc ">
		<div class="reg-page sign-up clearfix">
			<%@include file="../../header2.jsp"%>
			<div class="inside" style="margin-top: 30px; opacity: 100;">
				<div class="inside-w">
					<div id="sign_up">
						<div class="form-title">Sign up</div>
					</div>

					<form class="clearfix" action="member_join" method="POST" name="f">
						<div class="input-c">
							<input class="text" type="text" id="g_name" name="member_name"
								placeholder="Full name">
						</div>
						<div class="input-c">
							<input class="text" type="email" id="g_email" name="member_email"
								placeholder="Enter your email">
						</div>
						<div class="input-c">
							<input class="text" id="g_password_1" type="password" name="member_passwd"
								placeholder="Enter password">
						</div>
						<div class="input-c">
							<input class="text" id="g_password_2" type="password" name="member_passwd2"
								placeholder="Repeat password">
						</div>
						<div class="input-c">
							<a class="reg-page-button" href="#" onclick="f.submit()"
								id="g_send"><span class="title">Sign up</span></a>
						</div>
					</form>
					<div id="message-sign-in"></div>
					<div class="b-lnk">
						이미 계정이 있으신가요? <a href="member_login">Log in</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var js_params = {
			"RegistrationType" : "sign_up"
		};
		var IntRespApp = setInterval(function() {
			if (typeof $ == 'function') {
				clearInterval(IntRespApp);
				$(document).ready(function() {
					new RespRegistration(js_params).init();
				});
			}
		}, 10);
	</script>
	<script type="text/javascript" src="https://apis.google.com/js/plus.js"
		gapi_processed="true"></script>
</body>