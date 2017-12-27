function bbCalendar(id, date, begin) {
	var bbCalendar = document.getElementById(id);

	if (typeof (date) !== 'undefined') {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	var currentYear = date.getFullYear();
	// 년도를 구함

	var currentMonth = date.getMonth() + 1;
	// 연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력

	var currentDate = date.getDate();
	// 오늘 일자.

	date.setDate(1);
	var currentDay = date.getDay();
	// 이번달 1일의 요일은 출력. 0은 일요일 6은 토요일

	if (begin == 0) {
		begin = currentYear + '-';
		if (currentMonth < 10) {
			begin += '0';
		}
		begin += currentMonth + '-';
		if (currentDate < 10) {
			begin += '0';
		}
		begin += currentDate;
	}

	if (typeof (begin) !== 'undefined') {
		begin = begin.split('-');
		begin[1] = begin[1] - 1;
		begin = new Date(begin[0], begin[1], begin[2]);
	}

	var beginYear = begin.getFullYear();
	// 년도를 구함

	var beginMonth = begin.getMonth() + 1;
	// 연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력

	var beginDate = begin.getDate();
	// 오늘 일자.

	var beginDay = beginYear + '-';
	if (beginMonth < 10) {
		beginDay += '0';
	}
	beginDay += (beginMonth + '-01');
	
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if ((currentYear % 4 === 0 && currentYear % 100 !== 0)
			|| currentYear % 400 === 0)
		lastDate[1] = 29;
	// 각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일
	// 임.

	var currentLastDate = lastDate[currentMonth - 1];
	var week = Math.ceil((currentDay + currentLastDate) / 7);
	// 총 몇 주인지 구함.

	if (currentMonth < 10)
		var currentMonth = '0' + currentMonth;
	// 10월 이하라면 앞에 0을 붙여준다.

	var calendar = '';

	calendar += '<div class="head"><div class="point">1</div><h3>날짜를 선택해주세요.</h3><b class="date date-start">';
	calendar += currentYear + '년 ' + currentMonth + '월 ' + currentDate
			+ '일</b></div>';
	calendar += '<div class="months"><div class="right-arrow" onclick="changeDate(\''
			+ id
			+ '\', \''
			+ nextDate
			+ '\', \''
			+ begin
			+ '\')"></div><div class="left-arrow inactive" onclick="changeDate(\''
			+ id
			+ '\', \''
			+ prevDate
			+ '\', \''
			+ begin
			+ '\')"></div><div class="content"><ul style="width: 1016.6666666666667px; margin-left: 0px;">';

	for (var i = 0; i < 6; i++) {
		var cal_month = beginMonth + i;
		var cal_year = beginYear;
		if (cal_month > 12) {
			cal_month -= 12;
			cal_year++;
		}
		var cal_date = cal_year + '-';
		if (cal_month < 10) {
			cal_date += '0';
		}
		cal_date += (cal_month + '-01');

		if (('0' + cal_month) == currentMonth) {
			calendar += '<li id="month'
					+ cal_month
					+ '" class="selected border" style="width: 101.66666666666667px;"><div><span></span>'
					+ cal_year + '년 ' + cal_month + '월</div></li>'
		} else {
			calendar += '<li id="month'
					+ (beginMonth + i)
					+ '" class="border" style="width: 101.66666666666667px;" onclick="changeDate(\''
					+ id + '\', \'' + cal_date + '\', \'' + beginDay
					+ '\')"><div><span></span>' + cal_year + '년 ' + cal_month
					+ '월</div></li>'
		}
	}
	calendar += '</ul></div></div>';
	calendar += '<div class="dates"><table><tbody>';
	calendar += '<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>'

	var dateNum = 1 - currentDay;

	for (var i = 0; i < week; i++) {
		calendar += '<tr>';
		for (var j = 0; j < 7; j++, dateNum++) {
			if (dateNum < 1 || dateNum > currentLastDate) {
				calendar += '<td class="day' + dateNum + '"> </td>';
				continue;
			}
			if (currentDate == dateNum) {
				calendar += '<td id="day'
						+ dateNum
						+ '" class="all selected possible"><div class="container"><div class="day">'
						+ dateNum + '</div><div class="next"></div></div></td>';
			} else {
				var clickDate = currentYear + '-';
				if (currentMonth < 10) {
					clickDate += '0';
				}
				clickDate += currentMonth + '-';
				if (dateNum < 10) {
					clickDate += '0';
				}
				clickDate += dateNum;

				calendar += '<td id="day' + dateNum
						+ '" class="all possible" onclick="changeDate(\'' + id
						+ '\', \'' + clickDate + '\', \'' + beginDay
						+ '\')"><div class="container"><div class="day">'
						+ dateNum + '</div><div class="next"></div></div></td>';
			}
		}
		calendar += '</tr>';
	}

	calendar += '</tbody></table></div>'

	bbCalendar.innerHTML = calendar;
}

function changeDate(id, date, begin) {
	bbCalendar(id, date, begin);
}
