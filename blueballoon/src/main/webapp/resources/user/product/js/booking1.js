
function calendar(id, date) {
	var bbCalendar = document.getElementById(id);
	
	if( typeof( date ) !== 'undefined' ) {
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
	
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	
	var currentLastDate = lastDate[currentMonth-1];
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	
	if(currentMonth != 1)
		var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
	else
		var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
	
	if(currentMonth != 12) 
		var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
	else
		var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
	
	if( currentMonth < 10 )
		var currentMonth = '0' + currentMonth;
	
	var calendar = '';
	
	calendar += '<div class="head"><div class="point">1</div><h3>날짜를 선택해주세요.</h3><b class="date date-start">';
	calendar += currentYear + '년 '+ currentMonth + '월 '+currentDay+'일</b></div>';
	calendar += '<div class="months"><div class="right-arrow" onclick="calendar(\'' + id + '\', \'' + nextDate + '\')"></div><div class="left-arrow inactive" onclick="calendar(\'' +  id + '\', \'' + prevDate + '\')"></div><div class="content"><ul style="width: 1016.6666666666667px; margin-left: 0px;">';
	for(var i=0;i<6;i++){
		var cal_year = currentYear;
		var cal_month = currentMonth+i;
		if(cal_month>12){
			cal_month -= 12;
			cal_year++;
		}
	calendar += '<li id="month'+cal_month+'" class="border" style="width: 101.66666666666667px;"><div><span></span>'+cal_year+'년 '+cal_month+'월</div></li>'
	}
	calendar += '</ul></div></div>';
	calendar+='<div class="dates"><table><tbody>';
	calendar+='<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>'
	
//	calendar += '		<table border="0" cellspacing="0" cellpadding="0">';
//	calendar += '			<tbody>';
//	
	var dateNum = 1 - currentDay;
	
	for(var i = 0; i < week; i++) {
		calendar += '<tr>';
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '<td class="day' + dateNum + '"> </td>';
				continue;
			}
			calendar += '<td id="day'+dateNum+'" class="all possible"><div class="container"><div class="day">'+dateNum+'</div><div class="next"></div></div></td>';
		}
		calendar += '</tr>';
	}
	
	calendar+='</tbody></table></div>'
		
	bbCalendar.innerHTML = calendar;
}