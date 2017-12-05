<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>Reset Password - BlueBalloon</title>
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://apis.google.com/_/scs/apps-static/_/js/k=oz.gapi.ko.YPQ_WKADknI.O/m=plus/rt=j/sv=1/d=1/ed=1/am=AQ/rs=AGLTcCOyJfzZfZg9XZhhXI_pFLygxv9tKw/cb=gapi.loaded_0"
	async=""></script>
<script async="" src="//www.googletagmanager.com/gtm.js?id=GTM-NSMPC"></script>
<link
	href="${pageContext.request.contextPath}/resources/member/css/find1.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/member/css/find2.css"
	rel="stylesheet" />
</head>
<body class="reg-page-bg ">
	<script>dataLayer = []; dataLayer.push ({'Cr-SiteType': 'd'});
 </script>
	<div id="fb-root" class=" fb_reset">
		<script async="" src="https://connect.facebook.net/en_US/all.js"></script>
		<div
			style="position: absolute; top: -10000px; height: 0px; width: 0px;">
			<div>
				<iframe name="fb_xdm_frame_https" frameborder="0"
					allowtransparency="true" allowfullscreen="true" scrolling="no"
					id="fb_xdm_frame_https" aria-hidden="true"
					title="Facebook Cross Domain Communication Frame" tabindex="-1"
					src="https://staticxx.facebook.com/connect/xd_arbiter/r/lY4eZXm_YWu.js?version=42#channel=f37e9479e90064e&amp;origin=https%3A%2F%2Fwww.tourradar.com"
					style="border: none;"></iframe>
			</div>
		</div>
		<div
			style="position: absolute; top: -10000px; height: 0px; width: 0px;">
			<div></div>
		</div>
	</div>
	<div id="content" class="clearfix wrapc ">
		<div class="reg-page reset-password clearfix">
			<%@include file="../../header2.jsp"%>
			<div class="inside" id="reset-password"
				style="margin-top: 30px; opacity: 100;">
				<div class="inside-w">
					<div class="form-title">비밀번호를 잊으셨나요?</div>
					<form class="clearfix" onsubmit="return false">
						<div class="b-lnk forgot">No problem. We're here to help.</div>
						<div class="b-lnk">Enter your email and we'll send you an
							email to create a new password.</div>
						<div class="input-c">
							<input class="text" type="text" value="" id="g_email"
								placeholder="Enter your email">
						</div>
						<div class="input-c clearfix">
							<a class="reg-page-button" href="#" onclick="return false"
								id="g_send"><span class="title">Submit</span></a>
						</div>
						<input class="hidden" type="submit">
					</form>
					<div id="message-sign-in"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="traveller_login">
		<div id="login-top">
			<div>
				Members pay <span></span>
			</div>
			<div>when booking this departure</div>
		</div>
		<div id="login-hidden" class="hidden">$59</div>
		<div class="close">X</div>
		<div class="title">Sign up</div>
		<div class="buttons">
			<div class="facebook-up"></div>
			<div class="google-up" id="signin_google">
				<div class="invisible"></div>
			</div>
		</div>
		<div id="or">
			<div>Or</div>
		</div>
		<div id="form_login" style="display: none;">
			<form class="clearfix" onsubmit="return false">
				<input type="email" id="email" placeholder="Email" def="1"
					deftext="Email"><input id="password_vis" value="Password"><input
					id="password_hid" value="" type="password"><input
					class="button button-green" id="submit" type="submit"
					value="Log In">
			</form>
			<div class="link">
				<div>
					<a href="#" onclick="return false">Forgot password?</a>
				</div>
				<div>
					Don't have an account yet? <a href="#" onclick="return false">Sign
						up here</a>
				</div>
			</div>
		</div>
		<div id="form_signup" class="" style="display: block;">
			<form class="clearfix" onsubmit="return false">
				<input id="name" value="Name" def="1" deftext="Name" maxlength="100"><input
					type="email" id="email" placeholder="Email" def="1" deftext="Email"
					maxlength="100"><input id="password_vis" value="Password"><input
					id="password_hid" value="" type="password"><input
					id="password_repeat_vis" value="Repeat password"><input
					id="password_repeat_hid" value="" type="password">
				<div id="grey">
					By creating an account, you're agreeing with our <a
						href="/terms-conditions" target="_blank">Terms and Conditions</a>
				</div>
				<input class="button button-green" id="submit" type="submit"
					value="Sign Up">
			</form>
			<div class="link">
				<div>&nbsp;</div>
				<div>
					Already have an account? <a href="#" onclick="return false">Log
						in</a>
				</div>
			</div>
		</div>
		<div class="hidden" id="traveller_success_id"></div>
	</div>
	<div id="svg_content_load" style="display: none"></div>
	<script type="text/javascript" src="https://apis.google.com/js/plus.js"
		gapi_processed="true"></script>
	<script type="text/javascript"
		src="//cdn.tourradar.com//include/js/responsive.min.js?v=1512138643"></script>
	<script
		src="//cdn.tourradar.com/include/pw/responsive/script.v1512389251.min.js"
		async=""></script>
	<script type="text/javascript">

