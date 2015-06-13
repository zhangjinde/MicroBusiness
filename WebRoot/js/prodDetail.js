//getLocation();

function addCart()
{
	var phoneNum = $("#phoneNum").val();
	var productId = $("#productId").val();
	var productNum = $("#buyNum").val();
	
	var cart={"telephone":phoneNum,"productId":productId,"num":productNum};
	$.ajax({
		url:"/cart.do?method=addCart",
		type:"POST",
		data:"cart="+JSON.stringify(cart),
		success:function(data){
			if(data == "success")
			{
				window.location.href = "/product.do?method=payOrder";
			}
			else
			{
			//	alert(data);
			}
		}
	});
	
}

function addOrder()
{
	var busId = $("#busId").val();
	var phoneNum = $("#phoneNum").val();
	var productId = $("#productId").val();
	var productNum = $("#buyNum").val();
	var productPrice = $("#productPrice").html();
	var xPos = $("#xPos").val();
	var yPos = $("#yPos").val();
	var name = $("#name").val();
	var contactNum = $("#phonenum").val();
	var provName = $("#province").get(0).options[$("#province").get(0).selectedIndex].innerHTML;
	var cityName = $("#city").get(0).options[$("#city").get(0).selectedIndex].innerHTML;
	var districtName = $("#district").get(0).options[$("#district").get(0).selectedIndex].innerHTML;
	var addr = $("#address").val();
	var postCode = $("#postCode").val();
	$.ajax({
		url:"/pay.do?method=addOrder",
		type:"POST",
		data:"busId="+busId+"&phoneNum="+phoneNum+"&productId="+productId+"&productNum="+productNum+"&productPrice="+productPrice+"&xPos="+xPos+"&yPos="+yPos+"&name="+encodeURI(name)+"&contactNum="+contactNum+"&provName="+encodeURI(provName)+"&cityName="+encodeURI(cityName)+"&districtName="+encodeURI(districtName)+"&addr="+encodeURI(addr)+"&postCode="+postCode,
		success:function(data){
			if(!isNaN(data))
			{
				window.location.href = "/product.do?method=payOrder&busId="+busId+"&orderId="+data;
			}
			else
			{
				alert(data);
			}
		}
	})
}
$("#plus").on('touchend',function(){
	var numStr = $("#buyNum").val();
	var num = parseInt(numStr);
	if(parseInt(num) == 1)
	{
		$("#minus").removeClass("minus_disabled");
	}
	num++;
	var prodStockNum = parseInt($("#prodStock").html());
	if(num>=prodStockNum)
	{
		$("#plus").addClass("plus_disabled");
		num = prodStockNum;
	}
	$("#buyNum").val(num);
});
$("#minus").on('touchend',function(){
	var numStr = $("#buyNum").val();
	var num = parseInt(numStr);
	var prodStockNum = parseInt($("#prodStock").html());
	if(parseInt(num) == prodStockNum)
	{
		$("#plus").removeClass("plus_disabled");
	}
	num--;
	if(num<=1)
	{
		$("#minus").addClass("minus_disabled");
		num = 1;
	}
	$("#buyNum").val(num);
});
$("#pDesc").on('touchend',function(){
	$("#pOrder").removeClass("cur");
	$("#pDesc").addClass("cur");
	$("#prodOrder").css("display","none");
	$("#prodDesc").css("display","block");
});
$("#pOrder").on('touchend',function(){
	$("#pDesc").removeClass("cur");
	$("#pOrder").addClass("cur");
	$("#prodDesc").css("display","none");
	$("#prodOrder").css("display","block");
});

$("#joinShopCart").on('touchend',function(){
	
});

$("#saveBtn").on('touchend',function(){
	addOrder();
});

function areaChange(obj,flag)
{
	var selObj = document.getElementById(flag);
	selObj.length = 1;
	$.ajax({
		url:"/pub.do?method=getAreaInfo",
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
