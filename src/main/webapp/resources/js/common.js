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
	}).catch(function() {});
}

function showConfirm(msg, callback, param){
	swal({
		  title: msg,
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '예',
		  cancelButtonText: '아니오'
		}).then(function () {
			callback(param);
		}, function(){});
}

var getParameters = function (paramName) {
    // 리턴값을 위한 변수 선언
    var returnValue;

    // 현재 URL 가져오기
    var url = location.href;

    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
    for (var i = 0; i < parameters.length; i++) {
        var varName = parameters[i].split('=')[0];
        if (varName.toUpperCase() == paramName.toUpperCase()) {
            returnValue = parameters[i].split('=')[1];
            return decodeURIComponent(returnValue);
        }
    }
};
