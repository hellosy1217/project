function bbSearch(id) {
	var bbSearch = document.getElementById(id);

	var searchHtml = '';

	searchHtml += '<div class="autocomplete">';
	searchHtml += '<input class="a autocomplete-field" type="text" placeholder="어디로 가고싶으세요?" autocomplete="off" data-url="">';
	searchHtml += '<ul class="autocomplete-list pre" style="display: none;">';
	searchHtml += '<li class="autocomplete-item" data-url="d/europe" data-type="CONTINENT">Europe<span>CONTINENT</span></li>';
	searchHtml += '</ul></div>';
	searchHtml += '<div class="b"><input class="b" id="selectedMonth" name="month" type="text" placeholder="2018년" readonly>';
	searchHtml += '<div class="months hid">';

	var date = new Date();

	var currentYear = date.getFullYear();
	var currentMonth = date.getMonth() + 1;
	var currentDate = date.getDate();

	date.setDate(1);
	var currentDay = date.getDay();

	for (var i = 0; i < 12; i++) {
		var month = currentMonth + i;
		if (month > 12) {
			month -= 12;
			searchHtml += '<div onclick="selectedMonth(' + month + ')">'
					+ month + '월</div>';
		} else {
			searchHtml += '<div onclick="selectedMonth(' + month + ')">'
					+ month + '월</div>';
		}
	}
	searchHtml += '</div></div><span class="but blue">Search</span>';

	bbSearch.innerHTML = searchHtml;

}

function selectedMonth(month) {
	alert("실행");
	document.getElementById('selectedMonth').value = month + '월';
}