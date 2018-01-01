<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>Reset Password - BlueBalloon</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js"> </script >
<link
	href="${pageContext.request.contextPath}/resources/member/css/find1.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/member/css/find2.css"
	rel="stylesheet" />	
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://apis.google.com/_/scs/apps-static/_/js/k=oz.gapi.ko.YPQ_WKADknI.O/m=plus/rt=j/sv=1/d=1/ed=1/am=AQ/rs=AGLTcCOyJfzZfZg9XZhhXI_pFLygxv9tKw/cb=gapi.loaded_0"
	async=""></script>
<script type="text/javascript">
	function findPasswd() {
		var email = document.getElementById('g_email');
		if(email.value == '' || email == null ){
			swal('이런...', '이메일을 입력해 주세요!', 'error');
			email.focus();
			return false;
		}
		 document.getElementById('frm').submit();
		return true;
	}
</script>
</head>
<body class="reg-page-bg ">
	<div id="content" class="clearfix wrapc ">
		<div class="reg-page reset-password clearfix">
			<%@include file="../../header2.jsp"%>
			<div class="inside" id="reset-password"
				style="margin-top: 30px; opacity: 100;">
				<div class="inside-w">
					<div class="form-title">비밀번호를 잊으셨나요?</div>
					<form name="f" id="frm" class="clearfix" action="member_find" method="POST">
						<div class="b-lnk forgot">걱정 마세요. 저희가 도와드릴게요.</div>
						<div class="b-lnk">
							이메일을 입력하시면 새로운 비밀번호를<br />이메일로 발송해 드립니다.
						</div>
						<div class="input-c">
							<input class="text" type="email" name="member_email" id="g_email"
								placeholder="가입된 계정 이메일을 입력해주세요.">
						</div>
						<div class="input-c clearfix">
							<a class="reg-page-button" onclick="findPasswd()" id="g_send"><span class="title">확인</span></a>
						</div>
					</form>
					<!-- 버튼 누르면 나와야 하는 창 -->
					<!-- <form class="clearfix" onsubmit="return false">
						<h2>비밀번호 재설정 이메일을 보냈습니다.</h2>
						<p>
							이메일을 확인하고 링크를 클릭하여<br />비밀번호를 재설정하십시오.
						</p>
						<p>
							이메일이 도착하지 않는다면<br />스팸 메일함을 확인해주세요
						</p>
					</form> -->
					<!-- 이메일에 도착한 링크 눌렀을 때 -->
					<!-- <form class="clearfix" onsubmit="return false">
						<div class="input-c ref-t">
							이 계정의 새로운 비밀번호를 입력해주세요:<br />이메일
						</div>
						<div class="input-c">
							<input class="text" id="g_password" type="password"
								placeholder="Enter password">
						</div>
						<div class="input-c">
							<a class="reg-page-button" href="#" onclick="return false"
								id="g_send"><span class="title">확인</span></a>
						</div>
					</form>
					 --><div id="message-sign-in"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="svg_content_load" style="display: none"></div>
	<script type="text/javascript" src="https://apis.google.com/js/plus.js"
		gapi_processed="true"></script>
	<script type="text/javascript"
		src="//cdn.tourradar.com//include/js/responsive.min.js?v=1512138643"></script>
	<script
		src="//cdn.tourradar.com/include/pw/responsive/script.v1512389251.min.js"
		async=""></script>
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