var IntRespHF = setInterval (function() {
 if (typeof $ == 'function') {
 clearInterval (IntRespHF);
 $(document).ready (function() {
 resp_hf = new RespHF();
 resp_hf.init();
 });
 }
}, 10);

</script>
	<div id="fancybox-tmp"></div>
	<div id="fancybox-loading">
		<div></div>
	</div>
	<div id="fancybox-overlay"></div>
	<div id="fancybox-wrap">
		<div id="fancybox-outer">
			<div class="fancybox-bg" id="fancybox-bg-n"></div>
			<div class="fancybox-bg" id="fancybox-bg-ne"></div>
			<div class="fancybox-bg" id="fancybox-bg-e"></div>
			<div class="fancybox-bg" id="fancybox-bg-se"></div>
			<div class="fancybox-bg" id="fancybox-bg-s"></div>
			<div class="fancybox-bg" id="fancybox-bg-sw"></div>
			<div class="fancybox-bg" id="fancybox-bg-w"></div>
			<div class="fancybox-bg" id="fancybox-bg-nw"></div>
			<div id="fancybox-content"></div>
			<a id="fancybox-close"></a>
			<div id="fancybox-title"></div>
			<a href="javascript:;" id="fancybox-left"><span class="fancy-ico"
				id="fancybox-left-ico"></span></a><a href="javascript:;"
				id="fancybox-right"><span class="fancy-ico"
				id="fancybox-right-ico"></span></a>
		</div>
	</div>
	<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","806188949420761");fbq("track","PageView");</script>
	<noscript>&lt;img height="1" width="1" style="display:none"
		src="https://www.facebook.com/tr?id=806188949420761&amp;amp;ev=PageView&amp;amp;noscript=1"&gt;</noscript>
	<div style="display: none; visibility: hidden;">
		<script>(function(b,c,e,g,d){var f,a;b[d]=b[d]||[];f=function(){var a={ti:"5089755"};a.q=b[d];b[d]=new UET(a);b[d].push("pageLoad")};a=c.createElement(e);a.src=g;a.async=1;a.onload=a.onreadystatechange=function(){var b=this.readyState;b&&"loaded"!==b&&"complete"!==b||(f(),a.onload=a.onreadystatechange=null)};c=c.getElementsByTagName(e)[0];c.parentNode.insertBefore(a,c)})(window,document,"script","//bat.bing.com/bat.js","uetq");</script>
		<noscript></noscript>
	</div>
	<div
		style="width: 0px; height: 0px; display: none; visibility: hidden;"
		id="batBeacon0.3351171164012936">
		<img
			style="width: 0px; height: 0px; display: none; visibility: hidden;"
			id="batBeacon0.5528687917873771" width="0" height="0" alt=""
			src="https://bat.bing.com/action/0?ti=5089755&amp;Ver=2&amp;mid=13bce613-d841-b6a5-8108-579b6f3d97c9&amp;evt=pageLoad&amp;sid=424677de-0&amp;lt=599&amp;pi=1398853810&amp;lg=ko-KR&amp;sw=1280&amp;sh=800&amp;sc=24&amp;tl=Reset Password - TourRadar&amp;r=https%3A%2F%2Fwww.tourradar.com%2Flogin&amp;p=https%3A%2F%2Fwww.tourradar.com%2Fregistration%2Freset_password&amp;msclkid=N&amp;rn=333524">
	</div>
</body>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/responsive/async.v1512389251.css">
</html>