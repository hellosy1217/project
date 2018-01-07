<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html class=" logged">
<head>
<title>BlueBalloon - booking: ${getPack.pack_title}</title>
<link
	href="${pageContext.request.contextPath}/resources/user/package/css/booking1.css?ver=12"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/user/package/js/booking1.js?ver=12"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/plugins/ua/ec.js"></script>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/js/zepto.v1514557673.min.js"></script>
<script async=""
	src="//cdn.tourradar.com/include/js/zepto-fx.v1514557673.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/book_now/async.v1514557673.css">
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
				<a href="#" class="tel">+82 02 311 3006</a><a href="#" class="help"
					onclick="popitup()">문의하기</a>
			</div>
		</div>
	</header>
	<main data-parameters="">
	<div class="c">
		<div class="fline">
			<h1>${getPack.pack_title}</h1>
		</div>
		<div class="book">
			<div class="left">
				<div class="saleLine"></div>
				<div class="block departure" id="bb_calendar">
					<script type="text/javascript">
					window.onload = function () {
						bbCalendar('${beginDate}','${endDate}','${beginDate}','${beginDate}','${selectedDate}','${getPack.pack_days}','${date}','${person}');
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
						<div class="in quantity" id="book_person_num"></div>
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
													name="member_name" placeholder="Enter FullName" value="${getMember.member_name }" id="t2-1">
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
													name="member_email" placeholder="Enter email address" value="${getMember.member_email }"
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
												<input class="tel" type="tel" name="member_phone"
													placeholder="e.g. 010-1234-5678" value="${getMember.member_phone }" id="t6-1"
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
					<div class="text">저희가 도와드리겠습니다.</div>
					<div class="t">
						<c:forTokens items="김수민,김유정,성지연,주소연,지수정" delims=","
							varStatus="stt">
							<div class="wp">
								<img
									src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/img/${stt.count}.png"><span>이름</span>
							</div>
						</c:forTokens>
					</div>
					<div class="title">Call us +82 02 311 3006</div>
				</div>
			</div>
			<div class="right">
				<div class="block">
					<div class="title-route">영수증</div>
					<ul class="route exp">
						<li>${getPack.pack_title }<span>${getPack.pack_days}
								days</span></li>
						<li>패키지 기간<span class="date-start" id="book_period">시작일~종료일</span></li>
					</ul>
					<div class="price-main">
						<div class="info">
							<ul class="prices">
								<li>패키지 가격
									<div class="pr">
										<fmt:formatNumber value="${getPack.pack_price}"
											pattern="#,###.##" />
										원
									</div>
								</li>
								<li>인원
									<div class="pr" id="book_pers" name="book_person">1명</div>
								</li>
								<li class="pt"><b><div class="pr" id="sum_price">얼마</div></b></li>
							</ul>
						</div>
						<ul class="prices promo">
							<li class="discount exp"><b class="blue txt">BlueBalloon
									Savings</b><b class="green"><span> 회원 할인가 </span>
									<div class="pr">
										<fmt:formatNumber value="${getPack.pack_price*0.05}"
											pattern="#,###.##" />
										원
									</div></b></li>
						</ul>
					</div>
				</div>
				<div class="price-resume">
					<div class="block blue">
						<div class="text">
							<b>총액 </b>
						</div>
						<div class="pr px20" id="total_price">
							KRW<b>￦얼마</b>
						</div>
					</div>
				</div>
				<div class="block terms">
					<h4>이용 약관</h4>
					<div class="text">
						제 1 조 (목적)<br>이 약관은 Blueballoon(이하 "사이트"라 합니다)에서 제공하는
						인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.<br>제
						2 조 (약관의 효력 및 변경)<br>이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써
						효력을 발생합니다.<br>사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로
						공지 또는 통지함으로써 효력을 발생합니다.<br>제 3 조 (이용계약의 성립)<br> ① 이용약관
						하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.<br> ② 이용계약은 서비스 이용희망자의
						이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다. <br> 제 4 조 (이용신청)<br>
						신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야
						합니다.<br> 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나
						실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.  <a>더보기</a>
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