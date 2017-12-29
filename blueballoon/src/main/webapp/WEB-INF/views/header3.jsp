<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<ul style="margin-left: 277px;">
			<li class="dropdown fill" data-type="destinations"><a href="#">여행지</a>
				<nav class="">
					<c:set var="state" value="서울특별시,경기도,강원도,경상도,전라도,충청도,제주도" />
					<ul class="top">
						<c:forTokens items="${state}" delims="," var="c"
							varStatus="status">
							<li><a href="product_list?cate_state='${c}'"><span>${c}</span></a>
								<ul class="bot">
									<c:forEach items="${listCate}" var="list">
										<c:if test="${list.cate_state == c}">
											<li><a
												href="product_list?cate_city='${list.cate_city }'">${list.cate_city }</a></li>
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
			<li class="dropdown profile" style="padding-top: 22px;"><span
				class="initials" style="background: #afd54d">${member_name}</span>
				<nav>
					<ul class="bot">
						<li><a href="member_profile">내 정보 보기</a></li>
						<li><a href="member_edit">내 정보 수정</a></li>
						<li><a href="member_likelist">좋아요 목록</a></li>
						<li><a href="member_booking">예약 관리</a></li>
						<li class="sep"><a href="member_logout">로그아웃</a></li>
					</ul>
				</nav></li>
		</ul>
	</div>
</header>