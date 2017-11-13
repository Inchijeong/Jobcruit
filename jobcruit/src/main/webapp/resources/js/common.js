function makePage(param){
	var pageSize = 5;
	var last = Math.ceil(param.page / (pageSize * 1.0)) * pageSize;
    var first = last - pageSize + 1;
    var prev = false;
    var next = true;

    if(last * param.size >= param.total){
        last = Math.ceil(param.total/(param.size*1.0));
        next = false;
    }
    prev = first != 1? true:false;
    return {first:first, last:last, next:next, prev:prev, page:param.page};
}

function getDateFormat(date,sep){
	var d = new Date(date);
	var month = d.getMonth()+1;
	var date = d.getDate();
	
	return d.getFullYear()+sep+(month < 10 ? "0"+month:month)+sep+(date < 10 ? "0"+date:date);
}

function getDateTime(date){
	var d = new Date(date);
	var month = d.getMonth()+1;
	var date = d.getDate();
	var seconds = d.getSeconds();
	
	return d.getFullYear()+"-"+(month < 10 ? "0"+month:month)+"-"+(date < 10 ? "0"+date:date)+" "+d.getHours()+":"+d.getMinutes()+":"+(seconds < 10 ?"0"+seconds:seconds);
}

function showAlert(msg, type, isButton, time){
	type = type ? type : "success";
	isButton = isButton ? isButton : false;
	time = time ? time : 1000;
	
	swal({
		title:msg,
		type:type,
		showConfirmButton: isButton,
		timer: time
	}).then();
}