<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BlueBalloon</title>
<link
	href="${pageContext.request.contextPath}/resources/home/css/home1.css?ver=12"
	rel="stylesheet" type="text/css" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/tiny-autocomplete.v1-0-3.min.css"
	rel="stylesheet" />
<link rel="preconnect"
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/main.MOV">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/home/js/home1.js?ver=12"></script>
<!-- <script type="text/javascript">
	window.onload = function() {
		bbSearch('searchForm');
	};
</script> -->
</head>
<body class="tb" data-b-sale="">
	<c:choose>
		<c:when test="${member_email eq null }">
			<%@include file="header1.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="header3.jsp"%>
		</c:otherwise>
	</c:choose>
	<main data-page="home">
	<div class="top">
		<h1>
			<div class="im" style="background-color: white;">
				<video id="video" preload="auto" autoplay="true" loop="loop"
					muted="muted" volume="0" style="width: 100%; height: 100%;">
					<source
						src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/main.MOV">
				</video>
			</div>
		</h1>
		<div class="sch">
			<svg xmlns="http://www.w3.org/2000/svg" version="1.1" x="0" y="0"
				width="56" height="62" viewBox="0 0 56 62"
				enable-background="new 0 0 56 62" xml:space="preserve">
            <g transform="translate(0, -3)">
            <path fill="#FFF"
					d="M21.6 31.9c-0.3 1.7-0.6 3.5-0.9 5.2-0.3 1.3-0.3 3.4-0.9 4.5 1.7-0.1 8 1 8.4-0.9 0.6-2.9 1.2-5.9 1.6-8.8C27.1 31.9 24.3 31.5 21.6 31.9M35.3 27.4c4.8 0.4 9.6 0.5 14.4 1.1 2.4 0.3 4.3 0.2 5.8 2.2 1.2 1.6-0.9 1.5-2.1 1.4-4.5-0.1-9-0.1-13.5-0.2-1.4 0-2.8-0.1-4.2-0.1-1.8-0.1-1.4 1.5-1.6 3.1-0.3 2.3-0.7 4.5-1.4 6.8 4.5 0 9 0.1 13.4 0.8 2.1 0.3 3.1 0.4 3.4 2.6-1.4 1.6-4.5 1.3-6.4 1.3-2.5 0-5-0.2-7.5-0.2-1.4 0-2.8 0-4.1 0.2-0.2 1.2-0.4 2.3-0.6 3.5-0.7 4.9-1.4 9.7-2.5 14.6-3.5-1.3-3-4.9-2.7-8.1 0.3-3.3 0.8-6.8 1.6-10.1-1.8 0-3.6-0.1-5.4-0.1-1 0-1.9-0.1-2.9-0.1-0.2 0.8-0.4 1.5-0.5 2.3-0.6 3.3-0.6 6.9-1.5 10.1-0.3 1.7-0.6 2.6-2.5 2.1-2.1-0.6-1.7-2.1-1.4-3.8 0.6-3.6 1.6-7.1 2.1-10.7-3.5-0.3-7.1-0.2-10.6-0.2-2.1-0.2-2.7-0.7-2.4-2.9 0.2-1.7 2.2-1.6 3.5-1.6 1.5 0 3.1 0.1 4.6 0.2 0.8 0 1.7 0.1 2.5 0.1 1.3 0 2.8 0.7 3-0.8 0.4-3.2 0.9-6.4 1.3-9.5C13.7 31.2 10.3 31 7 30.6c-0.9-0.1-8.3-0.9-6.6-3 1.6-1.9 6.3-1.5 8.6-1.5 1.8 0 3.6 0 5.4 0.2 0.8 0.1 1.6 0.2 2.4 0.2 1.3 0.1 0.9-1 1-2 0.5-3.4 1-6.8 1.4-10.2 0.2-1.8 0.5-3.5 0.7-5.3 0.1-1.3-0.4-2 1.2-1.9 0.5 0 1.1-0.1 1.6 0.1 2.7 1.2 1.3 6.2 1 8.5-0.4 3.9-0.7 7.7-1.1 11.6 2.7-0.3 5.5-0.4 8.2-0.1 0.3-2.2 0.7-4.3 1-6.5 0.5-3 0.9-6 1.3-9 0.2-1.7 1-5 0-6.6 1.1-0.8 3.5-2.7 4.5-0.7 1 2.1 0.7 4.7 0.5 6.9C37.4 16.7 36.1 22 35.3 27.4" /></g></svg>
			<div class="tag">
				go<span><b class="is-f">touring</b><b>trekking</b><b>tasting</b><b>sailing</b><b>feeling</b></span>
			</div>
			<h2>Best prices on 1 million departures in Korea.</h2>
			<form name="f" id="searchForm" action="search"></form>
		</div>
		<div class="nxt"></div>
	</div>

	<section class="usps-section">
		<ul class="usp-list">
			<li class="usp-el"><a href="#" class="selection">
					<h3 class="title">최고의 선택</h3>
					<ul class="reason-list">
						<li class="reason">여행을 사랑하고 ,풍부한 경험있는 운영자</li>
						<li class="reason">색다른 체험, 다른 가치, 여운있는 추억</li>
						<li class="reason">여행고수 2천명 이상의 선택을 받은 패키지 투어</li>
					</ul>
			</a></li>
			<li class="usp-el"><a href="#" class="prices">
					<h3 class="title">최고의 가격</h3>
					<ul class="reason-list">
						<li class="reason">가성비 만족도 1위</li>
						<li class="reason">5천명 이상의 재 결제 고객보유</li>
						<li class="reason">최소 가격에 최대의 감동</li>
					</ul>
			</a></li>
			<li class="usp-el"><a href="#" class="payments">
					<h3 class="title">최고의 만족</h3>
					<ul class="reason-list">
						<li class="reason">고객과의 소통을 통한 피드백</li>
						<li class="reason">PayPal로 전 세계인들 모두 편리한 결제</li>
						<li class="reason">24시간 카카오톡 상담으로 빠른 반응</li>
					</ul>
			</a></li>
		</ul>
	</section>
	<div class="wl">
		<div class="c">
			<h2>인기여행지</h2>
			<!-- 인기여행지(지역) 6개 정도  -->
			<ul class="cf">
				<a href="product_list?cate_state='서울,경기'">
					<li data-wishlist="816784"><img class="lazy"
						src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/seoul/seoul1.png" />
						<div class="name">서울/경기</div></li>
				</a>
				<a href="product_list?cate_state='강원도'"><li data-wishlist="6"><img
						class="lazy"
						src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/gangwon/gangwon1.png" />
						<div class="name">강원도</div></li></a>
				<a href="product_list?cate_state='충청도'"><li
					data-wishlist="787113"><img class="lazy"
						src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/chungcheong/chungcheong1.jpg" />
						<div class="name">충청도</div></li></a>
				<a href="product_list?cate_state='전라도'"><li data-wishlist="1"><img
						class="lazy"
						src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/jeolla/jeolla1.png" />
						<div class="name">전라도</div></li></a>
				<a href="product_list?cate_state='경상도'"><li
					data-wishlist="786447"><img class="lazy"
						src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/kyungsang/kyungsang2.png" />
						<div class="name">경상도</div></li></a>
				<a href="product_list?cate_state='제주도'"><li data-wishlist="2"><img
						class="lazy"
						src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/jeju/jeju1.png" />
						<div class="name">제주도</div></li></a>
			</ul>
		</div>
	</div>
	<div class="dl">
		<div class="c">
			<h2>특가 상품</h2>
			<c:forEach begin="1" end="5">
				<a href="product_content" class="con" data-p="56"><img
					class="lazy"
					src="//cdn.tourradar.com/im/r/pw/home/cont/europe_dark.png"
					data-src="//cdn.tourradar.com/im/r/pw/home/cont/europe_dark.png">
					<div class="text">서울/경기</div></a>
			</c:forEach>
		</div>
		<div class="pc">
			<div class="p">
				Up to <span><span>56</span>% OFF</span>
			</div>
		</div>
	</div>
	<div class="cs">
		<div class="c">
			<h2>광주불주먹 외 4명</h2>
			<div class="t">
			<c:forTokens items="김수민,김유정,성지연,주소연,지수정" delims="," var="tm" varStatus="stt">
				<div class="wp">
					<img class="lazy"
						src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/img/${stt.count }.png" />
					<span>${tm }</span>
				</div>
				</c:forTokens>
			</div>
			<div class="t">
				우리 팀은 광주불주먹 두니야님의 지휘아래에 편성된 팀입니다. 살려주세요. <a href="contact.html">Contact
					us</a>
			</div>
		</div>
	</div>
	<div class="fv">
		<h2>원하는 모든 것과 더 많은 것</h2>
		<div class="grid" style="margin-left: -1434px;">
			<div class="l">
				<a href="product_content?prod_num=208"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/5.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/5.jpg"
					width="189" height="284">
					<div class="ls">
						호미곶<span>경상북도 포항시</span>
					</div></a><a href="product_content?prod_num=210"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/6.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/6.jpg"
					width="189" height="189">
					<div class="ls">
						대부해솔길<span>경기도 안산시</span>
					</div></a><a href="product_content?prod_num=98"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/7.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/7.jpg"
					width="189" height="189">
					<div class="ls">
						오동도<span>전라남도 여수시</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content?prod_num=100"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/9.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/9.jpg"
					width="189" height="189">
					<div class="ls">
						도깨비 촬영지<span>강원도 강릉시 주문읍</span>
					</div></a><a href="product_content?prod_num=211"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/8.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/8.jpg"
					width="189" height="189">
					<div class="ls">
						신비의 바닷길<span>전라남도 진도군</span>
					</div></a><a href="product_content" class="e4"><div class="w189 h284">
						축제<span>축제 관련 상품 수</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content?prod_num=213"><img class="lazy"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/2.jpg"
					width="284" height="483">
					<div class="ls">
						세계불꽃축제<span>서울 여의도 한강 공원</span>
					</div></a><a href="product_content?prod_num=101"><img class="lazy"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/1.jpg"
					width="284" height="189">
					<div class="ls">
						머드축제<span>충남 보령시</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content" class="e5"><div class="w189 h284">
						맛집<span>수</span>
					</div></a><a href="product_content"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/23.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/23.jpg"
					width="189" height="189">
					<div class="ls">
						치맥<span>대한민국 최고</span>
					</div></a><a href="product_content?prod_num=121"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/24.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/24.jpg"
					width="189" height="189">
					<div class="ls">
						치치퐁<span>제주도</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content?prod_num=122"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/25.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/25.jpg"
					width="189" height="189">
					<div class="ls">
						딱새우버거<span>제주도 서귀포시</span>
					</div></a><a href="product_content?prod_num=87"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/28.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/28.jpg"
					width="189" height="284">
					<div class="ls">
						빈대떡<span>광장시장</span>
					</div></a><a href="product_content?prod_num=201"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/27.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/27.jpg"
					width="189" height="189">
					<div class="ls">
						찜치닭<span>숙대입구</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content?prod_num=104"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/26.png"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/26.png"
					width="284" height="284">
					<div class="ls">
						흑돼지구이<span>제주도</span>
					</div></a><a href="product_content" class="e6"><div class="w284 h189">
						문화생활<span>수</span>
					</div></a><a href="product_content?prod_num=141"><img class="lazy"
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/19.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/19.jpg"
					width="284" height="189">
					<div class="ls">
						휘닉스파크<span>강원도 평창군</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content?prod_num=202"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/21.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/21.jpg"
					width="189" height="284">
					<div class="ls">
						롯데월드몰<span>서울특별시 송파구</span>
					</div></a><a href="product_content?prod_num=89"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/20.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/20.jpg"
					width="189" height="189">
					<div class="ls">
						동대문디자인플라자<span>서울특별시 중구</span>
					</div></a><a href="product_content?prod_num=204"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/22.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/22.jpg"
					width="189" height="189">
					<div class="ls">
						하남스타필드<span>경기도 하남시</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content" class="e1"><div class="w189 h189">
						관광지<span>문화 관련 상품 수</span>
					</div></a><a href="product_content?prod_num=205"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/14.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/14.jpg"
					width="189" height="189">
					<div class="ls">
						안압지<span>경상북도 경주시</span>
					</div></a><a href="product_content?prod_num=205"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/15.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/15.jpg"
					width="189" height="284">
					<div class="ls">
						석굴암<span>경상북도 경주시</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content?prod_num=90"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/16.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/16.jpg"
					width="284" height="483">
					<div class="ls">
						전동성당<span>전라북도 전주시</span>
					</div></a><a href="product_content?prod_num=91"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/17.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/17.jpg"
					width="284" height="189">
					<div class="ls">
						경복궁<span>서울특별시 종로구</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content?prod_num=92"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/18.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/18.jpg"
					width="189" height="189">
					<div class="ls">
						한국민속촌<span>경기도 용인시</span>
					</div></a><a href="/e/nature-adventure" class="e2"><div class="w189 h189">
						산<span>수</span>
					</div></a><a href="product_content?prod_num=93"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/10.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/10.jpg"
					width="189" height="284">
					<div class="ls">
						남산 서울타워<span>서울특별시 용산구</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content?prod_num=207"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/11.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/11.jpg"
					width="284" height="284">
					<div class="ls">
						지리산<span>경상남도 함양군</span>
					</div></a><a href="product_content?prod_num=94"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/12.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/12.jpg"
					width="284" height="189">
					<div class="ls">
						한라산<span>제주도특별자치도</span>
					</div></a><a href="product_content?prod_num=95"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/13.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/13.jpg"
					width="284" height="189">
					<div class="ls">
						설악산<span>강원도 강릉시</span>
					</div></a>
			</div>
			<div class="l">
				<a href="product_content" class="e3"><div class="w284 h189">
						바다<span>수</span>
					</div></a><a href="product_content?prod_num=96"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/3.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/3.jpg"
					width="284" height="189">
					<div class="ls">
						해운대<span>부산광역시</span>
					</div></a><a href="product_content?prod_num=97"><img class=""
					src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/4.jpg"
					data-src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/home/mainimage/4.jpg"
					width="284" height="284">
					<div class="ls">
						간절곶<span>울산광역시 </span>
					</div></a>
			</div>
		</div>
	</div>
	</main>
	<footer>
		<div class="c">
			<div class="cop">
				Copyright © BlueBalloon. All rights reserved.
			</div>
		</div>
	</footer>
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
</body>
</html>