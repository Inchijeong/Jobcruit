//function makePage(param) {
//	var last = Math.ceil(param.page/10.0)*10.0;
//	var first = last-9;
//
//	var prev = false;
//	var next = true;
//
//	if((last*param.size) >= param.total) {
//		last = Math.ceil(param.total/(param.size*1.0));
//		next = false;
//	}
//	prev = first!=1? true: false;
//
//	return {first:first, last:last, prev:prev, next:next, page:param.page};
//}


function makePage(param){
	var page = param.page;
	var pagesize = 5;
	var first = page < 3 ? 1 : page - 2;
	var last = page + 2
	var prev = false;
	var next = true;
	var pageTotal = Math.ceil(param.total/(param.size*1.0));

	if (page >= pageTotal-1) {
	    last = pageTotal;
	    next = false;
	}

	prev = first>1 ? true: false;
	return {prev:prev, next:next, first:first, last:last, page:param.page};
	}