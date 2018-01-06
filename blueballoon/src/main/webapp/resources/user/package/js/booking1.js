/*
 * begin	: 시작일 (YYYY-MM-DD)
 * end	: 종료일 (YYYY-MM-DD)
 * start	: 선택된 달 시작 점 (YYYY-MM-DD)
 * current	: 선택된 달 (YYYY-MM-DD)
 * selected	: 선택된 날 (YYYY-MM-DD)
 * pack_days	: 기간 (n)
 * pack_start_date	: 선택 가능 일
 */
function bbCalendar(begin, end, start, current, selected, pack_days,
		pack_start_date) {
	var bbCalendar = document.getElementById('bb_calendar');

	// 선택 가능 일
	var dateCount = 0;
	var pack_start_split = '';
	if (typeof (pack_start_date) !== 'undefined') {
		pack_start_split = pack_start_date.split(',');
		for ( var i in pack_start_split) {
			dateCount++;
		}
	}

	// 시작일 구하기
	var begin_date = begin;
	if (typeof (begin) !== 'undefined') {
		begin = begin.split('-');
		begin[1] = begin[1] - 1;
		begin = new Date(begin[0], begin[1], begin[2]);
	}
	var beginYear = begin.getFullYear();
	var beginMonth = begin.getMonth() + 1;
	var beginDate = begin.getDate();
	begin.setDate(1);
	var beginDay = begin.getDay();

	// 종료일 구하기
	var end_date = end;
	if (typeof (end) !== 'undefined') {
		end = end.split('-');
		end[1] = end[1] - 1;
		end = new Date(end[0], end[1], end[2]);
	}
	var endYear = end.getFullYear();
	var endMonth = end.getMonth() + 1;
	var endDate = end.getDate();
	end.setDate(1);
	var endDay = end.getDay();

	// 선택된 달 시작점 구하기
	var start_date = start;
	if (typeof (start) !== 'undefined') {
		start = start.split('-');
		start[1] = start[1] - 1;
		start = new Date(start[0], start[1], start[2]);
	}
	var startYear = start.getFullYear();
	var startMonth = start.getMonth() + 1;
	var startDate = start.getDate();
	start.setDate(1);
	var startDay = start.getDay();

	// 이전 달 구하기
	if (startMonth != 1) {
		var prevDate = startYear + '-';
		if (startMonth < 11) {
			prevDate += '0';
		}
		prevDate += (startMonth * 1 - 1);
		prevDate += '-01';
	} else {
		var prevDate = (startYear * 1 - 1) + '-12-01';
	}

	// 다음 달 구하기
	if (startMonth != 12) {
		var nextDate = startYear + '-';
		if (startMonth < 9) {
			nextDate += '0';
		}
		nextDate += (startMonth + 1);
		nextDate += '-01';
	} else {
		var nextDate = (startYear + 1) + '-01-01';
	}

	// 선택된 달 구하기
	var current_date = current;
	if (typeof (current) !== 'undefined') {
		current = current.split('-');
		current[1] = current[1] - 1;
		current = new Date(current[0], current[1], current[2]);
	}
	var currentYear = current.getFullYear();
	var currentMonth = current.getMonth() + 1;
	var currentDate = current.getDate();
	current.setDate(1);
	var currentDay = current.getDay();

	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if ((currentYear % 4 === 0 && currentYear % 100 !== 0)
			|| currentYear % 400 === 0)
		lastDate[1] = 29;

	var currentLastDate = lastDate[currentMonth - 1];
	var week = Math.ceil((currentDay + currentLastDate) / 7);

	// 선택된 날짜 구하기
	var selected_date = selected;
	if (typeof (selected) !== 'undefined') {
		selected = selected.split('-');
		selected[1] = selected[1] - 1;
		selected = new Date(selected[0], selected[1], selected[2]);
	}
	var selectedYear = selected.getFullYear();
	var selectedMonth = selected.getMonth() + 1;
	var selectedDate = selected.getDate();
	selected.setDate(1);
	var selectedDay = selected.getDay();

	// if (currentMonth < 10)
	// var currentMonth = '0' + currentMonth;

	var calendar = '';

	// 현재 선택된 날짜
	calendar += '<div class="head"><div class="point">1</div><h3>날짜를 선택해주세요.</h3><b class="date date-start">';
	calendar += selectedYear + '년 ' + selectedMonth + '월 ' + selectedDate
			+ '일</b></div>';
	calendar += '<div class="months">';

	// 오른쪽 화살표
	var st_y = startYear;
	var st_m = startMonth * 1 + 5;
	if (st_m > 12) {
		st_m -= 12;
		st_y++;
	}
	if (st_y * 1 == endYear * 1 && st_m * 1 == endMonth * 1) {
		calendar += '<div class="right-arrow inactive" id="right-arrow"></div>';
	} else {
		calendar += '<div class="right-arrow" id="right-arrow" onclick="bbCalendar(\''
				+ begin_date
				+ '\', \''
				+ end_date
				+ '\', \''
				+ nextDate
				+ '\', \''
				+ current_date
				+ '\',  \''
				+ selected_date
				+ '\',\''
				+ pack_days + '\',\'' + pack_start_date + '\')"></div>';
	}

	// 왼쪽 화살표
	if (startYear * 1 == beginYear * 1 && startMonth * 1 == beginMonth * 1) {
		calendar += '<div class="left-arrow inactive" id="left-arrow"></div>';
	} else {
		calendar += '<div class="left-arrow" id="left-arrow" onclick="bbCalendar(\''
				+ begin_date
				+ '\', \''
				+ end_date
				+ '\', \''
				+ prevDate
				+ '\', \''
				+ current_date
				+ '\',  \''
				+ selected_date
				+ '\',\''
				+ pack_days + '\',\'' + pack_start_date + '\')"></div>';
	}

	// 달 버튼
	calendar += '<div class="content"><ul style="width: 1016.6666666666667px; margin-left: 0px;">';
	for (var i = 0; i < 6; i++) {
		var cal_month = startMonth * 1 + i;
		var cal_year = startYear;
		if (cal_month > 12) {
			cal_month -= 12;
			cal_year++;
		}
		var cal_date = cal_year + '-';
		if (cal_month < 10) {
			cal_date += '0';
		}
		cal_date += (cal_month + '-01');

		if ((cal_year == endYear && cal_month > endMonth)
				|| (cal_year > endYear)) {
		} else {
			if (cal_month * 1 == currentMonth * 1) {
				calendar += '<li id="month'
						+ cal_month
						+ '" class="selected border" style="width: 101.66666666666667px;"><div><span></span>'
						+ cal_year + '년 ' + cal_month + '월</div></li>'
			} else {
				if (selectedYear * 1 == cal_year * 1
						&& selectedMonth * 1 == cal_month * 1) {
					calendar += '<li id="month'
							+ cal_month
							+ '" class="border with-date" style="width: 101.66666666666667px;" onclick="bbCalendar(\''
							+ begin_date + '\', \'' + end_date + '\', \''
							+ start_date + '\', \'' + cal_date + '\',  \''
							+ selected_date + '\',\'' + pack_days + '\',\''
							+ pack_start_date + '\')"><div><span></span>'
							+ cal_year + '년 ' + cal_month + '월</div></li>';
				} else {
					calendar += '<li id="month'
							+ cal_month
							+ '" class="border" style="width: 101.66666666666667px;" onclick="bbCalendar(\''
							+ begin_date + '\', \'' + end_date + '\', \''
							+ start_date + '\', \'' + cal_date + '\',  \''
							+ selected_date + '\',\'' + pack_days + '\',\''
							+ pack_start_date + '\')"><div><span></span>'
							+ cal_year + '년 ' + cal_month + '월</div></li>';
				}
			}
		}
	}
	calendar += '</ul></div></div>';
	calendar += '<div class="dates"><table><tbody>';
	calendar += '<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>';

	var dateNum = 1 - currentDay;

	for (var i = 0; i < week; i++) {
		calendar += '<tr>';
		for (var j = 0; j < 7; j++, dateNum++) {
			if (dateNum < 1 || dateNum > currentLastDate) {
				calendar += '<td class="day' + dateNum + '"> </td>';
				continue;
			}

			if (currentYear == selectedYear && currentMonth == selectedMonth) {
				if (selectedDate == dateNum) {
					if (dateNum == currentLastDate) {
						calendar += '<td id="day'
								+ dateNum
								+ '" class="all possible selected next" ><div class="container"><div class="day">'
								+ dateNum
								+ '</div><div class="next"></div></div></td>';
					} else {
						calendar += '<td id="day'
								+ dateNum
								+ '" class="all possible selected"><div class="container"><div class="day">'
								+ dateNum
								+ '</div><div class="next"></div></div></td>';
					}
				} else if (dateNum > selectedDate
						&& dateNum < (selectedDate * 1 + pack_days * 1)) {
					var count = 0;
					for (var k = 0; k < dateCount; k++) {
						var possible_date = pack_start_split[k];
						if (typeof (pack_start_split[k]) !== 'undefined') {
							possible = pack_start_split[k].split('-');
							possible[1] = possible[1] - 1;
							possible = new Date(possible[0], possible[1],
									possible[2]);
						}
						var possibleYear = possible.getFullYear();
						var possibleMonth = possible.getMonth() + 1;
						var possibleDate = possible.getDate();
						possible.setDate(1);
						var possibleDay = possible.getDay();

						if (possibleYear * 1 == currentYear * 1
								&& possibleMonth * 1 == currentMonth * 1
								&& dateNum * 1 == possibleDate * 1) {
							calendar += '<td id="day'
									+ dateNum
									+ '" class="all selected onway" onclick="bbCalendar(\''
									+ begin_date
									+ '\', \''
									+ end_date
									+ '\', \''
									+ start_date
									+ '\', \''
									+ current_date
									+ '\',  \''
									+ pack_start_split[k]
									+ '\',\''
									+ pack_days
									+ '\',\''
									+ pack_start_date
									+ '\')"><div class="container"><div class="day">'
									+ dateNum
									+ '</div><div class="next"></div></div></td>';
							count++;
						} else if (possibleYear * 1 == currentYear * 1
								&& possibleMonth * 1 == currentMonth * 1
								&& dateNum * 1 != possibleDate * 1
								&& k * 1 == dateCount * 1 - 1 && count == 0) {
							calendar += '<td id="day'
									+ dateNum
									+ '" class="all empty onway"><div class="container"><div class="day">'
									+ dateNum
									+ '</div><div class="next"></div></div></td>';
						}
					}
				} else {
					var count = 0;
					for (var k = 0; k < dateCount; k++) {
						var possible_date = pack_start_split[k];
						if (typeof (pack_start_split[k]) !== 'undefined') {
							possible = pack_start_split[k].split('-');
							possible[1] = possible[1] - 1;
							possible = new Date(possible[0], possible[1],
									possible[2]);
						}
						var possibleYear = possible.getFullYear();
						var possibleMonth = possible.getMonth() + 1;
						var possibleDate = possible.getDate();
						possible.setDate(1);
						var possibleDay = possible.getDay();

						if (possibleYear * 1 == currentYear * 1
								&& possibleMonth * 1 == currentMonth * 1
								&& dateNum * 1 == possibleDate * 1) {
							calendar += '<td id="day'
									+ dateNum
									+ '" class="all selected" onmouseover="this.style.backgroundColor=\'#409cd1\'"  onmouseout="this.style.backgroundColor=\'white\'" onclick="bbCalendar(\''
									+ begin_date
									+ '\', \''
									+ end_date
									+ '\', \''
									+ start_date
									+ '\', \''
									+ current_date
									+ '\',  \''
									+ pack_start_split[k]
									+ '\',\''
									+ pack_days
									+ '\',\''
									+ pack_start_date
									+ '\')" style="cusor:pointer;"><div class="container"><div class="day">'
									+ dateNum
									+ '</div><div class="next"></div></div></td>';
							count++;
						} else if (possibleYear * 1 == currentYear * 1
								&& possibleMonth * 1 == currentMonth * 1
								&& dateNum * 1 != possibleDate * 1
								&& k * 1 == dateCount * 1 - 1 && count == 0) {
							calendar += '<td id="day'
									+ dateNum
									+ '" class="all empty"><div class="container"><div class="day">'
									+ dateNum
									+ '</div><div class="next"></div></div></td>';
						}
					}
				}
			} else {
				var count = 0;
				for (var k = 0; k < dateCount; k++) {
					var possible_date = pack_start_split[k];
					if (typeof (pack_start_split[k]) !== 'undefined') {
						possible = pack_start_split[k].split('-');
						possible[1] = possible[1] - 1;
						possible = new Date(possible[0], possible[1],
								possible[2]);
					}
					var possibleYear = possible.getFullYear();
					var possibleMonth = possible.getMonth() + 1;
					var possibleDate = possible.getDate();
					possible.setDate(1);
					var possibleDay = possible.getDay();

					if (possibleYear * 1 == currentYear * 1
							&& possibleMonth * 1 == currentMonth * 1
							&& dateNum * 1 == possibleDate * 1) {
						calendar += '<td id="day'
								+ dateNum
								+ '" class="all selected" onmouseover="this.style.backgroundColor=\'#409cd1\'" onmouseout="this.style.backgroundColor=\'white\'" onclick="bbCalendar(\''
								+ begin_date
								+ '\', \''
								+ end_date
								+ '\', \''
								+ start_date
								+ '\', \''
								+ current_date
								+ '\',  \''
								+ pack_start_split[k]
								+ '\',\''
								+ pack_days
								+ '\',\''
								+ pack_start_date
								+ '\')"  style="cusor:pointer;"><div class="container"><div class="day">'
								+ dateNum
								+ '</div><div class="next"></div></div></td>';

					} else {
						calendar += '<td id="day'
								+ dateNum
								+ '" class="all empty"><div class="container"><div class="day">'
								+ dateNum
								+ '</div><div class="next"></div></div></td>';
						break;
					}
				}
			}
		}
		calendar += '</tr>';
	}

	calendar += '</tbody></table></div>'
	bbCalendar.innerHTML = calendar;

	var s = selected_date.split('-');
	var period = s[0] * 1 + '년 ' + s[1] * 1 + '월 ' + s[2] * 1 + '일 ~ ';
	s[2] = s[2] * 1 + pack_days * 1 - 1;
	if (s[2] > currentLastDate) {
		s[2] = (s[2] * 1 + pack_days * 1) - currentLastDate * 1;
		s[1] = s[1] * 1 + 1;
		if (s[1] * 1 > 12) {
			s[1] = s[1] * 1 - 12;
			s[0] = s[0] * 1 + 1;
		}
	}
	period += s[0] * 1 + '년 ' + s[1] * 1 + '월 ' + s[2] * 1 + '일';
	document.getElementById('book_period').innerHTML = period;

}
