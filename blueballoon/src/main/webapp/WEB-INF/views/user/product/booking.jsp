<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class=" logged">
<head>
<title>booking - 상품/패키지 명 - BlueBalloon</title>
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/booking1.css?ver=1"
	rel="stylesheet" type="text/css" />
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<!-- 
<script
	src="//cdn.tourradar.com/include/bower/braintree-web-3/client.v1513001935.js"
	async=""></script>
<script
	src="//cdn.tourradar.com/include/bower/braintree-web-3/hosted-fields.v1513001935.js"
	async=""></script>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-334117-5', 'auto');

	ga('set', 'dimension10', '82985');
	ga('set', 'dimension11', 'Europe');
	ga('set', 'dimension18', 'conversionintent');
	ga('set', 'dimension19', '1275');

	ga('send', 'pageview');
</script>
<script>
	!function(f, v, n) {
		if (f.fbq)
			return;
		n = f.fbq = function() {
			n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
					.push(arguments)
		};
		if (!f._fbq)
			f._fbq = n;
		n.push = n;
		n.loaded = !0;
		n.version = '2.0';
		n.queue = [];
	}(window);
	fbq('init', '806188949420761');
	fbq('track', "PageView");
</script>
<script async=""
	src="//cdn.tourradar.com/include/js/zepto.v1513001935.min.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/js/zepto-fx.v1513001935.min.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/js/zepto-anim.v1513001935.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/book_now/async.v1513001935.css">
<script async=""
	src="//cdn.tourradar.com/include/js/jquery.unveil.v1513001935.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/bower/moment/min/moment.v1513001935.min.js"></script>
 -->
