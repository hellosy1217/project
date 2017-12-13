<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html class=" logged">
<head>
<title>booking - 상품/패키지 명 - BlueBalloon</title>
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/booking1.css"
	rel="stylesheet" />
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="//cdn.tourradar.com/include/bower/braintree-web-3/client.v1513001935.js"
	async=""></script>
<script
	src="//cdn.tourradar.com/include/bower/braintree-web-3/hosted-fields.v1513001935.js"
	async=""></script>
<script>
	(function() {
		(function(i, s, o, g, r) {
			i['CRMTracker'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
		})(window, 0, 0, 0, 'tracker');
		tracker(
				"setConfig",
				{
					"endpoint" : "https:\/\/omnimove.tourradar.com\/api\/t122995033\/v111184500",
					"compression" : false,
					"localId" : "5a2fc9ff482a9",
					"keys" : {
						"cookieId" : "tracking__session_id"
					}
				});
		tracker("setParameters", [ {
			"param" : "duration",
			"value" : "9",
			"points" : 300
		}, {
			"param" : "duration",
			"value" : "8",
			"points" : 180
		}, {
			"param" : "duration",
			"value" : "10",
			"points" : 180
		}, {
			"param" : "duration",
			"value" : "7",
			"points" : 90
		}, {
			"param" : "duration",
			"value" : "11",
			"points" : 90
		}, {
			"param" : "type",
			"value" : "country",
			"points" : 300
		}, {
			"param" : "city",
			"value" : "6779. Toledo, Spain",
			"points" : 45
		}, {
			"param" : "city",
			"value" : "6789. Seville, Spain",
			"points" : 45
		}, {
			"param" : "city",
			"value" : "6793. Granada, Spain",
			"points" : 45
		}, {
			"param" : "city",
			"value" : "16036. Guadix, Spain",
			"points" : 45
		}, {
			"param" : "city",
			"value" : "6785. Valencia, Spain",
			"points" : 45
		}, {
			"param" : "city",
			"value" : "24912. Peniscola, Spain",
			"points" : 45
		}, {
			"param" : "country",
			"value" : "162. Spain",
			"points" : 300
		}, {
			"param" : "continent",
			"value" : "201. Europe",
			"points" : 300
		}, {
			"param" : "start_city",
			"value" : "6770. Madrid, Spain",
			"points" : 600
		}, {
			"param" : "end_city",
			"value" : "6775. Barcelona, Spain",
			"points" : 300
		}, {
			"param" : "location_count",
			"value" : "6-10",
			"points" : 300
		}, {
			"param" : "country_count",
			"value" : "1",
			"points" : 300
		}, {
			"param" : "price",
			"value" : "900-1000",
			"points" : 300
		}, {
			"param" : "price",
			"value" : "800-900",
			"points" : 180
		}, {
			"param" : "price",
			"value" : "1000-1100",
			"points" : 180
		}, {
			"param" : "price",
			"value" : "700-800",
			"points" : 120
		}, {
			"param" : "price",
			"value" : "1100-1200",
			"points" : 120
		}, {
			"param" : "price",
			"value" : "950-1000",
			"points" : 450
		}, {
			"param" : "price_per_day",
			"value" : "105-110",
			"points" : 300
		}, {
			"param" : "price_per_day",
			"value" : "100-105",
			"points" : 180
		}, {
			"param" : "price_per_day",
			"value" : "110-115",
			"points" : 180
		}, {
			"param" : "price_per_day",
			"value" : "95-100",
			"points" : 120
		}, {
			"param" : "price_per_day",
			"value" : "115-120",
			"points" : 120
		}, {
			"param" : "theme",
			"value" : "In-depth Cultural",
			"points" : 390
		}, {
			"param" : "theme",
			"value" : "Cultural",
			"points" : 120
		}, {
			"param" : "region",
			"value" : "WR16. Western Europe",
			"points" : 135
		}, {
			"param" : "region",
			"value" : "WR8. Mediterranean",
			"points" : 135
		}, {
			"param" : "operator",
			"value" : "CostSaver",
			"points" : 300
		}, {
			"param" : "age",
			"value" : "< 18",
			"points" : 61.199999999999996
		}, {
			"param" : "age",
			"value" : "18-39",
			"points" : 61.199999999999996
		}, {
			"param" : "age",
			"value" : "40-49",
			"points" : 61.199999999999996
		}, {
			"param" : "age",
			"value" : "50-59",
			"points" : 61.199999999999996
		}, {
			"param" : "age",
			"value" : "60+",
			"points" : 61.199999999999996
		}, {
			"param" : "age",
			"value" : "10-60",
			"points" : 61.199999999999996
		}, {
			"param" : "tour",
			"value" : "82985. Spanish Experience Summer",
			"points" : 300
		}, {
			"param" : "departure",
			"value" : "04\/2018",
			"points" : 1000
		} ]);
		tracker("setPageValue", null);
		tracker("track");
	})();
</script>
<script>
	window.addEventListener
			&& addEventListener(
					"error",
					function(e) {
						window
								.setTimeout(
										function() {
											if (document.documentElement.className
													.match(/translated/)) {
												return;
											}

											e
													&& window.tracker
													&& tracker(
															'addEvent',
															'JSError',
															(e.filename || 'code'),
															(e.message || 'No message'),
															{
																filename : e.filename,
																lineno : e.lineno,
																colono : e.colono,
																error : e.error
															});

											var info = {
												"url" : document.location.href,
												"languge" : navigator.language,
												"useragent" : navigator.userAgent,
												"platform" : navigator.platform,
												"oscpu" : navigator.oscpu,
												"referrer" : document.referrer,
												"error[message]" : e.message,
												"error[colno]" : e.colno,
												"error[lineno]" : e.lineno,
												"error[filename]" : e.filename,
												"error[stack]" : e.error ? e.error.stack
														: null
											};

											var encodedInfo = [];
											for ( var key in info) {
												var value = info[key];
												value = ((typeof value === 'undefined') || value === null) ? ''
														: encodeURIComponent(value);
												encodedInfo
														.push(encodeURIComponent(key)
																+ '=' + value);
											}
											var postParams = encodedInfo
													.join('&');

											var request = new XMLHttpRequest();
											request.open('POST',
													'/utils/jserror', true);
											request
													.setRequestHeader(
															'Content-Type',
															'application/x-www-form-urlencoded; charset=UTF-8');
											request.send(postParams);
										}, 1);
					});
</script>
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
</head>
<body class="tb" data-r="1" data-b-sale="">
	<%@include file="../../header1.jsp" %>
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
													<a href="#" class="but mail" onclick="return false">Email
														this tour</a>
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
																<h3>Need any help?</h3>
															</div>
															<div class="title tit">24/7 Customer Support</div>
															<div class="text">We are the online tour
																specialists with plenty of tour and travel experience.
																Our Customer Support Team have travelled collectively to
																hundreds of countries. They have extensive background
																information on tour operators and can help you with all
																of your questions.</div>
															<div class="t">
																<div class="wp">
																	<img
																		src="//cdn.tourradar.com/s3/team/original/56_WuDKKWiZ.jpg"
																		alt="Carla"><span>Carla</span>
																</div>
																<div class="wp">
																	<img
																		src="//cdn.tourradar.com/s3/team/original/29_r2HPbRjc.jpg"
																		alt="Melissa"><span>Melissa</span>
																</div>
																<div class="wp">
																	<img
																		src="//cdn.tourradar.com/s3/team/original/60_ZRwxcmfT.jpg"
																		alt="Jonathan"><span>Jonathan</span>
																</div>
																<div class="wp">
																	<img
																		src="//cdn.tourradar.com/s3/team/original/47_K7bg36vA.jpg"
																		alt="Sebastian"><span>Sebastian</span>
																</div>
																<div class="wp">
																	<img
																		src="//cdn.tourradar.com/s3/team/original/22_qyfcaezY.jpg"
																		alt="Natalia"><span>Natalia</span>
																</div>
																<div class="wp">
																	<img
																		src="//cdn.tourradar.com/s3/team/original/26_UTZtK9MY.jpg"
																		alt="Carly"><span>Carly</span>
																</div>
															</div>
															<div class="title">
																Call us +1 844 311 3006
																<div class="free">TOLL FREE</div>
															</div>
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
	<script
		src="//cdn.tourradar.com/include/pw/book_now/script.v1513001935.min.js"
		async=""></script>
	<script src="//www.googleadservices.com/pagead/conversion_async.js"
		async=""></script>
	<script src="//www.google-analytics.com/cx/api.js" async=""></script>
	<script src="//cdn.tourradar.com/include/js/om/om.v1513001935.js"
		async=""></script>
	<script>
		(function(event, event2) {
			function cb(e) {
				this.removeEventListener(event, cb);
				this.removeEventListener(event2, cb);
				(new Image(1, 1)).src = "//bat.bing.com/action/0?ti=5089755&Ver=2";

				!function(b, e, v, t, s) {
					t = b.createElement(e);
					t.async = !0;
					t.src = v;
					s = b.getElementsByTagName(e)[0];
					s.parentNode.insertBefore(t, s)
				}(document, 'script',
						'https://connect.facebook.net/en_US/fbevents.js');
			}
			window.addEventListener(event, cb);
			window.addEventListener(event2, cb);
		})("mousemove", "touchmove");
	</script>
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
	</script>
</body>
</html>