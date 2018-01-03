// 달력 (달력 들어갈 위치, 선택된 날짜, 선택된 월, 시작일, 종료일, 기간)
function bbCalendar(id, date, select, begin, end, days) {
	var bbCalendar = document.getElementById(id);
	var current = date;

	if (typeof (date) !== 'undefined') {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	var currentYear = date.getFullYear();

	var currentMonth = date.getMonth() + 1;

	var currentDate = date.getDate();

	date.setDate(1);
	var currentDay = date.getDay();

	if (typeof (select) !== 'undefined') {
		select = select.split('-');
		select[1] = select[1] - 1;
		select = new Date(select[0], select[1], select[2]);
	}

	var selectYear = select.getFullYear();
	var selectMonth = select.getMonth() + 1;
	var selectDate = select.getDate();

	var selectDay = selectYear + '-';
	if (selectMonth < 10) {
		selectDay += '0';
	}
	selectDay += (selectMonth + '-01');

	if (typeof (begin) !== 'undefined') {
		begin = begin.split('-');
		begin[1] = begin[1] - 1;
		begin = new Date(begin[0], begin[1], begin[2]);
	}

	var beginYear = begin.getFullYear();
	var beginMonth = begin.getMonth() + 1;
	var beginDate = begin.getDate();

	var beginDay = beginYear + '-';
	if (beginMonth < 10) {
		beginDay += '0';
	}
	beginDay += (beginMonth + '-01');

	if (typeof (end) !== 'undefined') {
		end = end.split('-');
		end[1] = end[1] - 1;
		end = new Date(end[0], end[1], end[2]);
	}

	var endYear = end.getFullYear();
	var endMonth = end.getMonth() + 1;
	var endDate = end.getDate();

	var endDay = endYear + '-';
	if (endMonth < 10) {
		endDay += '0';
	}
	endDay += (endMonth + '-01');

	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if ((currentYear % 4 === 0 && currentYear % 100 !== 0)
			|| currentYear % 400 === 0)
		lastDate[1] = 29;
	// 각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일임.

	var currentLastDate = lastDate[currentMonth - 1];
	var week = Math.ceil((currentDay + currentLastDate) / 7);
	// 총 몇 주인지 구함.

	if (selectMonth != 1) {
		var prevDate = selectYear + '-';
		if (selectMonth < 11) {
			prevDate += '0';
		}
		prevDate += (selectMonth - 1);
		prevDate += '-01';
	} else
		var prevDate = (selectYear - 1) + '-12-01';

	if (selectMonth != 12) {
		var nextDate = selectYear + '-';
		if (selectMonth < 9) {
			nextDate += '0';
		}
		nextDate += (selectMonth + 1);
		nextDate += '-01';
	} else {
		var nextDate = (selectYear + 1) + '-01-01';
	}

	if (currentMonth < 10)
		var currentMonth = '0' + currentMonth;

	var calendar = '';

	calendar += '<div class="head"><div class="point">1</div><h3>날짜를 선택해주세요.</h3><b class="date date-start">';
	calendar += currentYear + '년 ' + currentMonth + '월 ' + currentDate
			+ '일</b></div>';
	calendar += '<div class="months"><div class="right-arrow" id="right-arrow" onclick="bbCalendar(\''
			+ id
			+ '\', \''
			+ current
			+ '\', \''
			+ nextDate
			+ '\', \''
			+ beginDay + '\', \'' + endDay + '\', \'' + days + '\')"></div>';

	var by = beginYear;
	var bm = beginMonth * 1 + 5;
	if (bm > 12) {
		bm -= 12;
		by++;
	}
	if ((selectYear < by && selectMonth <= bm * 1 + 12)
			|| (selectYear == by && selectMonth <= bm)) {
		calendar += '<div class="left-arrow inactive" id="left-arrow"></div>';
	} else {
		calendar += '<div class="left-arrow" id="left-arrow" onclick="bbCalendar(\''
				+ id
				+ '\', \''
				+ current
				+ '\', \''
				+ prevDate
				+ '\',\''
				+ beginDay
				+ '\', \''
				+ endDay
				+ '\', \''
				+ days
				+ '\')"></div>';
	}
	calendar += '<div class="content"><ul style="width: 1016.6666666666667px; margin-left: 0px;">';
	for (var i = 0; i < 6; i++) {
		var cal_month = selectMonth + i;
		var cal_year = selectYear;
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
					+ (selectMonth + i)
					+ '" class="border" style="width: 101.66666666666667px;" onclick="bbCalendar(\''
					+ id + '\', \'' + cal_date + '\', \'' + selectDay
					+ '\', \'' + beginDay + '\',\'' + endDay + '\', \'' + days
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
				if (dateNum == currentLastDate) {
					calendar += '<td id="day'
							+ dateNum
							+ '" class="all possible selected next"><div class="container"><div class="day">'
							+ dateNum
							+ '</div><div class="next"></div></div></td>';
				} else {
					calendar += '<td id="day'
							+ dateNum
							+ '" class="all possible selected"><div class="container"><div class="day">'
							+ dateNum
							+ '</div><div class="next"></div></div></td>';
				}
			} else if (currentDate < dateNum
					&& dateNum < (currentDate * 1 + days * 1)) {
				var clickDate = currentYear + '-';
				if (currentMonth < 10) {
					clickDate += '0';
				}
				clickDate += currentMonth + '-';
				if (dateNum < 10) {
					clickDate += '0';
				}
				clickDate += dateNum;

				if (currentLastDate == dateNum
						&& (dateNum * 1 + days * 1) > currentLastDate) {
					calendar += '<td id="day'
							+ dateNum
							+ '" class="all empty onway next" onclick="bbCalendar(\''
							+ id + '\', \'' + clickDate + '\', \'' + selectDay
							+ '\',\'' + beginDay + '\',\'' + endDay + '\', \''
							+ days
							+ '\')"><div class="container"><div class="day">'
							+ dateNum
							+ '</div><div class="next"></div></div></td>';
				} else {
					calendar += '<td id="day'
							+ dateNum
							+ '" class="all empty onway" onclick="bbCalendar(\''
							+ id + '\', \'' + clickDate + '\', \'' + selectDay
							+ '\', \'' + beginDay + '\',\'' + endDay + '\',\''
							+ days
							+ '\')"><div class="container"><div class="day">'
							+ dateNum
							+ '</div><div class="next"></div></div></td>';
				}
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
						+ '" class="all possible" onclick="bbCalendar(\'' + id
						+ '\', \'' + clickDate + '\', \'' + selectDay + '\',\''
						+ beginDay + '\',\'' + endDay + '\', \'' + days
						+ '\')"><div class="container"><div class="day">'
						+ dateNum + '</div><div class="next"></div></div></td>';
			}
		}
		calendar += '</tr>';
	}
	calendar += '</tbody></table></div>'
	bbCalendar.innerHTML = calendar;
}