</head>
<body class="tb" data-r="1" data-b-sale="">
	<header>
		<div class="c">
			<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve"
				height="30" width="174" version="1.1" y="0" x="0"
				enable-background="new 0 0 203 35" viewBox="0 0 203 35">
				<path
					d="m82.95 13.67v-6.65h-1.37c-3.78 0-6.31 2.34-7.68 3.81v-3.39h-6.77v26.17h6.89v-16.82c1.16-1.05 3.73-2.83 7.56-3.09 0.94-0.05 1.37-0.03 1.37-0.03zm3.17-2.97v6.09c1.16-1.05 3.73-2.83 7.56-3.09 0.95-0.05 1.37-0.03 1.37-0.03v-6.65h-1.37c-3.67 0-6.16 2.21-7.56 3.68zm-1.37 6.11c-2.31 0.16-4.16 0.87-5.52 1.64v15.17h6.9v-16.83h-0.97c-0.13 0-0.26 0.01-0.41 0.02zm-57.46-9.79c-7.72 0-11.35 3.05-11.35 7.72v11.5c0 4.72 3.63 7.77 11.35 7.77s11.35-3.05 11.35-7.77v-11.5c0-4.67-3.63-7.72-11.35-7.72zm4.46 18.64c0 2-1.52 2.89-4.46 2.89s-4.46-0.89-4.46-2.89v-10.34c0-1.94 1.52-2.83 4.47-2.83 2.94 0 4.46 0.89 4.46 2.84v10.33zm-24.09-25.03h-6.96v25.12c0 5.17 2.37 7.81 10.13 7.81h2.82v-5.7h-1.76c-2.96 0-4.22-0.9-4.22-2.85l-0.01-11.19h6.22v-6.56h-6.22v-6.63zm129.5 9.28c-1.52-1.16-4.15-2.83-8.2-2.83-5.2 0-7.62 2.99-7.62 7.67v11.66c0 4.68 2.42 7.67 7.62 7.67 4.2 0 6.88-1.78 8.35-2.94v2.52h6.74v-32.88h-6.89v9.13zm0 15.75c-1.1 0.84-3.47 2.41-6.04 2.41-2.47 0-2.89-1.36-2.89-2.78v-9.5c0-1.36 0.42-2.73 2.89-2.73 2.58 0 4.94 1.58 6.04 2.42v10.18zm-29.47-18.64c-7.51 0-10.61 2.89-10.61 7.56v1.5h6.41v-1.27c0.03-1.83 1.09-2.65 4.04-2.65 3.05 0 3.94 1.05 3.94 2.94v3.36h-7.25c-5.2 0-7.88 3.1-7.88 6.62v2.36c0 3.47 2.42 6.56 7.56 6.56 3.68 0 6.25-1.63 7.78-2.89l0.01 0.01v2.46h6.56v-19.01c0-4.66-2.89-7.55-10.56-7.55zm3.79 19.27c-1.21 0.89-3.36 2.26-5.78 2.26-1.58 0-2.63-0.47-2.63-2.05v-0.84c0-1.36 0.48-2.36 2.52-2.36h5.89v2.99zm46.84-19.21c-7.51 0-10.6 2.89-10.6 7.56v1.51h6.41v-1.27c0.03-1.83 1.09-2.65 4.04-2.65 3.05 0 3.94 1.05 3.94 2.94v3.36h-7.25c-5.2 0-7.88 3.1-7.88 6.62v2.36c0 3.46 2.42 6.56 7.57 6.56 3.68 0 6.25-1.63 7.77-2.89l0.01 0.02v2.46h6.56l0.01-0.04v-18.98c-0.02-4.68-2.91-7.56-10.58-7.56zm3.78 19.27c-1.21 0.9-3.36 2.26-5.78 2.26-1.57 0-2.63-0.47-2.63-2.05v-0.84c0-1.37 0.47-2.36 2.52-2.36h5.89v2.99zm16.61-15.52v-3.39h-6.77v26.17h6.9v-16.82c1.16-1.05 3.73-2.83 7.56-3.09 0.95-0.05 1.37-0.03 1.37-0.03v-6.65h-1.37c-3.79 0-6.32 2.34-7.69 3.81zm-121.53-3.39v18.28c-1.05 0.84-3.2 2.31-5.78 2.31-2.21 0-2.84-0.9-2.84-2.78l0.01-17.81h-6.88v19.54c0 4.1 2.78 7.04 7.56 7.04 4.21 0 6.73-1.68 8.09-2.89v2.47h6.73l-0.01-26.16h-6.88z"></path>
				<polygon
					points="200.6 7.44 199.31 11.04 198.02 7.44 196.58 7.44 196.58 12.47 197.5 12.47 197.5 8.41 198.91 12.47 199.72 12.47 201.11 8.41 201.11 12.47 202.03 12.47 202.03 7.44"></polygon>
				<polygon
					points="191.43 8.28 193.08 8.28 193.08 12.47 194.08 12.47 194.08 8.28 195.73 8.28 195.73 7.44 191.43 7.44"></polygon></svg>
			<div class="tag">
				booking tours made <b>easy</b>
			</div>
			<div class="right">
				<a href="#" onclick="return false" class="tel">+82 전화번호</a><a
					href="#" onclick="return false" class="help">고객센터</a>
			</div>
		</div>
	</header>
	<main
		data-parameters="{&quot;version&quot;:1513001935,&quot;objectId&quot;:&quot;82985&quot;,&quot;tourId&quot;:&quot;82985&quot;,&quot;isEnquiry&quot;:false,&quot;currency&quot;:&quot;usd&quot;,&quot;currencyRate&quot;:0.85,&quot;symbol&quot;:&quot;$&quot;,&quot;showMonths&quot;:6,&quot;currentDate&quot;:&quot;1524261600&quot;,&quot;tourLength&quot;:&quot;9&quot;,&quot;partner&quot;:null,&quot;paymentMethods&quot;:{&quot;details&quot;:{&quot;paymentImages&quot;:{&quot;Visa&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/Visa.png&quot;,&quot;MasterCard&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/MasterCard.png&quot;,&quot;Maestro&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/Maestro.png&quot;,&quot;American-Express&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/American-Express.png&quot;,&quot;PayPal&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/PayPal.png&quot;},&quot;paymentDetails&quot;:{&quot;amount&quot;:1,&quot;countryCode&quot;:&quot;AT&quot;,&quot;currencyCode&quot;:&quot;USD&quot;},&quot;paymentMethods&quot;:{&quot;Braintree&quot;:{&quot;paymentAccess&quot;:{&quot;token&quot;:&quot;eyJ2ZXJzaW9uIjoyLCJhdXRob3JpemF0aW9uRmluZ2VycHJpbnQiOiI5MzBlZjZlNTdmMDgwMDQ1NTI3YzdjZTZlZGI1OTg0OTBjYzIzYmIzMTIzZjAzNmY3ODI5YzNhNjY3ZDMwY2UzfGNyZWF0ZWRfYXQ9MjAxNy0xMi0xMVQyMzozMDoxMi45ODc4OTYzNDUrMDAwMFx1MDAyNm1lcmNoYW50X2lkPW16M3Q3YzZtYzM2ZDN2NHlcdTAwMjZwdWJsaWNfa2V5PTM1cjZkajZ4ZGZjeHQ3eDUiLCJjb25maWdVcmwiOiJodHRwczovL2FwaS5icmFpbnRyZWVnYXRld2F5LmNvbTo0NDMvbWVyY2hhbnRzL216M3Q3YzZtYzM2ZDN2NHkvY2xpZW50X2FwaS92MS9jb25maWd1cmF0aW9uIiwiY2hhbGxlbmdlcyI6WyJjdnYiXSwiZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwiY2xpZW50QXBpVXJsIjoiaHR0cHM6Ly9hcGkuYnJhaW50cmVlZ2F0ZXdheS5jb206NDQzL21lcmNoYW50cy9tejN0N2M2bWMzNmQzdjR5L2NsaWVudF9hcGkiLCJhc3NldHNVcmwiOiJodHRwczovL2Fzc2V0cy5icmFpbnRyZWVnYXRld2F5LmNvbSIsImF1dGhVcmwiOiJodHRwczovL2F1dGgudmVubW8uY29tIiwiYW5hbHl0aWNzIjp7InVybCI6Imh0dHBzOi8vY2xpZW50LWFuYWx5dGljcy5icmFpbnRyZWVnYXRld2F5LmNvbS9tejN0N2M2bWMzNmQzdjR5In0sInRocmVlRFNlY3VyZUVuYWJsZWQiOmZhbHNlLCJwYXlwYWxFbmFibGVkIjp0cnVlLCJwYXlwYWwiOnsiZGlzcGxheU5hbWUiOiJUb3VyUmFkYXIiLCJjbGllbnRJZCI6IkFac1NJaERwczkxUlZQX2lucXZXRGMzZFJpVl8zcHNaQTFPWVQxS0p4eDRzQzJHMGR5aC1XR0ZzM2NvZSIsInByaXZhY3lVcmwiOiJodHRwOi8vd3d3LnRvdXJyYWRhci5jb20vcHJpdmFjeSIsInVzZXJBZ3JlZW1lbnRVcmwiOiJodHRwOi8vd3d3LnRvdXJyYWRhci5jb20vdGVybXMtY29uZGl0aW9ucy8iLCJiYXNlVXJsIjoiaHR0cHM6Ly9hc3NldHMuYnJhaW50cmVlZ2F0ZXdheS5jb20iLCJhc3NldHNVcmwiOiJodHRwczovL2NoZWNrb3V0LnBheXBhbC5jb20iLCJkaXJlY3RCYXNlVXJsIjpudWxsLCJhbGxvd0h0dHAiOmZhbHNlLCJlbnZpcm9ubWVudE5vTmV0d29yayI6ZmFsc2UsImVudmlyb25tZW50IjoibGl2ZSIsInVudmV0dGVkTWVyY2hhbnQiOmZhbHNlLCJicmFpbnRyZWVDbGllbnRJZCI6IkFSS3JZUkRoM0FHWER6VzdzT18zYlNrcS1VMUM3SEdfdVdOQy16NTdMallTRE5VT1NhT3RJYTlxNlZwVyIsImJpbGxpbmdBZ3JlZW1lbnRzRW5hYmxlZCI6dHJ1ZSwibWVyY2hhbnRBY2NvdW50SWQiOiJ0b3VycmFkYXIyRVVSIiwiY3VycmVuY3lJc29Db2RlIjoiRVVSIn0sIm1lcmNoYW50SWQiOiJtejN0N2M2bWMzNmQzdjR5IiwidmVubW8iOiJvZmYifQ==&quot;,&quot;customer&quot;:null},&quot;paymentMethods&quot;:[{&quot;id&quot;:1,&quot;label&quot;:&quot;Visa&quot;,&quot;group&quot;:&quot;cards&quot;,&quot;order&quot;:1,&quot;fields&quot;:[{&quot;id&quot;:&quot;cardHolder&quot;,&quot;type&quot;:&quot;custom&quot;,&quot;label&quot;:&quot;Cardholder Name&quot;,&quot;order&quot;:1,&quot;placeholder&quot;:&quot;i.e. John Smith&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:1000,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;cardNumber&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;Card Number&quot;,&quot;order&quot;:2,&quot;mask&quot;:&quot;{{9999}} {{9999}} {{9999}} {{9999}} {{999}}&quot;,&quot;placeholder&quot;:&quot;**** **** **** ****&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:12,&quot;maxLength&quot;:19,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;expiryDate&quot;,&quot;type&quot;:&quot;expirydate&quot;,&quot;label&quot;:&quot;Expiry Date&quot;,&quot;order&quot;:3,&quot;mask&quot;:&quot;{{99}}\/{{99}}&quot;,&quot;placeholder&quot;:&quot;MM \/ YYYY&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:4,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^(?:0[1-9]|1[0-2])[0-9]{2}$&quot;}},{&quot;id&quot;:&quot;cvv&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;CVV&quot;,&quot;order&quot;:4,&quot;mask&quot;:&quot;{{9999}}&quot;,&quot;placeholder&quot;:&quot;123&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^[0-9]{3}[0-9]?$&quot;}}]},{&quot;id&quot;:2,&quot;label&quot;:&quot;MasterCard&quot;,&quot;group&quot;:&quot;cards&quot;,&quot;order&quot;:2,&quot;fields&quot;:[{&quot;id&quot;:&quot;cardHolder&quot;,&quot;type&quot;:&quot;custom&quot;,&quot;label&quot;:&quot;Cardholder Name&quot;,&quot;order&quot;:1,&quot;placeholder&quot;:&quot;i.e. John Smith&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:1000,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;cardNumber&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;Card Number&quot;,&quot;order&quot;:2,&quot;mask&quot;:&quot;{{9999}} {{9999}} {{9999}} {{9999}} {{999}}&quot;,&quot;placeholder&quot;:&quot;**** **** **** ****&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:12,&quot;maxLength&quot;:19,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;expiryDate&quot;,&quot;type&quot;:&quot;expirydate&quot;,&quot;label&quot;:&quot;Expiry Date&quot;,&quot;order&quot;:3,&quot;mask&quot;:&quot;{{99}}\/{{99}}&quot;,&quot;placeholder&quot;:&quot;MM \/ YYYY&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:4,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^(?:0[1-9]|1[0-2])[0-9]{2}$&quot;}},{&quot;id&quot;:&quot;cvv&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;CVV&quot;,&quot;order&quot;:4,&quot;mask&quot;:&quot;{{9999}}&quot;,&quot;placeholder&quot;:&quot;123&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^[0-9]{3}[0-9]?$&quot;}}]},{&quot;id&quot;:5,&quot;label&quot;:&quot;Maestro&quot;,&quot;group&quot;:&quot;cards&quot;,&quot;order&quot;:5,&quot;fields&quot;:[{&quot;id&quot;:&quot;cardHolder&quot;,&quot;type&quot;:&quot;custom&quot;,&quot;label&quot;:&quot;Cardholder Name&quot;,&quot;order&quot;:1,&quot;placeholder&quot;:&quot;i.e. John Smith&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:1000,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;cardNumber&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;Card Number&quot;,&quot;order&quot;:2,&quot;mask&quot;:&quot;{{9999}} {{9999}} {{9999}} {{9999}} {{999}}&quot;,&quot;placeholder&quot;:&quot;**** **** **** ****&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:12,&quot;maxLength&quot;:19,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;expiryDate&quot;,&quot;type&quot;:&quot;expirydate&quot;,&quot;label&quot;:&quot;Expiry Date&quot;,&quot;order&quot;:3,&quot;mask&quot;:&quot;{{99}}\/{{99}}&quot;,&quot;placeholder&quot;:&quot;MM \/ YYYY&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:4,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^(?:0[1-9]|1[0-2])[0-9]{2}$&quot;}},{&quot;id&quot;:&quot;cvv&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;CVV&quot;,&quot;order&quot;:4,&quot;mask&quot;:&quot;{{9999}}&quot;,&quot;placeholder&quot;:&quot;123&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^[0-9]{3}[0-9]?$&quot;}}]},{&quot;id&quot;:3,&quot;label&quot;:&quot;American Express&quot;,&quot;group&quot;:&quot;cards&quot;,&quot;order&quot;:3,&quot;fields&quot;:[{&quot;id&quot;:&quot;cardHolder&quot;,&quot;type&quot;:&quot;custom&quot;,&quot;label&quot;:&quot;Cardholder Name&quot;,&quot;order&quot;:1,&quot;placeholder&quot;:&quot;i.e. John Smith&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:1000,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;cardNumber&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;Card Number&quot;,&quot;order&quot;:2,&quot;mask&quot;:&quot;{{9999}} {{999999}} {{99999}} {{99999}}&quot;,&quot;placeholder&quot;:&quot;**** **** **** ****&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:12,&quot;maxLength&quot;:19,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;expiryDate&quot;,&quot;type&quot;:&quot;expirydate&quot;,&quot;label&quot;:&quot;Expiry Date&quot;,&quot;order&quot;:3,&quot;mask&quot;:&quot;{{99}}\/{{99}}&quot;,&quot;placeholder&quot;:&quot;MM \/ YYYY&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:4,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^(?:0[1-9]|1[0-2])[0-9]{2}$&quot;}},{&quot;id&quot;:&quot;cvv&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;CVV&quot;,&quot;order&quot;:4,&quot;mask&quot;:&quot;{{9999}}&quot;,&quot;placeholder&quot;:&quot;1234&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^[0-9]{3}[0-9]?$&quot;}}]},{&quot;id&quot;:4,&quot;label&quot;:&quot;PayPal&quot;,&quot;group&quot;:null,&quot;order&quot;:4,&quot;fields&quot;:null}]}}},&quot;html&quot;:&quot;<form class=\&quot;fields \&quot;>
	<input type=\&quot;hidden\&quot; name=\&quot;paymentProvider\&quot;>
	<div class=\&quot;row\&quot; data-field=\&quot;paymentMethod\&quot;>
		<div class=\&quot;celltitle\&quot;>
			Payment Method<\/div>
			<div class=\&quot;cell\&quot;>
				<div class=\&quot;add\&quot;>
					<select id=\&quot;payment_method\&quot;
						name=\&quot;payment_method\&quot;><option
							value=\&quot;\&quot; disabled selected>Select payment
							option<\/option><\/select>
							<div class=\&quot;securewith-tip\&quot;>
								<div class=\&quot;tip\&quot;>
									<div>
										<strong>Secure Payment<\/strong><\/div>\n Your
											information is protected by SSL Encryption\n
											<\/div><\/div><\/div><\/div><\/div><\/form>&quot;},&quot;pax&quot;:1,&quot;price&quot;:&quot;1275.00&quot;,&quot;browserSupportsTls&quot;:true}"
											data-phone="+1 844 311 3006 ">
											<div class="c">
												<div class="fline">
													<h1>상품/패키지 이름</h1>
												</div>
												<div class="book">
													<div class="left">
														<div class="saleLine"></div>
														<div class="block departure">
															<div class="head">
																<div class="point">1</div>
																<h3>날짜를 확인해주세요.</h3>
																<b class="date date-start">ㅇ년 ㅇ월 ㅇ일 ㅇ요일 </b><a href="#"
																	onclick="return false" class="change">날짜 변경</a>
															</div>
															<div id="seats">
																<div class="content">
																	<div class="i icon currency usd">예약 취소시 ~~~~
																		청구됩니다.</div>
																</div>
																<div class="info">
																	<div class="col">
																		<div class="best-price text">
																			최고의 가격
																			<div class="stext">여긴 뭐 넣지</div>
																		</div>
																	</div>
																	<div class="col">
																		<div class="earn text">
																			뭐 넣을 지 생각 중
																			<div class="stext">뭐 넣을 지 생각 중</div>
																		</div>
																	</div>
																	<div class="col">
																		<div class="no-fees text">
																			뭐 넣을 지 생각 중
																			<div class="stext">뭐 넣을 지 생각 중</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="block details">
															<div class="head">
																<div class="point">2</div>
																<h3>?를 입력해주세요.</h3>
															</div>
															<div class="info unselectable " unselectable="on">
																<b class="in">인원</b>
																<div class="in quantity">
																	<span class="number minus  grey "></span><input
																		type="number" value="1" min="1" max="30"
																		inputmode="numeric" pattern="[0-9]*"><span
																		class="number plus "></span>
																</div>
																<div class="in solo"></div>
															</div>
														</div>
														<div class="block accommodation ">
															<div class="head">
																<div class="point">3</div>
																<h3>방을 선택해주세요.</h3>
															</div>
															<div class="room-content"></div>
															<div class="content" data-friends="1">
																<div class="types">
																	<div>
																		<div class="error main hid">Please select an
																			accommodation to continue with the booking process</div>
																	</div>
																	<div class="radio" data-lack="1">
																		<input type="radio" name="accommodation" value="Twin"
																			id="accommodation-0">
																		<div class="check"></div>
																		<div class="label" for="accommodation-0">
																			<div class="descr">
																				<b><div class="beds ">
																						<span>✕</span>최대인원
																					</div>
																					<div>ㅇㅇ룸</div></b> 방 설명
																			</div>
																			<div class="pr">
																				<b>+추가금액</b>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="block extras  hid ">
															<div class="head">
																<div class="point"></div>
																<h3>Optional Extras</h3>
															</div>
															<div class="content"></div>
														</div>
														<div class="block price-main ">
															<div class="head">
																<h3>이 부분은 비회원일 때만 보여줄 예정</h3>
															</div>
															<ul class="prices promo des" data-value="memberSaving">
																<li class="discount exp">지금 회원가입하면 <b class="green">-얼마</b>
																	만큼 회원 할인을 받으실 수 있습니다.
																</li>
																<li class="link"><a href="member_join">가입하기</a></li>
															</ul>
														</div>
														<div class="block payment ">
															<div class="head">
																<div class="point">4</div>
																<h3>Payment Details</h3>
																<div class="logos">
																	<img id="Visa"
																		src="/images/responsive/payment_providers/card_logos/Visa.png"><img
																		id="MasterCard"
																		src="/images/responsive/payment_providers/card_logos/MasterCard.png"><img
																		id="Maestro"
																		src="/images/responsive/payment_providers/card_logos/Maestro.png"><img
																		id="American-Express"
																		src="/images/responsive/payment_providers/card_logos/American-Express.png"><img
																		id="PayPal"
																		src="/images/responsive/payment_providers/card_logos/PayPal.png">
																</div>
															</div>
															<div class="info">
																<div class="col">
																	<div class="best-price text">
																		You've got the best price
																		<div class="stext">Best Price Guarantee</div>
																	</div>
																</div>
																<div class="col">
																	<div class="earn text">
																		Earn $<span class="travel-credits">38</span> travel
																		credits
																		<div class="stext">How it works</div>
																	</div>
																</div>
																<div class="col">
																	<div class="no-fees text">
																		No booking or credit card fees
																		<div class="stext">Pay what you see</div>
																	</div>
																</div>
															</div>
															<div class="payment-fields">
																<form class="fields ">
																	<input type="hidden" name="paymentProvider"
																		value="Braintree">
																	<div class="row" data-field="paymentMethod">
																		<div class="cell title">Payment Method</div>
																		<div class="cell">
																			<div class="add">
																				<select id="payment_method" name="payment_method"
																					disabled=""><option value="Visa">Visa</option>
																					<option value="MasterCard">MasterCard</option>
																					<option value="Maestro">Maestro</option>
																					<option value="American Express">American
																						Express</option>
																					<option value="PayPal">PayPal</option></select>
																				<div class="secure with-tip">
																					<div class="tip">
																						<div>
																							<strong>Secure Payment</strong>
																						</div>
																						Your information is protected by SSL Encryption
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</form>
															</div>
															<div class="end">
																<div class="checkbox">
																	<input type="checkbox" id="terms-agree" value="1"><label
																		for="terms-agree" class="terms-agree"> I
																		accept <a href="#" class="termsCoPopup"
																		data-id="terms_agent">Terms &amp; Conditions</a> and <a
																		href="#" class="termsCoPopup" data-id="privacy_policy">Privacy
																			Policy</a>; and CostSaver's <a
																		href="https://costsaver.trafalgar.com/can/terms-and-conditions/website-terms-of-use"
																		target="_blank">payment, cancellation and refund
																			conditions</a>.
																	</label><span></span>
																</div>
																<div class="book-button">
																	<a href="" class="but blue" data-type="Book">Book 1
																		space</a>
																	<div class="notice">
																		<b>No booking fees!</b> You will only be charged <b>$200</b>
																		now.<br> The remaining balance is due on <b>March
																			2nd 2018</b>.
																	</div>
																</div>
															</div>
														</div>
														<div class="block agents">
															<div class="head">
																<h3>도움이 필요하세요?</h3>
															</div>
															<div class="title tit">24/7 Customer Support</div>
															<div class="text">고객상담에 대한 설명 들어갈 곳, 아래는 이미지 들어갈 부분</div>
															<div class="t">
																<c:forEach var="a" begin="1" end="5" step="1">
																	<div class="wp">
																		<img
																			src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/header/logo1.png"
																			alt="Carla"><span>이름</span>
																	</div>
																</c:forEach>
															</div>
															<div class="title">Call us +82 전화번호</div>
														</div>
													</div>
													<div class="right">
														<div class="block">
															<div class="title-route">영수증</div>
															<ul class="route exp">
																<li>상품/패키지명 <span>ㅇdays</span></li>
																<li>패키지일 경우 시작 위치<span class="date-start">패키지
																		시작 일</span></li>
																<li>패키지일 경우 끝 위치<span class="date-end">패키지
																		끝나는 날</span></li>
																<li class="wc">패키지일 경우 포함된 상품들 <span>
																		ㅇㅇㅇ,ㅇㅇㅇㅇ,ㅇㅇ,ㅇㅇ </span></li>
															</ul>
															<div class="price-main">
																<div class="info">
																	<ul class="prices">
																		<li class="blue">Price for 1 person</li>
																		<li>상품/패키지 가격
																			<div class="pr">얼마</div>
																		</li>
																		<li>인원
																			<div class="pr">몇명</div>
																		</li>
																		<li class="pt"><b><div class="pr">얼마</div></b></li>
																	</ul>
																</div>
																<ul class="prices promo">
																	<li class="discount exp"><b class="blue txt">BlueBalloon
																			Savings</b><b class="green"><span> 회원 할인가 </span>
																			<div class="pr">-얼마</div></b></li>
																</ul>
															</div>
														</div>
														<div class="price-resume">
															<div class="block blue">
																<div class="text">
																	<b>총액</b>
																</div>
																<div class="pr px20">
																	KRW<b>￦얼마</b>
																</div>
															</div>
															<div class="block">
																<ul class="prices final">
																	<li><div class="stext">TO BE PAID NOW</div> 예약금
																		<div class="pr">
																			<b>얼마</b>
																		</div></li>
																	<li><div class="stext">ON 2nd Mar 2018</div>예약금
																		제외한 금액인데 명칭 뭐라고 해야
																		<div class="pr">
																			<b>얼마</b>
																		</div></li>
																</ul>
															</div>
														</div>
														<div class="block terms">
															<h4>이용 약관</h4>
															<div class="text">
																이용 약관 내용 들어갈 곳 <a href="" target="_blank">???</a> ㅇㅇㅇㅇㅇㅇ
																<a href="#" class="termsCoPopup" data-id="terms_agent">???</a>.
																ㅇㅇㅇㅇㅇ
															</div>
															<div class="text">한국소비자원</div>
															<div class="text grey">주소</div>
															<div class="text">BlueBalloon</div>
															<div class="text grey">주소</div>
														</div>
													</div>
												</div>
											</div>
	</main>
	<!-- <script
		src="//cdn.tourradar.com/include/pw/book_now/script.v1513001935.min.js"
		async=""></script>
	<script src="//www.googleadservices.com/pagead/conversion_async.js"
		async=""></script>
	<script src="//www.google-analytics.com/cx/api.js" async=""></script>
	<script src="//cdn.tourradar.com/include/js/om/om.v1513001935.js"
		async=""></script>
	<script>
		!function() {
			var e = window._fbq || (window._fbq = []);
			if (!e.loaded) {
				var n = document.createElement("script");
				n.async = !0, n.src = "//connect.facebook.net/en_US/fbds.js";
				var t = document.getElementsByTagName("script")[0];
				t.parentNode.insertBefore(n, t), e.loaded = !0
			}
		}();
		window._fbq = window._fbq || [];
		window._fbq.push([ 'track', 'AddToCart', {
			"content_type" : "product",
			"content_ids" : [ "82985" ],
			"value" : "1275.00",
			"currency" : "USD"
		} ]);
	</script> -->
</body>
</html>