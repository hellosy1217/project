<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>Login to BlueBalloon</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link
	href="${pageContext.request.contextPath}/resources/user/member/css/login1.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/async.v1512324069.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<script
	src="https://apis.google.com/_/scs/apps-static/_/js/k=oz.gapi.ko.r51AHJCBdXk.O/m=signin_annotation/exm=plus/rt=j/sv=1/d=1/ed=1/am=AQ/rs=AGLTcCM7u4NfTrsdn7d2NcaEWtiqMp0Kqg/cb=gapi.loaded_1"
	async=""></script>
<script
	src="https://apis.google.com/_/scs/apps-static/_/js/k=oz.gapi.ko.r51AHJCBdXk.O/m=plus/rt=j/sv=1/d=1/ed=1/am=AQ/rs=AGLTcCM7u4NfTrsdn7d2NcaEWtiqMp0Kqg/cb=gapi.loaded_0"
	async=""></script>
<script async="" src="//www.googletagmanager.com/gtm.js?idx`=GTM-NSMPC"></script>
</head>
<body class="reg-page-bg ">

	<div
		style="position: absolute; top: -10000px; height: 0px; width: 0px;">
		<div></div>
	</div>
	</div>
	<div id="content" class="clearfix wrapc ">
		<div class="reg-page tag-login clearfix">
			<%@include file="../../header2.jsp"%>
			<div class="inside" id="tag-login"
				style="margin-top: 30px; opacity: 100;">
				<div class="inside-w">
					<div class="form-title">Log in</div>
					<form class="clearfix" name="login" onsubmit="return false"
						action="member_login" method="POST">
						<div id="message-sign-in"></div>
						<div class="input-c">
							<input class="text" type="text" value="" id="g_email"
								placeholder="Enter your Email" name="member_email">
						</div>
						<div class="input-c">
							<input class="text" id="g_password" type="password"
								placeholder="Enter password" name="member_passwd">
						</div>
						<div class="input-c clearfix">
							<a class="reg-page-button" onclick="submit()"
								id="g_send"><span class="title">Log in</span></a>
						</div>
						<div class="b-lnk forgot">
							<a href="find"> 비밀번호를 잊으셨나요? </a>
						</div>
						<div class="b-lnk last">
							아직 계정이 없으신가요? <a href="member_join">지금 가입하세요!</a>
						</div>
					</form>

				</div>
			</div>
			<script type="text/javascript">
				var js_params = {
					"RegistrationType" : "login"
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
			<script type="text/javascript">
				function submit() {
					document.login.submit();
				}
			</script>
		</div>
		<div class="hidden" id="traveller_success_id"></div>
	</div>
	<script type="text/javascript" src="https://apis.google.com/js/plus.js"
		gapi_processed="true"></script>
	<script type="text/javascript"
		src="//cdn.tourradar.com//include/js/responsive.min.js?v=1512138643"></script>
</body>
</html>