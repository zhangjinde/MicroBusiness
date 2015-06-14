function areaChange(obj,flag)
{
	var selObj = document.getElementById(flag);
	selObj.length = 1;
	$.ajax({
		url:"/micro/pub.do?method=getAreaInfo",
		type:"POST",
		data:"areaFlag="+flag+"&areaValue="+obj.value,
		success:function(data){
			var dataObj = null;
			try{
				dataObj = eval("("+data+")");
			}catch(e){
				alert(data);
			}
			if(dataObj != null)
			{
				for(var i = 0,n = dataObj.length;i < n;i++)
				{
					selObj.length++;
					selObj.options[selObj.length - 1].innerHTML = dataObj[i].areaValue;
					selObj.options[selObj.length - 1].value = dataObj[i].areaFlag;
				}
			}
		}
	});
}