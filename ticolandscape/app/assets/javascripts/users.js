$(document).ready(function(){


	var update_final_date = function(){
		var day = 1;
		var month = $("#final_date_month").val();
		var year = $("#final_date_year").val();
		$("#experience_final_date").val(day + '/' + month + '/' + year);
	};

	var update_initial_date = function(){
		var	day = 1;
		var month = $("#initial_date_month").val();
		var year = $("#initial_date_year").val();
		$("#experience_initial_date").val(day + '/' + month + '/' + year);

	};

	//ACTIONS
	//update current experience item
	$("#final_date_month").click(update_final_date);
	$("#final_date_year").click(update_final_date);
	$("#initial_date_month").click(update_initial_date);
	$("#initial_date_year").click(update_initial_date);

	$("#experience_is_current").change(function(){
		if ($(this).is(":checked")){
			$("#final_date_month").attr('disabled', 'disabled');
			$("#final_date_year").attr('disabled', 'disabled');
		}
		else {
			$("#final_date_month").removeAttr('disabled');
			$("#final_date_year").removeAttr('disabled');
		}
	});
	update_final_date();
	update_initial_date();
});