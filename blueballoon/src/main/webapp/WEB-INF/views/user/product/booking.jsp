<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class=" logged">
<head>
<title>booking - 상품/패키지 명 - BlueBalloon</title>
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/booking1.css?ver=12"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/user/product/js/booking1.js?ver=12"></script>
<script type="text/javascript">
	function changeBookPerson(mode, min_date, max_date) {
		if (f.book_person.value >= min_date && f.book_person.value <= max_date) {
			if (mode == 'add') {
				if (f.book_person.value != max_date)
					f.book_person.value++;
			} else {
				if (f.book_person.value != min_date)
					f.book_person.value--;
			}
			if (f.book_person.value == max_date) {
				document.getElementById("plus").className = "number plus grey";
			} else {
				document.getElementById("plus").className = "number plus";
			}
			if (f.book_person.value == min_date) {
				document.getElementById("minus").className = "number minus grey";
			} else {
				document.getElementById("minus").className = "number minus";
			}
		}
	}
</script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/plugins/ua/ec.js"></script>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/js/zepto.v1514557673.min.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/js/zepto-fx.v1514557673.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/book_now/async.v1514557673.css">
</head>

<body class="tb" data-r="1" data-b-sale="">
	<header>
		<div class="c">
			<a href="main"><img
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
	<main data-parameters="">
	<div class="c">
		<div class="fline">
			<h1>${getProd.prod_name}</h1>
		</div>
		<div class="book">
			<div class="left">
				<div class="saleLine"></div>
				<div class="block departure" id="bb_calendar">
					<script type="text/javascript">
					window.onload = function () {
						bbCalendar('bb_calendar','${beginDate}',0,5);
					};</script>
					<div id="seats">
						<div class="content">
							<div class="i icon currency usd">예약 취소시 ~~~~ 청구됩니다.</div>
						</div>
						<div class="info">
							<div class="col">
								<div class="best-price text">최고의 가격</div>
							</div>
							<div class="col">
								<div class="earn text">뭐 넣을 지 생각 중</div>
							</div>
							<div class="col">
								<div class="no-fees text">뭐 넣을 지 생각 중</div>
							</div>
						</div>
					</div>
				</div>
				<div class="block details">
					<div class="head">
						<div class="point">2</div>
						<h3>예약 정보를 입력해주세요.</h3>
					</div>
					<div class="info unselectable " unselectable="on">
						<b class="in">인원</b>
						<div class="in quantity">
							<form name="f">
								<span class="number minus grey" id="minus"
									onclick="changeBookPerson('remove',${min_person},${max_person})"
									style="margin-top: 2px;"></span> <input type="number"
									name="book_person" value="${min_person}" min="${min_person}"
									max="${max_person}" inputmode="numeric" pattern="[0-9]*"
									readonly> <span class="number plus" id="plus"
									onclick="changeBookPerson('add',${min_person},${max_person})"
									style="margin-top: 2px;"></span>
							</form>
						</div>
						<div class="in solo"></div>
					</div>
					<form>
						<div class="traveller" data-traveller-number="1">
							<div class="fields">
								<div class="row travin">
									<div class="cell title">
										<b>예약자 정보</b>
									</div>
								</div>
								<section>
									<div>
										<div class="row" data-id="2"
											data-error-empty="Please enter a name"
											data-error-wrong="Please enter a name" data-required="1">
											<label class="cell title unselectable" for="t2-1"> 이름
											</label>
											<div class="cell validity-con" data-type="string">
												<input type="text" autocomplete="section-1 given-name"
													name="field2[]" placeholder="Enter FullName" value=""
													id="t2-1">
											</div>
										</div>
										<div class="row" data-seo="email" data-id="5"
											data-error-empty="Please enter a valid email address"
											data-error-wrong="Please enter a valid email address"
											data-required="1">
											<label class="cell title unselectable" for="t5-1">
												Email </label>
											<div class="cell validity-con" data-type="email">
												<input type="email" autocomplete="section-1 email"
													name="field5[]" placeholder="Enter email address" value=""
													id="t5-1">
											</div>
										</div>
										<div class="row" data-seo="phone-number" data-id="6"
											data-error-empty="Please enter your full number"
											data-error-wrong="Please enter your full number"
											data-required="1">
											<label class="cell title unselectable" for="t6-1">
												휴대전화 </label>
											<div class="cell validity-con" data-type="phone">
												<input class="tel" type="tel" name="field6-tel"
													placeholder="e.g. 010-1234-5678" value="" id="t6-1"
													autocomplete="section-1 tel">
											</div>
										</div>
										<div class="row" data-seo="date-of-birth" data-id="7"
											data-error-empty="Please enter date of birth"
											data-error-wrong="Please enter date of birth"
											data-required="1">
											<label class="cell title unselectable" for="t7-1">
												생년월일 </label>
											<div class="cell validity-con input-grp" data-type="date"
												data-direction="past">
												<select name="field7-year" class="third"><option
														selected="" disabled="" value="">Year</option>
													<c:forEach var="y" begin="1918" end="2018" step="1">
														<option value="${y }">${y }년</option>
													</c:forEach>
												</select><select name="field7-month" class="third"><option
														selected="" disabled="" value="">Month</option>
													<c:forEach var="m" begin="1" end="12" step="1">
														<option value="${m }">${m }월</option>
													</c:forEach>
												</select><select name="field7-day" class="third" id="t7-1"><option
														selected="" disabled="" value="">Day</option>
													<c:forEach var="d" begin="1" end="31" step="1">
														<option value="${d }">${d }일</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
								</section>
							</div>
						</div>
					</form>
				</div>
				<div class="block accommodation ">
					<div class="head">
						<div class="point">3</div>
						<h3>방을 선택해주세요.</h3>
					</div>
					<div class="room-content"></div>
					<div class="content" data-friends="1">
						<div class="types">
							<c:forEach items="${listRoom}" var="room">
								<div class="radio" data-lack="1" >
									<input type="radio" name="accommodation" value="Twin"
										id="accommodation-0">
									<div class="check"></div>
									<div class="label" for="accommodation-0">
										<div class="descr">
											<b><div class="beds ">
													<c:forTokens var="person" varStatus="pstatus"
														items="${room.room_person}" delims=",">
														<c:if test="${pstatus.count==2}">
															<span>✕</span>${person}
													</c:if>
													</c:forTokens>
												</div>
												<div>${room.room_name}</div></b> ${room.room_content }
										</div>
										<div class="pr">
											<b>+추가금액</b>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<c:if test="${member_num eq 0}">
					<div class="block price-main ">
						<div class="head">
							<h3>BlueBalloon Savings</h3>
						</div>
						<ul class="prices promo des" data-value="memberSaving">
							<li class="discount exp">지금 회원가입하시면 <b class="green">-가격</b>
								만큼 회원 할인을 받으실 수 있습니다.
							</li>
							<li class="link"><a href="member_join">가입하기</a></li>
						</ul>
					</div>
				</c:if>
				<div class="block agents">
					<div class="head">
						<h3>도움이 필요하세요?</h3>
					</div>
					<div class="title tit">BlueBalloon 고객 센터</div>
					<div class="text">고객상담에 대한 설명 들어갈 곳, 아래는 이미지 들어갈 부분</div>
					<div class="t">
						<c:forEach var="a" begin="1" end="5" step="1">
							<div class="wp">
								<img
									src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/img/e.png"><span>이름</span>
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
									<div class="pr">${book_person}</div>
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
							<b>총액 </b>
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
					<div class="text grey">충청북도 음성군 맹동면 용두로 54 충북혁신도시 한국소비자원</div>
					<div class="text">BlueBalloon</div>
					<div class="text grey">서울특별시 종로구 돈화문로 26 4층 KG아이티뱅크</div>
				</div>
			</div>
		</div>
	</div>
	</main>
</body>
</html>