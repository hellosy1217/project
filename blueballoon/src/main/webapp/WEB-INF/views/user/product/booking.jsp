<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html class="resp">
<head>
<title>Secure booking - European Magic - from London - TourRadar</title>
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/booking1.css?ver=1"
	rel="stylesheet" type="text/css" />
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="//cdn.tourradar.com/include/bower/braintree-web-3/client.v1512641452.js"
	async=""></script>
<script
	src="//cdn.tourradar.com/include/bower/braintree-web-3/hosted-fields.v1512641452.js"
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
	ga('set', 'exp', 'clrVfYzHTFOgY8Nxn_HauQ.1');

	ga('set', 'dimension10', '82936');
	ga('set', 'dimension11', 'Europe');
	ga('set', 'dimension18', 'conversionintent');
	ga('set', 'dimension19', '1080.38');

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
	src="//cdn.tourradar.com/include/js/zepto.v1512641452.min.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/bower/moment/min/moment.v1512641452.min.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/js/zepto-fx.v1512641452.min.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/js/zepto-anim.v1512641452.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/book_now_b/async.v1512641452.css">
<script async=""
	src="//cdn.tourradar.com/include/js/jquery.unveil.v1512641452.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/bower/moment/min/moment.v1512641452.min.js"></script>
</head>
<body class="tb resp" data-r="1" data-b-sale="">
	<!-- 헤더부분인데 깨져서 일단 뺌 -->
	<main
		data-parameters="{&quot;version&quot;:1512641452,&quot;objectId&quot;:&quot;82936&quot;,&quot;tourId&quot;:&quot;82936&quot;,&quot;isEnquiry&quot;:false,&quot;currency&quot;:&quot;usd&quot;,&quot;currencyRate&quot;:0.85,&quot;symbol&quot;:&quot;$&quot;,&quot;showMonths&quot;:6,&quot;currentDate&quot;:&quot;1514070000&quot;,&quot;tourLength&quot;:&quot;11&quot;,&quot;partner&quot;:null,&quot;paymentMethods&quot;:{&quot;details&quot;:{&quot;paymentImages&quot;:{&quot;Visa&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/Visa.png&quot;,&quot;MasterCard&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/MasterCard.png&quot;,&quot;Maestro&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/Maestro.png&quot;,&quot;American-Express&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/American-Express.png&quot;,&quot;PayPal&quot;:&quot;\/images\/responsive\/payment_providers\/card_logos\/PayPal.png&quot;},&quot;paymentDetails&quot;:{&quot;amount&quot;:1,&quot;countryCode&quot;:&quot;AT&quot;,&quot;currencyCode&quot;:&quot;USD&quot;},&quot;paymentMethods&quot;:{&quot;Braintree&quot;:{&quot;paymentAccess&quot;:{&quot;token&quot;:&quot;eyJ2ZXJzaW9uIjoyLCJhdXRob3JpemF0aW9uRmluZ2VycHJpbnQiOiJjZDRlNmUyYjQ3NGJlOTIxMjdkMzRiMTQ2MmMzMjAwNGE1YTBiZTJjZThiMzQ3YzllYjk3MDVjN2Q2NDY0MmM2fGNyZWF0ZWRfYXQ9MjAxNy0xMi0wNlQyMzozMDowOS4xODAxNjAxNTMrMDAwMFx1MDAyNm1lcmNoYW50X2lkPW16M3Q3YzZtYzM2ZDN2NHlcdTAwMjZwdWJsaWNfa2V5PTM1cjZkajZ4ZGZjeHQ3eDUiLCJjb25maWdVcmwiOiJodHRwczovL2FwaS5icmFpbnRyZWVnYXRld2F5LmNvbTo0NDMvbWVyY2hhbnRzL216M3Q3YzZtYzM2ZDN2NHkvY2xpZW50X2FwaS92MS9jb25maWd1cmF0aW9uIiwiY2hhbGxlbmdlcyI6WyJjdnYiXSwiZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwiY2xpZW50QXBpVXJsIjoiaHR0cHM6Ly9hcGkuYnJhaW50cmVlZ2F0ZXdheS5jb206NDQzL21lcmNoYW50cy9tejN0N2M2bWMzNmQzdjR5L2NsaWVudF9hcGkiLCJhc3NldHNVcmwiOiJodHRwczovL2Fzc2V0cy5icmFpbnRyZWVnYXRld2F5LmNvbSIsImF1dGhVcmwiOiJodHRwczovL2F1dGgudmVubW8uY29tIiwiYW5hbHl0aWNzIjp7InVybCI6Imh0dHBzOi8vY2xpZW50LWFuYWx5dGljcy5icmFpbnRyZWVnYXRld2F5LmNvbS9tejN0N2M2bWMzNmQzdjR5In0sInRocmVlRFNlY3VyZUVuYWJsZWQiOmZhbHNlLCJwYXlwYWxFbmFibGVkIjp0cnVlLCJwYXlwYWwiOnsiZGlzcGxheU5hbWUiOiJUb3VyUmFkYXIiLCJjbGllbnRJZCI6IkFac1NJaERwczkxUlZQX2lucXZXRGMzZFJpVl8zcHNaQTFPWVQxS0p4eDRzQzJHMGR5aC1XR0ZzM2NvZSIsInByaXZhY3lVcmwiOiJodHRwOi8vd3d3LnRvdXJyYWRhci5jb20vcHJpdmFjeSIsInVzZXJBZ3JlZW1lbnRVcmwiOiJodHRwOi8vd3d3LnRvdXJyYWRhci5jb20vdGVybXMtY29uZGl0aW9ucy8iLCJiYXNlVXJsIjoiaHR0cHM6Ly9hc3NldHMuYnJhaW50cmVlZ2F0ZXdheS5jb20iLCJhc3NldHNVcmwiOiJodHRwczovL2NoZWNrb3V0LnBheXBhbC5jb20iLCJkaXJlY3RCYXNlVXJsIjpudWxsLCJhbGxvd0h0dHAiOmZhbHNlLCJlbnZpcm9ubWVudE5vTmV0d29yayI6ZmFsc2UsImVudmlyb25tZW50IjoibGl2ZSIsInVudmV0dGVkTWVyY2hhbnQiOmZhbHNlLCJicmFpbnRyZWVDbGllbnRJZCI6IkFSS3JZUkRoM0FHWER6VzdzT18zYlNrcS1VMUM3SEdfdVdOQy16NTdMallTRE5VT1NhT3RJYTlxNlZwVyIsImJpbGxpbmdBZ3JlZW1lbnRzRW5hYmxlZCI6dHJ1ZSwibWVyY2hhbnRBY2NvdW50SWQiOiJ0b3VycmFkYXIyRVVSIiwiY3VycmVuY3lJc29Db2RlIjoiRVVSIn0sIm1lcmNoYW50SWQiOiJtejN0N2M2bWMzNmQzdjR5IiwidmVubW8iOiJvZmYifQ==&quot;,&quot;customer&quot;:null},&quot;paymentMethods&quot;:[{&quot;id&quot;:1,&quot;label&quot;:&quot;Visa&quot;,&quot;group&quot;:&quot;cards&quot;,&quot;order&quot;:1,&quot;fields&quot;:[{&quot;id&quot;:&quot;cardHolder&quot;,&quot;type&quot;:&quot;custom&quot;,&quot;label&quot;:&quot;Cardholder Name&quot;,&quot;order&quot;:1,&quot;placeholder&quot;:&quot;i.e. John Smith&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:1000,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;cardNumber&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;Card Number&quot;,&quot;order&quot;:2,&quot;mask&quot;:&quot;{{9999}} {{9999}} {{9999}} {{9999}} {{999}}&quot;,&quot;placeholder&quot;:&quot;**** **** **** ****&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:12,&quot;maxLength&quot;:19,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;expiryDate&quot;,&quot;type&quot;:&quot;expirydate&quot;,&quot;label&quot;:&quot;Expiry Date&quot;,&quot;order&quot;:3,&quot;mask&quot;:&quot;{{99}}\/{{99}}&quot;,&quot;placeholder&quot;:&quot;MM \/ YYYY&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:4,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^(?:0[1-9]|1[0-2])[0-9]{2}$&quot;}},{&quot;id&quot;:&quot;cvv&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;CVV&quot;,&quot;order&quot;:4,&quot;mask&quot;:&quot;{{9999}}&quot;,&quot;placeholder&quot;:&quot;123&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^[0-9]{3}[0-9]?$&quot;}}]},{&quot;id&quot;:2,&quot;label&quot;:&quot;MasterCard&quot;,&quot;group&quot;:&quot;cards&quot;,&quot;order&quot;:2,&quot;fields&quot;:[{&quot;id&quot;:&quot;cardHolder&quot;,&quot;type&quot;:&quot;custom&quot;,&quot;label&quot;:&quot;Cardholder Name&quot;,&quot;order&quot;:1,&quot;placeholder&quot;:&quot;i.e. John Smith&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:1000,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;cardNumber&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;Card Number&quot;,&quot;order&quot;:2,&quot;mask&quot;:&quot;{{9999}} {{9999}} {{9999}} {{9999}} {{999}}&quot;,&quot;placeholder&quot;:&quot;**** **** **** ****&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:12,&quot;maxLength&quot;:19,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;expiryDate&quot;,&quot;type&quot;:&quot;expirydate&quot;,&quot;label&quot;:&quot;Expiry Date&quot;,&quot;order&quot;:3,&quot;mask&quot;:&quot;{{99}}\/{{99}}&quot;,&quot;placeholder&quot;:&quot;MM \/ YYYY&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:4,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^(?:0[1-9]|1[0-2])[0-9]{2}$&quot;}},{&quot;id&quot;:&quot;cvv&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;CVV&quot;,&quot;order&quot;:4,&quot;mask&quot;:&quot;{{9999}}&quot;,&quot;placeholder&quot;:&quot;123&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^[0-9]{3}[0-9]?$&quot;}}]},{&quot;id&quot;:5,&quot;label&quot;:&quot;Maestro&quot;,&quot;group&quot;:&quot;cards&quot;,&quot;order&quot;:5,&quot;fields&quot;:[{&quot;id&quot;:&quot;cardHolder&quot;,&quot;type&quot;:&quot;custom&quot;,&quot;label&quot;:&quot;Cardholder Name&quot;,&quot;order&quot;:1,&quot;placeholder&quot;:&quot;i.e. John Smith&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:1000,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;cardNumber&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;Card Number&quot;,&quot;order&quot;:2,&quot;mask&quot;:&quot;{{9999}} {{9999}} {{9999}} {{9999}} {{999}}&quot;,&quot;placeholder&quot;:&quot;**** **** **** ****&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:12,&quot;maxLength&quot;:19,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;expiryDate&quot;,&quot;type&quot;:&quot;expirydate&quot;,&quot;label&quot;:&quot;Expiry Date&quot;,&quot;order&quot;:3,&quot;mask&quot;:&quot;{{99}}\/{{99}}&quot;,&quot;placeholder&quot;:&quot;MM \/ YYYY&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:4,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^(?:0[1-9]|1[0-2])[0-9]{2}$&quot;}},{&quot;id&quot;:&quot;cvv&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;CVV&quot;,&quot;order&quot;:4,&quot;mask&quot;:&quot;{{9999}}&quot;,&quot;placeholder&quot;:&quot;123&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^[0-9]{3}[0-9]?$&quot;}}]},{&quot;id&quot;:3,&quot;label&quot;:&quot;American Express&quot;,&quot;group&quot;:&quot;cards&quot;,&quot;order&quot;:3,&quot;fields&quot;:[{&quot;id&quot;:&quot;cardHolder&quot;,&quot;type&quot;:&quot;custom&quot;,&quot;label&quot;:&quot;Cardholder Name&quot;,&quot;order&quot;:1,&quot;placeholder&quot;:&quot;i.e. John Smith&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:1000,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;cardNumber&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;Card Number&quot;,&quot;order&quot;:2,&quot;mask&quot;:&quot;{{9999}} {{999999}} {{99999}} {{99999}}&quot;,&quot;placeholder&quot;:&quot;**** **** **** ****&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:12,&quot;maxLength&quot;:19,&quot;regexp&quot;:null}},{&quot;id&quot;:&quot;expiryDate&quot;,&quot;type&quot;:&quot;expirydate&quot;,&quot;label&quot;:&quot;Expiry Date&quot;,&quot;order&quot;:3,&quot;mask&quot;:&quot;{{99}}\/{{99}}&quot;,&quot;placeholder&quot;:&quot;MM \/ YYYY&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:4,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^(?:0[1-9]|1[0-2])[0-9]{2}$&quot;}},{&quot;id&quot;:&quot;cvv&quot;,&quot;type&quot;:&quot;numericstring&quot;,&quot;label&quot;:&quot;CVV&quot;,&quot;order&quot;:4,&quot;mask&quot;:&quot;{{9999}}&quot;,&quot;placeholder&quot;:&quot;1234&quot;,&quot;required&quot;:true,&quot;validation&quot;:{&quot;minLength&quot;:3,&quot;maxLength&quot;:4,&quot;regexp&quot;:&quot;^[0-9]{3}[0-9]?$&quot;}}]},{&quot;id&quot;:4,&quot;label&quot;:&quot;PayPal&quot;,&quot;group&quot;:null,&quot;order&quot;:4,&quot;fields&quot;:null}]}}},&quot;html&quot;:&quot;<form class=\&quot;fields \&quot;>
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
											<\/div><\/div><\/div><\/div><\/div><\/form>&quot;},&quot;pax&quot;:1,&quot;price&quot;:&quot;1080.38&quot;,&quot;browserSupportsTls&quot;:true,&quot;browserVersion&quot;:&quot;Safari
											11&quot;}" data-phone="+1 844 311 3006 " data-step="1">
											<div class="c">
												<ul class="steps">
													<li data-id="1" class="active">Your Tour</li>
													<li data-id="2">Traveller Details</li>
													<li data-id="3">Confirm &amp; Pay</li>
												</ul>
												<div class="book">
													<div class="left">
														<section class="s-main-title">
															<div class="step-text">Your Tour</div>
															<h1>European Magic - from London</h1>
															<div class="op_name">Operated by Indigo Travel</div>
														</section>
														<section class="step step1 step3 s-dates">
															<div class="departure">
																<div class="date">
																	<div class="month">Sunday</div>
																	<div class="day">Dec 24, 2017</div>
																	<div class="city">from London</div>
																</div>
																<div class="date">
																	<div class="month">Wednesday</div>
																	<div class="day">Jan 3, 2018</div>
																	<div class="city">to London</div>
																</div>
																<div class="length">11 Days</div>
															</div>
														</section>
														<div class="step step1 step3 block departure">
															<div class="calendar  hid ">
																<div class="months">
																	<div class="right-arrow inactive hid"></div>
																	<div class="left-arrow inactive hid"></div>
																	<div class="content">
																		<ul style="width: 0px; margin-left: 0px;">
																			<li id="month-2017-12" class="selected"
																				style="width: 0px;"><div>
																					<span></span> Dec 2017
																				</div></li>
																			<li id="month-2018-01" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Jan 2018
																				</div></li>
																			<li id="month-2018-02" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Feb 2018
																				</div></li>
																			<li id="month-2018-03" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Mar 2018
																				</div></li>
																			<li id="month-2018-04" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Apr 2018
																				</div></li>
																			<li id="month-2018-05" class="empty"
																				style="width: 0px;"><div>
																					<span></span> May 2018
																				</div></li>
																			<li id="month-2018-06" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Jun 2018
																				</div></li>
																			<li id="month-2018-07" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Jul 2018
																				</div></li>
																			<li id="month-2018-08" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Aug 2018
																				</div></li>
																			<li id="month-2018-09" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Sep 2018
																				</div></li>
																			<li id="month-2018-10" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Oct 2018
																				</div></li>
																			<li id="month-2018-11" class="empty"
																				style="width: 0px;"><div>
																					<span></span> Nov 2018
																				</div></li>
																			<li id="month-2018-12" class="" style="width: 0px;"><div>
																					<span></span> Dec 2018
																				</div></li>
																		</ul>
																	</div>
																</div>
																<div class="dates">
																	<table>
																		<tbody>
																			<tr>
																				<th>mon</th>
																				<th>tue</th>
																				<th>wed</th>
																				<th>thu</th>
																				<th>fri</th>
																				<th>sat</th>
																				<th>sun</th>
																			</tr>
																			<tr>
																				<td class=""></td>
																				<td class=""></td>
																				<td class=""></td>
																				<td class=""></td>
																				<td id="day-2017-12-01" class="all  empty"><div
																						class="container">
																						<div class="day">1</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-02" class="all  empty"><div
																						class="container">
																						<div class="day">2</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-03" class="all  empty"><div
																						class="container">
																						<div class="day">3</div>
																						<div class="next"></div>
																					</div></td>
																			</tr>
																			<tr>
																				<td id="day-2017-12-04" class="all  empty"><div
																						class="container">
																						<div class="day">4</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-05" class="all  empty"><div
																						class="container">
																						<div class="day">5</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-06" class="all  empty"><div
																						class="container">
																						<div class="day">6</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-07" class="all  empty"><div
																						class="container">
																						<div class="day">7</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-08" class="all  empty"><div
																						class="container">
																						<div class="day">8</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-09" class="all  empty"><div
																						class="container">
																						<div class="day">9</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-10" class="all  empty"><div
																						class="container">
																						<div class="day">10</div>
																						<div class="next"></div>
																					</div></td>
																			</tr>
																			<tr>
																				<td id="day-2017-12-11" class="all  empty"><div
																						class="container">
																						<div class="day">11</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-12" class="all  empty"><div
																						class="container">
																						<div class="day">12</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-13" class="all  empty"><div
																						class="container">
																						<div class="day">13</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-14" class="all  empty"><div
																						class="container">
																						<div class="day">14</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-15" class="all  empty"><div
																						class="container">
																						<div class="day">15</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-16" class="all  empty"><div
																						class="container">
																						<div class="day">16</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-17" class="all  empty"><div
																						class="container">
																						<div class="day">17</div>
																						<div class="next"></div>
																					</div></td>
																			</tr>
																			<tr>
																				<td id="day-2017-12-18" class="all  empty"><div
																						class="container">
																						<div class="day">18</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-19" class="all  empty"><div
																						class="container">
																						<div class="day">19</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-20" class="all  empty"><div
																						class="container">
																						<div class="day">20</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-21" class="all  empty"><div
																						class="container">
																						<div class="day">21</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-22" class="all  empty"><div
																						class="container">
																						<div class="day">22</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-23" class="all  empty"><div
																						class="container">
																						<div class="day">23</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-24"
																					class="all  possible selected"><div
																						class="container">
																						<div class="day">24</div>
																						<div class="seats">10+</div>
																						<div class="price ">$1080</div>
																						<div class="pcs"></div>
																						<div class="next"></div>
																					</div></td>
																			</tr>
																			<tr>
																				<td id="day-2017-12-25" class="all  empty onway"><div
																						class="container">
																						<div class="day">25</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-26" class="all  empty onway"><div
																						class="container">
																						<div class="day">26</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-27" class="all  empty onway"><div
																						class="container">
																						<div class="day">27</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-28" class="all  empty onway"><div
																						class="container">
																						<div class="day">28</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-29" class="all  empty onway"><div
																						class="container">
																						<div class="day">29</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-30" class="all  empty onway"><div
																						class="container">
																						<div class="day">30</div>
																						<div class="next"></div>
																					</div></td>
																				<td id="day-2017-12-31"
																					class="all  empty onway next"><div
																						class="container">
																						<div class="day">31</div>
																						<div class="next"></div>
																					</div></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
															<div id="seats">
																<div class="content">
																	<div class="with-calendar hid ">
																		<div class="icon deal">
																			<b>Save 17%</b> on this departure. <a href="#"
																				class="promotionPopup" data-id="588797"
																				data-tour-id="82936" data-variant-id="699831232"
																				data-pax="1">See details</a>
																		</div>
																	</div>
																	<div class="instant icon">
																		<strong>Instant Book:</strong> Your spaces will be
																		instantly secured.
																	</div>
																	<div class="seats icon ">
																		10+ spaces left <a href="#" onclick="return false"
																			class="change" data-text-close="Close calendar"
																			data-text-change="Change date"> Change date </a>
																	</div>
																</div>
															</div>
														</div>
														<div class="step step3 block travellers-info">
															<div class="head">
																<h3>Travellers</h3>
															</div>
															<div class="travellers-info-list"></div>
														</div>
														<div class="step step1 block details ">
															<div class="unselectable " unselectable="on">
																<h3 class="in">인원</h3>
																<div class="in quantity">
																	<span class="number minus  grey "></span><input
																		type="number" value="1" min="1" max="30"
																		inputmode="numeric" pattern="[0-9]*"><span
																		class="number plus "></span>
																</div>
																<div class="in solo"></div>
															</div>
														</div>
														<div class="step step1 block accommodation ">
															<div class="head">
																<h3>Select your accommodation</h3>
															</div>
															<div class="room-content"></div>
															<div class="content" data-friends="1">
																<div class="types">
																	<div>
																		<div class="error main hid">Please select an
																			accommodation to continue with the booking process</div>
																	</div>
																	<div class="radio ">
																		<input type="radio" name="accommodation"
																			value="Single Ensuite" id="accommodation-2">
																		<div class="check but w-blue"></div>
																		<div class="label" for="accommodation-2">
																			<div class="descr">
																				<b><div class="beds ">
																						<span>인원</span>1
																					</div>
																					<div class="name">스위트룸</div></b>방 설명
																			</div>
																			<div class="pr">
																				<b>+추가금액</b>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="step step2 block details travellers-list">
															<form>
																<div class="traveller" data-traveller-number="1">
																	<h4>Lead Traveller</h4>
																	<div class="fields">
																		<section>
																			<div>
																				<div
																					class="
        row
                                    "
																					data-seo="first-name" data-id="2"
																					data-error-empty="Please enter a name"
																					data-error-wrong="Please enter a name"
																					data-required="1">
																					<label class="cell title unselectable" for="t2-1">
																						First Name </label>
																					<div class="cell validity-con" data-type="string">
																						<input type="text"
																							autocomplete="section-1 given-name"
																							name="field2[]" placeholder="" value="" id="t2-1">
																					</div>
																				</div>
																				<div
																					class="
        row
                                    "
																					data-seo="last-name" data-id="4"
																					data-error-empty="Please enter a last name"
																					data-error-wrong="Please enter a last name"
																					data-required="1">
																					<label class="cell title unselectable" for="t4-1">
																						Last Name </label>
																					<div class="cell validity-con" data-type="string">
																						<input type="text"
																							autocomplete="section-1 family-name"
																							name="field4[]" placeholder="" value="" id="t4-1">
																					</div>
																				</div>
																				<div
																					class="
        row
                                    "
																					data-seo="email" data-id="5"
																					data-error-empty="Please enter a valid email address"
																					data-error-wrong="Please enter a valid email address"
																					data-required="1">
																					<label class="cell title unselectable" for="t5-1">
																						Email </label>
																					<div class="cell validity-con" data-type="email">
																						<input type="email" autocomplete="section-1 email"
																							name="field5[]" placeholder="Enter email address"
																							value="" id="t5-1">
																					</div>
																				</div>
																				<div
																					class="
        row
                                    "
																					data-seo="phone-number" data-id="6"
																					data-error-empty="Please enter your full number"
																					data-error-wrong="Please enter your full number"
																					data-required="1">
																					<label class="cell title unselectable" for="t6-1">
																						Phone Number </label>
																					<div class="cell validity-con" data-type="phone">
																						<input class="tel" type="tel" name="field6-tel"
																							placeholder="e.g. +82 1234 567890" value=""
																							id="t6-1" autocomplete="section-1 tel">
																					</div>
																				</div>
																				
																			
																				
																				<div
																					class="
        row
                                    "
																					data-seo="state-or-province" data-id="12"
																					data-error-empty="Please enter a state or province"
																					data-error-wrong="Please enter a state or province"
																					data-required="1">
																					<label class="cell title unselectable" for="t12-1">
																						State or Province </label>
																					<div class="cell validity-con" data-type="string">
																						<input type="text"
																							autocomplete="section-1 address-level1"
																							name="field12[]" placeholder="e.g. California"
																							value="" id="t12-1">
																					</div>
																				</div>
																				<div
																					class="
        row
                                    "
																					data-seo="country" data-id="13"
																					data-error-empty="Select a country"
																					data-error-wrong="Select a country"
																					data-required="1">
																					<label class="cell title unselectable" for="t13-1">
																						Country </label>
																					<div class="cell validity-con" data-type="country">
																						<select name="field13[]" id="t13-1"
																							autocomplete="section-1 country-name"><option
																								selected="" disabled="" value="">Select
																								Country</option>
																							<option value="Australia">Australia</option>
																							<option value="Canada">Canada</option>
																							<option value="New Zealand">New Zealand</option>
																							<option value="USA">USA</option>
																							<option value="England">United Kingdom</option>
																							<option disabled="">Ã¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂÃ¢ÂÂ</option>
																							<option value="Afghanistan">Afghanistan</option>
																							<option value="Albania">Albania</option>
																							<option value="Algeria">Algeria</option>
																							<option value="American Samoa">American
																								Samoa</option>
																							<option value="Andorra">Andorra</option>
																							<option value="Angola">Angola</option>
																							<option value="Anguilla">Anguilla</option>
																							<option value="Antigua and Barbuda">Antigua
																								and Barbuda</option>
																							<option value="Argentina">Argentina</option>
																							<option value="Armenia">Armenia</option>
																							<option value="Aruba">Aruba</option>
																							<option value="Austria">Austria</option>
																							<option value="Azerbaijan">Azerbaijan</option>
																							<option value="Bahamas">Bahamas</option>
																							<option value="Bahrain">Bahrain</option>
																							<option value="Bangladesh">Bangladesh</option>
																							<option value="Barbados">Barbados</option>
																							<option value="Belarus">Belarus</option>
																							<option value="Belgium">Belgium</option>
																							<option value="Belize">Belize</option>
																							<option value="Benin">Benin</option>
																							<option value="Bermuda">Bermuda</option>
																							<option value="Bhutan">Bhutan</option>
																							<option value="Bolivia">Bolivia</option>
																							<option value="Borneo">Borneo</option>
																							<option value="Bosnia">Bosnia</option>
																							<option value="Botswana">Botswana</option>
																							<option value="Brazil">Brazil</option>
																							<option value="Brunei">Brunei</option>
																							<option value="Bulgaria">Bulgaria</option>
																							<option value="Burkina Faso">Burkina
																								Faso</option>
																							<option value="Burundi">Burundi</option>
																							<option value="Cambodia">Cambodia</option>
																							<option value="Cameroon">Cameroon</option>
																							<option value="Cape Verde">Cape Verde</option>
																							<option value="Cayman Islands">Cayman
																								Islands</option>
																							<option value="Central African Republic">Central
																								African Republic</option>
																							<option value="Chad">Chad</option>
																							<option value="Chile">Chile</option>
																							<option value="China">China</option>
																							<option value="Colombia">Colombia</option>
																							<option value="Comoros">Comoros</option>
																							<option value="Congo">Congo</option>
																							<option value="Cook Islands">Cook
																								Islands</option>
																							<option value="Costa Rica">Costa Rica</option>
																							<option value="Cote dlvoire">Cote
																								dlvoire</option>
																							<option value="Country of CuraÃÂ§ao">Country
																								of CuraÃÂ§ao</option>
																							<option value="Croatia">Croatia</option>
																							<option value="Cuba">Cuba</option>
																							<option value="Cyprus">Cyprus</option>
																							<option value="Czech Republic">Czech
																								Republic</option>
																							<option value="DR of Congo">DR of Congo</option>
																							<option value="Denmark">Denmark</option>
																							<option value="Djibouti">Djibouti</option>
																							<option value="Dominica">Dominica</option>
																							<option value="Dominican Republic">Dominican
																								Republic</option>
																							<option value="East Timor">East Timor</option>
																							<option value="Ecuador">Ecuador</option>
																							<option value="Egypt">Egypt</option>
																							<option value="El Salvador">El Salvador</option>
																							<option value="Equatorial Guinea">Equatorial
																								Guinea</option>
																							<option value="Eritrea">Eritrea</option>
																							<option value="Estonia">Estonia</option>
																							<option value="Ethiopia">Ethiopia</option>
																							<option value="Falkland Islands">Falkland
																								Islands</option>
																							<option value="Faroe Islands">Faroe
																								Islands</option>
																							<option value="Federated States of Micronesia">Federated
																								States of Micronesia</option>
																							<option value="Fiji">Fiji</option>
																							<option value="Finland">Finland</option>
																							<option value="France">France</option>
																							<option value="French Polynesia">French
																								Polynesia</option>
																							<option value="Gabon">Gabon</option>
																							<option value="Georgia">Georgia</option>
																							<option value="Germany">Germany</option>
																							<option value="Ghana">Ghana</option>
																							<option value="Gibraltar">Gibraltar</option>
																							<option value="Greece">Greece</option>
																							<option value="Greenland">Greenland</option>
																							<option value="Grenada">Grenada</option>
																							<option value="Guadeloupe">Guadeloupe</option>
																							<option value="Guam">Guam</option>
																							<option value="Guatemala">Guatemala</option>
																							<option value="Guernsey">Guernsey</option>
																							<option value="Guinea">Guinea</option>
																							<option value="Guinea-Bissau">Guinea-Bissau</option>
																							<option value="Guyana">Guyana</option>
																							<option value="Haiti">Haiti</option>
																							<option value="Honduras">Honduras</option>
																							<option value="Hong Kong">Hong Kong</option>
																							<option value="Hungary">Hungary</option>
																							<option value="Iceland">Iceland</option>
																							<option value="India">India</option>
																							<option value="Indonesia">Indonesia</option>
																							<option value="Iran">Iran</option>
																							<option value="Iraq">Iraq</option>
																							<option value="Ireland">Ireland</option>
																							<option value="Israel">Israel</option>
																							<option value="Italy">Italy</option>
																							<option value="Jamaica">Jamaica</option>
																							<option value="Japan">Japan</option>
																							<option value="Jersey">Jersey</option>
																							<option value="Jordan">Jordan</option>
																							<option value="Kazakhstan">Kazakhstan</option>
																							<option value="Kenya">Kenya</option>
																							<option value="Korea, North">Korea,
																								North</option>
																							<option value="Korea, South">Korea,
																								South</option>
																							<option value="Kosovo">Kosovo</option>
																							<option value="Kuwait">Kuwait</option>
																							<option value="Kyrgyzstan">Kyrgyzstan</option>
																							<option value="Laos">Laos</option>
																							<option value="Latvia">Latvia</option>
																							<option value="Lebanon">Lebanon</option>
																							<option value="Lesotho">Lesotho</option>
																							<option value="Liberia">Liberia</option>
																							<option value="Libya">Libya</option>
																							<option value="Liechtenstein">Liechtenstein</option>
																							<option value="Lithuania">Lithuania</option>
																							<option value="Luxembourg">Luxembourg</option>
																							<option value="Macedonia">Macedonia</option>
																							<option value="Madagascar">Madagascar</option>
																							<option value="Malawi">Malawi</option>
																							<option value="Malaysia">Malaysia</option>
																							<option value="Maldives">Maldives</option>
																							<option value="Mali">Mali</option>
																							<option value="Malta">Malta</option>
																							<option value="Man, Isle of">Man, Isle
																								of</option>
																							<option value="Martinique">Martinique</option>
																							<option value="Mauritania">Mauritania</option>
																							<option value="Mauritius">Mauritius</option>
																							<option value="Mexico">Mexico</option>
																							<option value="Moldova">Moldova</option>
																							<option value="Monaco">Monaco</option>
																							<option value="Mongolia">Mongolia</option>
																							<option value="Montenegro">Montenegro</option>
																							<option value="Montserrat">Montserrat</option>
																							<option value="Morocco">Morocco</option>
																							<option value="Mozambique">Mozambique</option>
																							<option value="Myanmar (Burma)">Myanmar
																								(Burma)</option>
																							<option value="Namibia">Namibia</option>
																							<option value="Nauru">Nauru</option>
																							<option value="Nepal">Nepal</option>
																							<option value="Netherlands">Netherlands</option>
																							<option value="New Caledonia">New
																								Caledonia</option>
																							<option value="Nicaragua">Nicaragua</option>
																							<option value="Niger">Niger</option>
																							<option value="Nigeria">Nigeria</option>
																							<option value="Northern Ireland">Northern
																								Ireland</option>
																							<option value="Norway">Norway</option>
																							<option value="Oman">Oman</option>
																							<option value="Pakistan">Pakistan</option>
																							<option value="Palestinian Territory">Palestinian
																								Territory</option>
																							<option value="Panama">Panama</option>
																							<option value="Papua New Guinea">Papua
																								New Guinea</option>
																							<option value="Paraguay">Paraguay</option>
																							<option value="Peru">Peru</option>
																							<option value="Philippines">Philippines</option>
																							<option value="Poland">Poland</option>
																							<option value="Portugal">Portugal</option>
																							<option value="Puerto Rico">Puerto Rico</option>
																							<option value="Qatar">Qatar</option>
																							<option value="Reunion">Reunion</option>
																							<option value="Romania">Romania</option>
																							<option value="Russia">Russia</option>
																							<option value="Rwanda">Rwanda</option>
																							<option value="Saint Kitts and Nevis">Saint
																								Kitts and Nevis</option>
																							<option value="Saint Lucia">Saint Lucia</option>
																							<option value="Saint Pierre and Miquelon">Saint
																								Pierre and Miquelon</option>
																							<option value="Saint Vincent and the Grenadines">Saint
																								Vincent and the Grenadines</option>
																							<option value="Samoa">Samoa</option>
																							<option value="San Marino">San Marino</option>
																							<option value="Sao Tome and Principe">Sao
																								Tome and Principe</option>
																							<option value="Saudi Arabia">Saudi
																								Arabia</option>
																							<option value="Scotland">Scotland</option>
																							<option value="Senegal">Senegal</option>
																							<option value="Serbia">Serbia</option>
																							<option value="Seychelles">Seychelles</option>
																							<option value="Sierra Leone">Sierra
																								Leone</option>
																							<option value="Singapore">Singapore</option>
																							<option value="Slovakia">Slovakia</option>
																							<option value="Slovenia">Slovenia</option>
																							<option value="Solomon Islands">Solomon
																								Islands</option>
																							<option value="Somalia">Somalia</option>
																							<option value="South Africa">South
																								Africa</option>
																							<option value="Spain">Spain</option>
																							<option value="Sri Lanka">Sri Lanka</option>
																							<option value="St Martin">St Martin</option>
																							<option value="Sudan">Sudan</option>
																							<option value="Suriname">Suriname</option>
																							<option value="Svalbard">Svalbard</option>
																							<option value="Swaziland">Swaziland</option>
																							<option value="Sweden">Sweden</option>
																							<option value="Switzerland">Switzerland</option>
																							<option value="Syria">Syria</option>
																							<option value="Taiwan">Taiwan</option>
																							<option value="Tajikistan">Tajikistan</option>
																							<option value="Tanzania">Tanzania</option>
																							<option value="Thailand">Thailand</option>
																							<option value="The Gambia">The Gambia</option>
																							<option value="Togo">Togo</option>
																							<option value="Tonga">Tonga</option>
																							<option value="Trinidad and Tobago">Trinidad
																								and Tobago</option>
																							<option value="Tunisia">Tunisia</option>
																							<option value="Turkey">Turkey</option>
																							<option value="Turkmenistan">Turkmenistan</option>
																							<option value="Turks and Caicos Islands">Turks
																								and Caicos Islands</option>
																							<option value="Uganda">Uganda</option>
																							<option value="Ukraine">Ukraine</option>
																							<option value="United Arab Emirates">United
																								Arab Emirates</option>
																							<option value="Uruguay">Uruguay</option>
																							<option value="Uzbekistan">Uzbekistan</option>
																							<option value="Vanuatu">Vanuatu</option>
																							<option value="Vatican City (Holy See)">Vatican
																								City (Holy See)</option>
																							<option value="Venezuela">Venezuela</option>
																							<option value="Vietnam">Vietnam</option>
																							<option value="Virgin Island, British">Virgin
																								Island, British</option>
																							<option value="Virgin Islands, U.S.">Virgin
																								Islands, U.S.</option>
																							<option value="Wales">Wales</option>
																							<option value="Western Sahara">Western
																								Sahara</option>
																							<option value="Yemen">Yemen</option>
																							<option value="Zambia">Zambia</option>
																							<option value="Zimbabwe">Zimbabwe</option></select>
																					</div>
																				</div>
																			</div>
																		</section>
																	</div>
																</div>
															</form>
														</div>
														<div class="right">
															<div class="block">
																<div class="price-main">
																	<div>
																		<h4>영수증</h4>
																		<ul class="prices">
																			<li>패키지 가격
																				<div class="pr">1,000,000</div>
																			</li>
																			<li><div class="short">할인 가격</div>
																				<div class="pr">-100,000</div></li>
																			<li>인원
																				<div class="pr">1</div>
																			</li>
																			<li>총액 <b><div class="pr">900,000</div></b></li>
																		</ul>
																	</div>
																	<ul class="prices promo">
																		<li class="discount"><b class="green">
																			회원 할인 가격
																				<div class="pr">-50,000</div>
																		</b></li>
																	</ul>
																</div>
															</div>
															<div class="price-resume">
																<div class="block p-resume">
																	<div class="amount-due">
																		<div class="text">
																			<h3>결제 금액</h3>
																		</div>
																		<div class="pr ">
																			<b>$1,053.37</b>
																		</div>
																		<div class="pr  fly-button" style="top: 0px;">
																			<b>$1,053</b>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="step step3 block payment ">
															<h3>Select your payment method</h3>
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
															<div class="payment-fields">
																<form class="fields ">
																	<input type="hidden" name="paymentProvider"
																		value="Braintree">
																	<div class="row" data-field="paymentMethod">
																		<div class="cell title">Payment Method</div>
																		<div class="cell">
																			<div class="add">
																				<select id="payment_method" name="payment_method"><option
																						value="Visa">Visa</option>
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
																	<div class="row" data-field="cardHolder">
																		<div class="cell title">Cardholder Name</div>
																		<div class="cell validity-con">
																			<input class="field" id="cardHolder" maxlength="1000"
																				type="" placeholder="i.e. John Smith">
																		</div>
																	</div>
																	<div class="row" data-field="cardNumber">
																		<div class="cell title">Card Number</div>
																		<div class="cell validity-con">
																			<div class="hosted-field" id="cardNumber">
																				<iframe
																					src="https://assets.braintreegateway.com/web/3.21.0/html/hosted-fields-frame.min.html#e09d6982-1937-4260-9981-95d100eebdc5"
																					frameborder="0" allowtransparency="true"
																					scrolling="no" type="number"
																					name="braintree-hosted-field-number"
																					id="braintree-hosted-field-number"
																					style="border: none; width: 100%; height: 100%; float: left;"></iframe>
																				<div style="clear: both;"></div>
																			</div>
																		</div>
																	</div>
																	<div class="row" data-field="expiryDate">
																		<div class="cell title">Expiry Date</div>
																		<div class="cell validity-con">
																			<div class="hosted-field" id="expiryDate">
																				<iframe
																					src="https://assets.braintreegateway.com/web/3.21.0/html/hosted-fields-frame.min.html#e09d6982-1937-4260-9981-95d100eebdc5"
																					frameborder="0" allowtransparency="true"
																					scrolling="no" type="expirationDate"
																					name="braintree-hosted-field-expirationDate"
																					id="braintree-hosted-field-expirationDate"
																					style="border: none; width: 100%; height: 100%; float: left;"></iframe>
																				<div style="clear: both;"></div>
																			</div>
																		</div>
																	</div>
																	<div class="row" data-field="cvv">
																		<div class="cell title">CVV</div>
																		<div class="cell validity-con">
																			<div class="hosted-field" id="cvv">
																				<iframe
																					src="https://assets.braintreegateway.com/web/3.21.0/html/hosted-fields-frame.min.html#e09d6982-1937-4260-9981-95d100eebdc5"
																					frameborder="0" allowtransparency="true"
																					scrolling="no" type="cvv"
																					name="braintree-hosted-field-cvv"
																					id="braintree-hosted-field-cvv"
																					style="border: none; width: 100%; height: 100%; float: left;"></iframe>
																				<div style="clear: both;"></div>
																			</div>
																			<img
																				src="/images/responsive/payment_providers/CARDS.png"
																				class="img">
																		</div>
																	</div>
																</form>
															</div>
															<div class="end">
																<div class="checkbox">
																	<input type="checkbox" id="terms-agree" value="1"><label
																		for="terms-agree" class="terms-agree"> I
																		accept TourRadar's <a href="#" class="termsCoPopup"
																		data-id="terms_conditions">Terms &amp; Conditions</a>
																		and <a href="#" class="termsCoPopup"
																		data-id="privacy_policy">Privacy Policy</a>; and
																		Indigo Travel's <a href="#" class="termsCoPopup"
																		data-id="operator_1265">payment, cancellation and
																			refund conditions</a>.
																	</label><span></span>
																</div>
																<div class="book-button">
																	<a href="" class="but blue" data-type="Instant">Book
																		1 space</a>
																	<div class="notice">
																		You will be charged <b>$1,053.37</b>.
																	</div>
																</div>
															</div>
														</div>
														<div class="step step1 block next">
															<div class="next-button">
																<a href="#" class="but blue" onclick="return false">
																	Add traveller details </a>
																<div class="notice"></div>
															</div>
														</div>
														<div class="step step2 block next">
															<div class="next-button">
																<a href="#" class="but blue" onclick="return false">
																	Continue </a>
																<div class="notice">You can review this booking
																	before itÃ¢ÂÂs final.</div>
															</div>
														</div>
														<div class="block information">
															<div class="info">
																<div class="col">
																	<div class="best-price text">You've got the best
																		price</div>
																</div>
																<div class="col">
																	<div class="earn text">
																		Earn $<span class="travel-credits">32</span> travel
																		credits
																	</div>
																</div>
																<div class="col">
																	<div class="no-fees text">No booking or credit
																		card fees</div>
																</div>
															</div>
														</div>
													</div>
													<div class="left next-block">
														<div class="terms">
															<div class="text">
																TourRadar is an authorised Payment Agent of Indigo
																Travel. Please familiarise yourself with the Indigo
																Travel <a href="#" class="termsCoPopup"
																	data-id="operator_1265">payment, cancellation and
																	refund conditions</a> and TourRadar's <a href="#"
																	class="termsCoPopup" data-id="terms_conditions">Terms
																	&amp; Conditions</a>. TourRadar is an Austrian Company and
																will charge you in the stated currency and we do not
																charge any booking fees.
															</div>
															<div class="text">Operated by Indigo Travel</div>
															<div>186 Capstone Rd; Bournemouth; BH88RT</div>
															<div class="text">Agent: TourRadar</div>
															<div>Siebenbrunnengasse 17/4, Vienna 1050, Austria
															</div>
														</div>
													</div>
												</div>
											</div>
	</main>
	<script
		src="//cdn.tourradar.com/include/pw/book_now_b/script.v1512641452.min.js"
		async=""></script>
	<script src="//www.googleadservices.com/pagead/conversion_async.js"
		async=""></script>
	<script src="//www.google-analytics.com/cx/api.js" async=""></script>
	<script src="//cdn.tourradar.com/include/js/om/om.v1512641452.js"
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
	<noscript>&lt;img height="1" width="1" style="display:none"
		src="https://www.facebook.com/tr?id=806188949420761&amp;ev=PageView&amp;noscript=1"&gt;</noscript>
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
			"content_ids" : [ "82936" ],
			"value" : "1080.38",
			"currency" : "USD"
		} ]);
	</script>
	<a class="olark olark-tr-placeholder"> <svg x="0px" y="0px"
			viewBox="0 0 27 21.9">
					<path fill="#ffffff"
				d="M23.2,0L2.6,1.7C1,1.9,0,3.2,0,4.9v8c0,1.6,0.8,3,2.4,3.1l5.3,0.5c0,0,1,1.6,0.3,3.2C7.2,21.3,6,21.9,6,21.9 c4.2,0,6.6-3.1,7.8-4.9l9.4,0.7c1.8,0.2,3.8-1.3,3.8-3.1V3.1C27,1.3,25-0.1,23.2,0z M6.4,10.1c-0.9,0-1.7-0.7-1.7-1.7 c0-0.9,0.7-1.7,1.7-1.7C7.3,6.8,8,7.5,8,8.5C8,9.4,7.3,10.1,6.4,10.1z M13.2,10.1c-0.9,0-1.7-0.7-1.7-1.7c0-0.9,0.7-1.7,1.7-1.7 c0.9,0,1.7,0.7,1.7,1.7C14.8,9.4,14.1,10.1,13.2,10.1z M19.9,10.1c-0.9,0-1.7-0.7-1.7-1.7c0-0.9,0.7-1.7,1.7-1.7 c0.9,0,1.7,0.7,1.7,1.7C21.6,9.4,20.9,10.1,19.9,10.1z"></path>
				</svg>

		<p class="olark-button-text">Need help?</p>
	</a>
</body>
</html>