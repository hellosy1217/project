<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/async.v1512456645.css?ver=12"
	rel="stylesheet" type="text/css" />
<script
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/js/1.js"
	async=""></script>
<div class="ups">
	<div class="c">
		<span class="hide-sm pull-left"><a href="member_find">일단은
				회원 찾기</a></span><span class="hide-sm"><a href="member_edit">일단은
				회원정보수정</a></span><span class="pull-right"><a href="admin_index">일단은
				ad min</a></span>
	</div>
</div>
<header>
	<div class="c">
		<div class="logo" style="margin-right: 0px;">
			<a href="home"> <img
				src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/header/logo1.png"
				width="170" height="35">
			</a>
		</div>
		<div class="tagln-search">
			<div class="tagln">
				booking tours made <b>easy</b>
			</div>
			<div class="search" data-domain="com">
				<input type="text" placeholder="Where do you want to go?">
				<div class="close">
					<span class="front"></span><span class="back"></span>
				</div>
			</div>
		</div>
		<ul style="margin-left: 277px;">
			<li class="dropdown fill" data-type="destinations"><a href="#">여행지</a>
				<nav class="">
					<ul class="top">
						<li data-type="africa"><a
							href="product_list?cate_city='서울특별시'"><span>서울특별시</span></a>
							<ul class="bot">
								<li><a href="product_list?cate_state='강남구'">강남구</a></li>
								<li><a href="product_list?cate_state='종로구'">종로구</a></li>
								<li><a href="product_list?cate_state='마포구'">마포구</a></li>
								<li><a href="product_list?cate_state='중구'">중구</a></li>
								<li><a href="product_list?cate_state='용산구'">용산구</a></li>
							</ul></li>
						<li data-type="australia-oceania"><a
							href="product_list?cate_city='경기도'"><span>경기도</span></a>
							<ul class="bot">
								<li><a href="product_list?cate_state='용인시'">용인시</a></li>
								<li><a href="product_list?cate_state='파주시'">파주시</a></li>
								<li><a href="product_list?cate_state='의정부시'">의정부시</a></li>
								<li><a href="product_list?cate_state='수원시'">수원시</a></li>
								<li><a href="product_list?cate_state='인천광역시">인천광역시</a></li>
							</ul></li>
						<li data-type="asia"><a href="product_list?cate_city='강원도'"><span>강원도</span></a>
							<ul class="bot">
								<li><a href="product_list?cate_state='평창시'">평창시</a></li>
								<li><a href="product_list?cate_state='춘천시'">춘천시</a></li>
								<li><a href="product_list?cate_state='강릉시'">강릉시</a></li>
								<li><a href="product_list?cate_state='횡성시'">횡성시</a></li>
								<li><a href="product_list?cate_state='양양시'">양양시</a></li>
							</ul></li>
						<li data-type="europe"><a href="product_list?cate_city='경상도'"><span>경상도</span></a>
							<ul class="bot">
								<li><a href="product_list?cate_state='부산광역시'">부산광역시</a></li>
								<li><a href="product_list?cate_state='거제시'">거제시</a></li>
								<li><a href="product_list?cate_state='통영시'">통영시</a></li>
								<li><a href="product_list?cate_state='남해시'">남해시</a></li>
								<li><a href="product_list?cate_state='대구광역시'">대구광역시</a></li>
								<li><a href="product_list?cate_state='울산광역시'">울산광역시</a></li>
							</ul></li>
						<li data-type="north-america"><a
							href="product_list?cate_city='전라도'"><span>전라도</span></a>
							<ul class="bot">
								<li><a href="product_list?cate_state='광주광역시'">광주광역시</a></li>
								<li><a href="product_list?cate_state='순천시'">순천시</a></li>
								<li><a href="product_list?cate_state='여수시'">여수시</a></li>
								<li><a href="product_list?cate_state='전주시'">전주시</a></li>
								<li><a href="product_list?cate_state='남원시'">남원시</a></li>
							</ul></li>
						<li data-type="latin-america"><a
							href="product_list?cate_city='충청도'"><span>충청도</span></a>
							<ul class="bot">
								<li><a href="product_list?cate_state='대전광역시'">대전광역시</a></li>
								<li><a href="product_list?cate_state='보령시'">보령시</a></li>
								<li><a href="product_list?cate_state='천안시'">천안시</a></li>
								<li><a href="product_list?cate_state='청주시'">청주시</a></li>
							</ul></li>
						<li data-type="latin-america"><a
							href="product_list?cate_city='제주도'"><span>제주도</span></a>
							<ul class="bot">
								<li><a href="product_list?cate_state='제주시'">제주시</a></li>
								<li><a href="product_list?cate_state='서귀포시'">서귀포시</a></li>
							</ul></li>
					</ul>
				</nav></li>

			<li class="dropdown profile"><a href="#">여행코스</a>
				<nav>
					<ul class="bot">
						<li><a href="product_list?prod_pick=2">맛집</a></li>
						<li><a href="product_list?prod_pick=3">숙박</a></li>
						<li><a href="product_list?prod_pick=1">관광지</a></li>
						<li><a href="package_list">패키지 여행</a></li>
						<li class="sep"><a href="board_list">여행후기</a></li>
					</ul>
				</nav></li>
			<li class="dropdown profile"  style="padding-top: 22px;">
			<span class="initials" style="background: #afd54d">N</span>
				<nav>
					<ul class="bot">
						<li><a href="member_profile">내 정보 보기</a></li>
						<li><a href="member_edit">내 정보 수정</a></li>
						<li><a href="member_wishlist">위시리스트</a></li>
						<li><a href="member_booking">예약 관리</a></li>
						<li class="sep"><a href="member_logout">Logout</a></li>
					</ul>
				</nav></li>
		</ul>
	</div>
</header>