COMMON_YEAR_DAYS_IN_MONTH = [null, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
 var days_in_month = function(month, year) {
	if (month == 2 && (year % 4) == 0) {
		return 29;
	}
	else {
		return COMMON_YEAR_DAYS_IN_MONTH[month]
	}
}
