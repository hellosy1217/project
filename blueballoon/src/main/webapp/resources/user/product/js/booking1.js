function calendar(date) {
	if (date == null) {
		date = new Date();
	} else {
		date = new Date(date);
	}
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
	document
			.write('<table class="cal_calendar"><tbody id="cal_body"><tr><th>월요일</th><th>화요일</th><th>수요일</th><th>목요일</th><th>금요일</th><th>토요일</th><th>일요일</th></tr>');
	week = 0;
	for (i = 1; i <= beg_j; i++) {
		document.write('<td class=""></td>');
		week++;
	}
	for (i = 1; i <= total; i++) {
		if (week == 0) {
			document.write('<tr>');
		}
		document
				.write('<td class="all  empty"><div class="container"><div class="day">'
						+ i + '</div><div class="next"></div></div></td>');
		week++;
		if (week == 7) {
			document.write('</tr>');
			week = 0;
		}
	}
	for (i = 1; week != 0; i++) {
		document.write('<td class=""></td>');
		week++;
		if (week == 7) {
			document.write('</tr>');
			week = 0;
		}
	}
	document.write('</tbody></table>');
	opacity(document.getElementById('cal_body'), 70);
	return true;
}