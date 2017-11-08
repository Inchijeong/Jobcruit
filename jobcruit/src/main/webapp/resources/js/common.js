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