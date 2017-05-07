
/* ------------------------------
 * Generate an iframe dialog
 * title:: Dialog's title
 * url:: Dialog's iframe url
 * options:: Dialog's iframe options
 * ------------------------------*/
function report_dialog(title, url, options){
    var iframe = $('#report_dialog_iframe');
    var default_options = {
        width: 1000,
        height: 900,
        style: ''
    }
    options  = $.extend(true, default_options, (options || {}));
    
    iframe.attr('style', 'height: 600px; width: 100%;' + options.style);
    iframe.attr('src', url);
    $("#report_dialog_title").html(title);
    $("#report_dialog_cancel").click(function(){
        $("#report_dialog").modal('hide');
    });
    
    if(options.acceptCallback != null){
        
        $("#report_dialog_accept").click(function(){
            options.acceptCallback();
            $("#report_dialog").modal('hide');
        });
        $("#report_dialog_accept").html(options.acceptLabel);
        $("#report_dialog_accept").show();
    } else {
        $("#report_dialog_accept").hide();
    }
    $("#report_dialog_new_window").click(function(){
         window.open(url);
         $("#report_dialog").modal('hide');
    });
    $("#report_dialog").modal('show');
}
/* ------------------------------
 * Generate an iframe dialog
 * title:: Dialog's title
 * url:: Dialog's iframe url
 * options:: Dialog's iframe options
 * ------------------------------*/
function iframe_dialog(title, url, options){
	var iframe = $('#iframe_dialog_iframe');
    var default_options = {
        width: 1000,
        height: 900,
        style: ''
    }
    options  = $.extend(true, default_options, (options || {}));
    
    iframe.attr('style', 'height: 600px; width: 100%;' + options.style);
    iframe.attr('src', url);
    $("#iframe_dialog_title").html(title);
    $("#iframe_dialog_cancel").click(function(){
    	$("#iframe_dialog").modal('hide');
	});
	$("#iframe_dialog_accept").click(function(){
		 window.open(url);
		 $("#iframe_dialog").modal('hide');
	});
	$("#iframe_dialog").modal('show');
}
/* ------------------------------
 * Generate an issue form dialog
 * title:: Dialog's title
 * url:: Dialog's ajax content url
 * data:: Dialog's ajax data
 * ------------------------------*/
function issue_dialog(title, url, data){
	$("#issue_dialog_title").html(title);
	showWaitNotice();
    $.ajax({
        url: url,
        data: data,
        success: function(response){
            hideWaitNotice();
            $("#issue_dialog").modal('show');
            $("#issue_dialog_body").html(response);
        },
        error: function(){
            hideWaitNotice();
            showAjaxError();
        }
    });
}
/* ------------------------------
 * Generate a Change status dialog
 * title:: Dialog's title
 * question:: Display question
 * accept_expression:: javascript callback function string to execute when accepted
 * cancel_expression:: javascript callback function string to execute when canceled
 * scope:: functions scope
 * ------------------------------*/
function dialog_change_status(title, question, acceptCallback, cancelCallback, scope){
	$("#dialog_change_status_title").html(title);
	$("#dialog_change_status_message").html(question);
	$("#dialog_change_status_cancel").click(function(){
		$("#dialog_change_status").modal('hide');
        if(typeof cancelCallback == "function") {
            cancelCallback.call();
        }
	});
	$("#dialog_change_status_accept").click(function(){
		$("#dialog_change_status").modal('hide');
         if(typeof acceptCallback == "function") {
             acceptCallback.call();
         }
	});
	$("#dialog_change_status").modal('show');
}
/* ------------------------------
 * Generate a confirmation dialog
 * title:: Dialog's title
 * question:: Display question
 * thisObject:: Object to represent 'this' in the callback functions
 * acceptCallback:: accept callback function
 * acceptParameters:: accept callback function parameters array
 * cancelCallback:: cancel callback
 * cancelParameters:: cancel callback function parameters array
 * ------------------------------*/
