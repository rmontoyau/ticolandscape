module UsersHelper

def days_in_month (month, year) 
	days = 0
	if (month == 2) && ((year % 4) == 0)
		 days = 29
	else 
		days = COMMON_YEAR_DAYS_IN_MONTH[month]
	end
end

def select_year_month(id)
	months = []
	Constants::MONTHS.each do |month|
		months << [(t "months.#{month[:value]}"), month[:id]]
	end
	select_tag(id, options_for_select(months) )
end

def select_years(id, deep)
	years = []
	current_year = Time.new.year
	deep.downto 0 do |year|
		years << [current_year, current_year]
		current_year -= 1
	end
	select_tag(id, options_for_select(years) )
end

end
