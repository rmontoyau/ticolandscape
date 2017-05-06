//update date fromat
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

	function form_methods(action, add = true){
		if (add){
			input = $("<input>").attr('id','experience_form_method').attr('name', '_method').attr('type', 'hidden').val(action);
			$("#experience_form").prepend(input);
		}
		else {
			$("#experience_form_method").remove();
		}
	}

	var update_experience = function(id){

		$("#experience_modal").modal("show");
		experience = experiences[id];
		$("#experience_title").val(experience['title']);
		$("#experience_summary").val(experience['summary']);
		tinymce.editors[0].setContent(experience["summary"])
		$("#experience_is_current").attr('checked', experience['summary']);
		var month =  new Date(experience['initial_date']).getMonth() + 1;
		var year =  new Date(experience['initial_date']).getFullYear();
		$("#initial_date_month").val(month);
		$("#initial_date_year").val(year);
		var month =  new Date(experience['final_date']).getMonth() + 1;
		var year =  new Date(experience['final_date']).getFullYear();
		$("#final_date_month").val(month);
		$("#final_date_year").val(year);
		if (id != null) {
			$("#experience_id").val(id);
			$("#experience_form").attr("action" , "/experiences/" + id );
			form_methods('patch', true);
		} else {
			$("#experience_form").attr("action" , "/experiences");
			$("#experience_id").val(-1);
			form_methods('patch', false);
		}
	};

$(document).ready(function() {

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