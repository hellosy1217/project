<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/async.v1512456645.css?ver=12"
	rel="stylesheet" type="text/css" />
<script
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/js/1.js"
	async=""></script>
<script type="text/javascript">
	function popitup() {
		var popupX = (window.screen.width / 2) - (500 / 2);
		var popupY= (window.screen.height /2) - (420 / 2);

		new_window = window.open('member_contact_us', 'contact_us', 'resizable=no,status=no, height=420, width=500, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
		if (window.focus) {
			new_window.focus()
		}
		return false;
	}
</script>
<div class="ups">
	<div class="c">
		<span class="hide-sm pull-left"><a
			href="package_booking?pack_num=22">일단은 예약</a></span><span class="hide-sm"><a
			href="admin_index">일단은 admin</a></span><span class="pull-right"><a
			href="#" onclick="popitup()">contact us</a></span>
	</div>
</div>
<header>
	<div class="c">
		<div class="logo" style="margin-right: 0px;">
			<a href="main"> <img
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
		<ul style="margin-left: 336px;">
			<li class="dropdown fill" data-type="destinations"><a href="#">여행지</a>
				<nav style="height: auto;">
					<c:set var="state" value="서울특별시,경기도,강원도,경상도,전라도,충청도,제주도" />
					<ul class="top">
						<c:forTokens items="${state}" delims="," var="c"
							varStatus="status">
							<li><a href="product_list?cate_state=${c}"><span>${c}</span></a>
								<ul class="bot">
									<c:forEach items="${listCate}" var="list">
										<c:if test="${list.cate_state == c}">
											<li><a
												href="product_list?cate_state=${c}&cate_city=${list.cate_city }">${list.cate_city }</a></li>
										</c:if>
									</c:forEach>
								</ul></li>
						</c:forTokens>
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
			<li class="dropdown profile" style="padding-top: 22px;"><svg
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                  <path fill="rgb(204,204,204)"
						d="M9.74 0A10 10 0 1 0 20 9.74 10 10 0 0 0 9.74 0zm.5 19A9 9 0 1 1 19 9.76 9 9 0 0 1 10.24 19z"></path>
                  <path fill="rgb(204,204,204)"
						d="M10.21 11.5H10a6.5 6.5 0 0 0-5.5 3.4.5.5 0 1 0 .88.48 5.5 5.5 0 0 1 4.69-2.87h.15a5.5 5.5 0 0 1 4.69 2.62.5.5 0 0 0 .85-.52 6.5 6.5 0 0 0-5.55-3.11zm-.29-1H10A3.5 3.5 0 0 0 13.42 7v-.09a3.5 3.5 0 0 0-3.5-3.41h-.09A3.5 3.5 0 0 0 6.42 7v.09a3.5 3.5 0 0 0 3.5 3.41zm-.06-6h.07a2.5 2.5 0 0 1 2.5 2.43V7A2.5 2.5 0 0 1 10 9.5h-.08a2.5 2.5 0 0 1-2.5-2.43V7a2.5 2.5 0 0 1 2.43-2.5z"></path>
               </svg>
				<nav>
					<ul class="bot">
						<li><a href="member_login">로그인</a></li>
						<li><a href="member_join">회원가입</a></li>
						<li><a href="book_">예약관리</a></li>
					</ul>
				</nav></li>
		</ul>
	</div>
</header>