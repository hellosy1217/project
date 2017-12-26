function calendar(date) {
	
	if( typeof( date ) != 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}

	var calendarLocation = document.getElementById('bb_calendar');
	var day = date.getDate();
	var month = date.getMonth();
	var year = date.getYear();
	if (year <= 200) {
		year += 1900;
	}
	months = new Array('1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
			'10월', '11월', '12월');
	days_in_month = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if (year % 4 == 0 && year != 1900) {
		days_in_month[1] = 29;
	}
	total = days_in_month[month];
	beg_j = date;
	beg_j.setDate(1);
	if (beg_j.getDate() == 2) {
		beg_j = setDate(0);
	}
	beg_j = beg_j.getDay();

	var calendar = '';
	calendar +='<h2> date : '+date+'</h2>';

	calendar += '<div class="head"><div class="point">1</div><h3>날짜를 선택해주세요.</h3><b class="date date-start">'
			+ year + '년 ' + month + '월 ' + day + '일</b></div>';
	calendar += '<div class="months"><div class="right-arrow"></div><div class="left-arrow inactive"></div><div class="content"><ul style="width: 1016.6666666666667px; margin-left: 0px;">';
	for (var i = 0; i < 6; i++) {
		calendar += '<li id="month'
				+ (month + i)
				+ '" class="border" style="width: 101.66666666666667px;"><div><span></span>'
				+ year + '년 ' + month
				+ '월</div></li></ul></div></div>';
	}
	calendar += '<table class="cal_calendar"><tbody id="cal_body"><tr><th>월요일</th><th>화요일</th><th>수요일</th><th>목요일</th><th>금요일</th><th>토요일</th><th>일요일</th></tr>';
	week = 0;
	for (i = 1; i <= beg_j; i++) {
		calendar += '<td class=""></td>';
		week++;
	}
	for (i = 1; i <= total; i++) {
		if (week == 0) {
			calendar += '<tr>';
		}
		if (day == i) {
			calendar += '<td class="all  possible selected" id="day' + i
					+ '" onclick="changeDay(' + i + ',' + total
					+ ')"><div class="container"><div class="day">' + i
					+ '</div><div class="next"></div></div></td>';
		} else {
			calendar += '<td class="all possible" id="day' + i
					+ '"onclick="changeDay(' + i + ',' + total
					+ ')"><div class="container"><div class="day">' + i
					+ '</div><div class="next"></div></div></td>';
		}
		if (i == total) {
			calendar += '</tbody></table>';
		}
		week++;
		if (week == 7) {
			calendar += '</tr>';
			week = 0;
		}
	}
	for (i = 1; week != 0; i++) {
		calendar += '<td class=""></td>';
		week++;
		if (week == 7) {
			calendar += '</tr>';
			week = 0;
		}
	}

	calendarLocation.innerHTML = calendar;

//	var links = document.getElementsByTagName('link');
//	for(var x = 0; x<links.length;x++){
//	    document.getElementsByTagName('head')[0].appendChild(links[x]);
//	}
}

function changeDay(day, total) {
	for (var i = 1; i <= total; i++) {
		document.getElementById("day" + i).className = "all possible";
		if (i == day) {
			document.getElementById("day" + i).className = "all possible selected";
		}
	}
}