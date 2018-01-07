$(function() {
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	// 시작일
	$('#fromDate').datepicker(
			{
				dateFormat : "yy-mm-dd",
				monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
						"8월", "9월", "10월", "11월", "12월" ],
				dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
				buttonText : "날짜선택",
				dateFormat : "yy-mm-dd", // 날짜의 형식
				changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
				minDate : 0,
				maxDate : 365, // 0 : 오늘 이후 날짜 선택 불가 : 최대 선택 가능한 날짜.
				onClose : function(selectedDate) {
					// 시작일(fromDate) datepicker가 닫힐때
					// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
					$("#toDate").datepicker("option", "minDate", selectedDate);
				}
			});

	// 종료일
	$('#toDate').datepicker(
			{
				dateFormat : "yy-mm-dd",
				monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
						"8월", "9월", "10월", "11월", "12월" ],
				dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
				dateFormat : "yy-mm-dd",
				changeMonth : true,
				mode : 'multiple',
				minDate : 0,
				maxDate : 365, // 오늘 이후 날짜 선택 불가
				onClose : function(selectedDate) {
					// 종료일(toDate) datepicker가 닫힐때
					// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
					$("#fromDate")
							.datepicker("option", "maxDate", selectedDate);
				}
			});
	$('.datepicker').datepicker(
			{
				dateFormat : "yy-mm-dd",
				monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
						"8월", "9월", "10월", "11월", "12월" ],
				dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
				dateFormat : "yy-mm-dd",
				changeMonth : true,
				minDate : 0,
				maxDate : 365, // 오늘 이후 날짜 선택 불가
				onClose : function(selectedDate) {
					// 종료일(toDate) datepicker가 닫힐때
					// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
					$(".datepicker").datepicker("option", "maxDate",
							selectedDate);
				}
			});

	$('body').on(
			'focus',
			".datepicker",
			function() {
				$('.datepicker')
						.datepicker(
								{
									dateFormat : "yy-mm-dd",
									monthNamesShort : [ "1월", "2월", "3월", "4월",
											"5월", "6월", "7월", "8월", "9월",
											"10월", "11월", "12월" ],
									dayNamesMin : [ "일", "월", "화", "수", "목",
											"금", "토" ],
									dateFormat : "yy-mm-dd",
									changeMonth : true,
									minDate : 0,
									maxDate : 365,
								});
			});
	// 패키지 시작일
	// $('.datepicker').removeClass('hasDatepicker').datepicker(
});