function parameter_confirmation_dialog(title, question, thisObject, acceptCallback, acceptParameters, cancelCallback, cancelParameters) {
    	$("#parameter_confirmation_dialog_title").html(title);
    	$("#parameter_confirmation_dialog_message").html(question);
    	$("#parameter_confirmation_dialog_cancel").click(function(){
    		$("#parameter_confirmation_dialog").modal('hide');
    		if(cancelCallback)
                cancelCallback.apply(thisObject, cancelParameters);
    	});
    	$("#parameter_confirmation_dialog_accept").click(function(){
    		$("#parameter_confirmation_dialog").modal('hide');
    		if(acceptCallback)
                acceptCallback.apply(thisObject, acceptParameters)
    	});
    	$("#parameter_confirmation_dialog").modal('show');
}

/* ------------------------------
 * Generate a confirmation dialog
 * title:: Dialog's title
 * question:: Display question
 * accept_expression:: javascript callback function string to execute when accepted
 * cancel_expression:: javascript callback function string to execute when canceled
 * scope:: functions scope
 * ------------------------------*/
function confirmation_dialog(title, question, acceptCallback, cancelCallback, scope){
	$("#confirmation_dialog_title").html(title);
	$("#confirmation_dialog_message").html(question);
	$("#confirmation_dialog_cancel").click(function(){
		$("#confirmation_dialog").modal('hide');
        if(typeof cancelCallback == "function") {
            cancelCallback.call();
        }
        if(typeof cancelCallback == "string") {
            if(scope) {
                eval('scope.'+cancelCallback+'();');
            } else {
                eval(cancelCallback+'();');
            }
        }
	});
	$("#confirmation_dialog_accept").click(function(){
		$("#confirmation_dialog").modal('hide');
         if(typeof acceptCallback == "function") {
             acceptCallback.call();
         }
         if(typeof acceptCallback == "string") {
             if(scope) {
                 eval('scope.'+acceptCallback+'();');
             } else {
                 eval(acceptCallback+'();')
             }
         }
	});
	$("#confirmation_dialog").modal('show');
}
/* ------------------------------
 * Generate a confirmation dialog
 * title:: Dialog's title
 * message:: Display message
 * ------------------------------*/
function information_dialog(title, message) {
	$("#information_dialog_title").html(title);
	$("#information_dialog_message").html(message);
	$("#information_dialog").modal('show');
}

/* ------------------------------
 * Generate a confirmation dialog
 * title:: Dialog's title
 * message:: Display message
 * ------------------------------*/
function image_dialog(title, options) {
    
    options = $.extend(true,{
        url: false,
        html: ''
    },options);

    if(options.url){
        content = '<img src="'+options.url+'" style="max-width:600px; height:auto;" />'
    }
    else{
        content = options.html;
    }

    $("#image_dialog_body").html(content)
    $("#image_dialog_title").html(title);
    $("#image_dialog_body").find("img").css("max-width","550px");
	$("#image_dialog").modal('show');
}

/* ------------------------------
 * Generate a form dialog
 * title:: Dialog's title
 * message:: Display message
 * ------------------------------*/
function form_dialog(title, message, form_items, callback, scope) {
    var d = $("#form_dialog_body");
    d.html(" ");
    form = $('<form ></form>');
    for(var index in form_items){
        item = form_items[index];
        form_item = generate_form_item(index, item);
        form.append(form_item);
    }
    d.append('<h4>'+message+'</h4>');
    d.append(form);
    
    form.submit(function(){
        return false;
    }); //This form should not submit data
  
    $("#form_dialog_cancel").click(function(){
		$("#form_dialog").modal('hide');
		
	});
	$("#form_dialog_accept").click(function(){
		$("#form_dialog").modal('hide');
		var form = formToObject($('.modal-content').find('form'), 'dialogFormItem');
        if(callback != null) {
            if(scope != null) {
                callback.apply(scope, [form]);
            } else {
                callback.apply(this, [form]);
            }
        }
	});
    $("#form_dialog_title").html(title);
	$("#form_dialog").modal('show');
}
/* ------------------------------
 * Generate a error dialog
 * message:: Display message
 * ------------------------------*/
function error_dialog(message) {
	$("#error_dialog_message").html(message);
	$("#error_dialog").modal('show');
}

/* ------------------------------
 * Displays an error message to the user using the error dialog for ajax request problems
 * responseText:: Response from server
 * statusText:: Server response status text
 * ------------------------------*/
