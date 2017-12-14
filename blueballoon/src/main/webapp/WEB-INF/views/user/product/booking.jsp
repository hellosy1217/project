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

</head>
<body class="tb" data-r="1" data-b-sale="">
	<header>
		<div class="c">
			<a href="goOut()"><img
				src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/header/logo1.png"
				width="170" height="35"></a>
			<div class="tag">
				booking tours made <b>easy</b>
			</div>
			<div class="right">
				<a href="#" onclick="return false" class="tel">+82 전화번호</a><a
					href="#" onclick="return false" class="help">고객센터</a>
			</div>
		</div>
	</header>
	<main data-parameters="" data-phone="+1 844 311 3006 ">
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
							<div class="i icon currency usd">예약 취소시 ~~~~ 청구됩니다.</div>
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
							<span class="number minus  grey "></span><input type="number"
								value="1" min="1" max="30" inputmode="numeric" pattern="[0-9]*"><span
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
								<div class="error main hid">Please select an accommodation
									to continue with the booking process</div>
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
								Earn $<span class="travel-credits">38</span> travel credits
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
							<input type="hidden" name="paymentProvider" value="Braintree">
							<div class="row" data-field="paymentMethod">
								<div class="cell title">Payment Method</div>
								<div class="cell">
									<div class="add">
										<select id="payment_method" name="payment_method" disabled=""><option
												value="Visa">Visa</option>
											<option value="MasterCard">MasterCard</option>
											<option value="Maestro">Maestro</option>
											<option value="American Express">American Express</option>
											<option value="PayPal">PayPal</option></select>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="end">
						<div class="checkbox">
							<input type="checkbox" id="terms-agree" value="1"><label
								for="terms-agree" class="terms-agree"> <a href="#"
								class="termsCoPopup" data-id="terms_agent">이용약관</a> 동의여부
							</label><span></span>
						</div>
						<div class="book-button">
							<a href="" class="but blue" data-type="Book">결제하기</a>
							<div class="notice">지금 얼마 계산하고 며칠 뒤에 얼마 계산 하는지 뜰 부분</div>
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
						<li>패키지일 경우 시작 위치<span class="date-start">패키지 시작 일</span></li>
						<li>패키지일 경우 끝 위치<span class="date-end">패키지 끝나는 날</span></li>
						<li class="wc">패키지일 경우 포함된 상품들 <span> ㅇㅇㅇ,ㅇㅇㅇㅇ,ㅇㅇ,ㅇㅇ </span></li>
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
							<li><div class="stext">ON 2nd Mar 2018</div>예약금 제외한 금액인데 명칭
								뭐라고 해야
								<div class="pr">
									<b>얼마</b>
								</div></li>
						</ul>
					</div>
				</div>
				<div class="block terms">
					<h4>이용 약관</h4>
					<div class="text">
						이용 약관 내용 들어갈 곳 <a href="" target="_blank">???</a> ㅇㅇㅇㅇㅇㅇ <a
							href="#" class="termsCoPopup" data-id="terms_agent">???</a>.
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