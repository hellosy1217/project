<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>Sign up - BlueBalloon</title>
<script type="text/javascript"
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/js/responsive.min.js"></script>
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
					<div class="buttons marg-top-20">
						<div class="facebook-up">
							<svg class="svg-fb-logo" viewBox="0 0 14.955 32">
									<use xmlns:xlink="http://www.w3.org/1999/xlink"
									xlink:href="/images/responsive/svg/sprites.svg?v=1#svg-icon-facebook-2016"></use></svg>
						</div>
						<div class="google-up" id="signin_google_g"
							data-gapiattached="true">
							<svg class="svg-gp-logo" viewBox="0 0 32 32"
								xmlns="http://www.w3.org/2000/svg">
									<g fill="none" fill-rule="evenodd">
									<path
									d="m30.909 13.091h-14.909v6.1818h8.5825c-0.80073 3.9265-4.1455 6.1818-8.5825 6.1818-5.2364 0-9.4545-4.2182-9.4545-9.4545 0-5.2364 4.2182-9.4545 9.4545-9.4545 2.2553 0 4.2909 0.8 5.8916 2.1091l4.6538-4.6545c-2.8356-2.4727-6.472-4-10.545-4-8.8727 0-16 7.1273-16 16 0 8.8727 7.1273 16 16 16 8 0 15.273-5.8182 15.273-16 0-0.94545-0.14473-1.9636-0.36364-2.9091"
									fill="#E94435"></path>
									<path
									d="m16.001 13.091v6.1818h8.5825c-0.80073 3.9265-4.1455 6.1818-8.5825 6.1818-4.2015 0-7.7425-2.7185-8.9796-6.4982l-5.3818 4.1265c2.6022 5.2945 8.0371 8.9171 14.361 8.9171 8 0 15.273-5.8182 15.273-16 0-0.94545-0.14473-1.9636-0.36364-2.9091h-14.909z"
									fill="#35A751"></path>
									<path
									d="m16.001 13.091v6.1818h8.5825c-0.43564 2.1345-1.6269 3.7702-3.3316 4.8233l5.1222 3.9651c2.9665-2.7309 4.8996-6.8145 4.8996-12.061 0-0.94545-0.14473-1.9636-0.36364-2.9091h-14.909z"
									fill="#557DBE"></path>
									<path
									d="m6.5455 15.999c0-1.0393 0.17236-2.0356 0.48-2.9702l-5.3847-4.1178c-1.0495 2.1338-1.6407 4.5382-1.6407 7.088s0.59127 4.9542 1.6407 7.0873l5.3847-4.1171c-0.30764-0.93382-0.48-1.9302-0.48-2.9702"
									fill="#F8BB15"></path></g></svg>
							<div class="invisible"></div>
						</div>
					</div>
					<div class="or-content">
						<div class="or-line"></div>
						<div class="or">оr</div>
						<div class="or-line"></div>
					</div>
					<form class="clearfix" onsubmit="return false">
						<div class="input-c">
							<input class="text" type="text" id="g_name"
								placeholder="Full name">
						</div>
						<div class="input-c">
							<input class="text" type="email" id="g_email"
								placeholder="Enter your email">
						</div>
						<div class="input-c">
							<input class="text" id="g_password_1" type="password"
								placeholder="Enter password">
						</div>
						<div class="input-c">
							<input class="text" id="g_password_2" type="password"
								placeholder="Repeat password">
						</div>
						<div class="input-c subscribe">
							<label><input type="checkbox" id="subscribe" checked="">Send
								me special deals to my inbox</label>
						</div>
						<div class="input-c">
							<a class="reg-page-button" href="#" onclick="return false"
								id="g_send"><span class="title">Sign up</span></a>
						</div>
					</form>
					<div id="message-sign-in"></div>
					<div class="b-lnk">
						Already have an account? <a href="member_login">Log in</a>
					</div>
				</div>
			</div>
			<div class="terms-block">
				By logging in, you accept our <a
					href="https://www.tourradar.com/terms-conditions" target="_blank">Terms
					of Use</a>, and <a href="https://www.tourradar.com/privacy"
					target="_blank">Privacy</a> &amp; <a
					href="https://www.tourradar.com/cookie-policy" target="_blank">Cookies</a>
				Statement.
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