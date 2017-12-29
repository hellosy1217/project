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
	function changeMonth(year, month,day){
		location.href="product_booking?prod_num="+${prod_num}+"&selectedYear="+year+"&selectedMonth="+month+"&selectedDay="+day;
	}
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
</head>
<body class="tb" data-r="1" data-b-sale="">
	<header>
		<div class="c">
			<a href="/"><img
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
						bbCalendar('bb_calendar','${selectedDate}',0);
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
									onclick="changeBookPerson('remove',${min_person},${max_person})"></span>
								<input type="number" name="book_person" value="${min_person}"
									min="${min_person}" max="${max_person}" inputmode="numeric"
									pattern="[0-9]*" readonly> <span class="number plus"
									id="plus"
									onclick="changeBookPerson('add',${min_person},${max_person})"></span>
							</form>
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
							<c:forEach items="${listRoom}" var="room">
								<div class="radio" data-lack="1">
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
												<div>${room.room_name}</div></b> 방 설명
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
									src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/img/e.png"
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