function showAjaxError() {
    error_dialog('An error occurred, please contact your system administrator.');
}
//Generate a form item
function generate_form_item(name, data){
    var group = $("<div>").addClass("form-group");
    var item = null;
    var label = $("<label>").html(name.titleize());
    data = (data || {});
    switch(data.type){
        case 'select':
            item = $("<select>").attr({"id":"dialogFormItem" + name}).addClass("form-control");
            for(var index in data.options){
                item.append(new Option(data.options[index]));
            }
            break;
        case 'textarea':
            
            item = $("<textarea>").attr({"id":"dialogFormItem" + name, "row" : "3"}).addClass("form-control");
            break;
        case 'input':
        default:
        	item = $("<input>").attr({"id":"dialogFormItem" + name, "type" : "text"}).addClass("form-control");
            break;
    }
    $(item).val(data.value);
    group.append(label).append(item);
    return group;
}

/* ------------------------------
 * Displays a progress bar to indicate the application is working
 * element:: div element where the progress bar should be displayed
 * height:: progress bar's height
 * width:: progress bar's width
 * progress:: progress value
 * ------------------------------*/
function progress_bar(element, progressVal) {
    var line = $("<div>").addClass("progress-bar")
    .attr({
    		'id' : element + "-progressbar",
    		'role' : 'progressbar', 
    		'aria-valuenow' : progressVal, 
    		'aria-valuemin' : '0',
    		'aria-valuemax' : '100'
    	})
    .css('width', progressVal + '%')
    .html(progressVal + '%')
     var progress = $("<div>").addClass("progress").append(line);
    $("#"+element).html(progress);
}

/* ------------------------------
 * Displays a progress bar to indicate the application is working
 * element:: div element where the progress bar should be displayed
 * height:: progress bar's height
 * width:: progress bar's width
 * items:: total of items
 * processed:: items ready
 * ------------------------------*/
function progress_bar_from_items(element, items, processed) {
    progress = (processed / items) * 100;
    progress_bar(element, progress);
}

/* ------------------------------
 * Adds a button to the grid toolbar. The button expects a callback function named "action{id}" to do its job.
 * id:: button tag id
 * caption:: caption of the button
 * gridName:: grid tag id
 * jqueryuiIcon:: jquery ui icon class
 * ------------------------------*/
function addToolbarButton(id, caption, gridName, jqueryuiIcon) {
    ab='<div id="' + id + '" class="fg-button ui-state-default ui-corner-all toolbar-button"><a href="javascript:void(0);" onClick="action' + id +  '();" ><span class="ui-icon '+  jqueryuiIcon + ' inline"></span><span style="vertical-align:bottom;">' + caption + '</span></a></div>'
    $("#t_" + gridName).append(ab);
    $("#"+id).hover( function() {
        $(this).addClass("ui-state-hover");
    }, function() {
        $(this).removeClass("ui-state-hover");
    }
    )
}

/* ------------------------------
 * Adds a button to a container. The button expects a callback function for the click event.
 * id:: button tag id
 * caption:: caption of the button
 * containerId:: container tag id
 * jqueryuiIcon:: jquery ui icon class
 * callback:: Callback function for events
 * ------------------------------*/
function createButton(id, caption, containerId, glyphicon, callback, button_type) {
	var btn_type = (button_type == null) ? "btn-primary" : button_type;
	var button = $("<a>").attr('id', id)
		.addClass("btn btn-sm " + btn_type).html('<span class="glyphicon ' + glyphicon + '"  aria-hidden="true"></span>&nbsp;' +  caption)
		.bind('click', callback);

    $("#" + containerId).append(button);
   
}

/* ------------------------------
 * Generate a loading dialog
 * message:: Display message
 * ------------------------------*/
function showLoadingDialog(message) {
   $("#loading_dialog_msg").html(message);
   $("#loading_dialog").modal('show');
}

function hideLoadingDialog(message) {
   $("#loading_dialog").modal('hide');
}

/*
//override jquery validate plugin defaults
$.validator.setDefaults({
    highlight: function(element) {
        $(element).closest('.form-group').addClass('has-error');
    },
    unhighlight: function(element) {
        $(element).closest('.form-group').removeClass('has-error');
    },
    errorElement: 'span',
    errorClass: 'help-block',
    errorPlacement: function(error, element) {
        if(element.parent('.input-group').length) {
            error.insertAfter(element.parent());
        } else {
            error.insertAfter(element);
        }
    }
});*/