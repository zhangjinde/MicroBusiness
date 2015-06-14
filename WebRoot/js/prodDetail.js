getLocation();

function addCart()
{
	var phoneNum = $("#phoneNum").val();
	var productId = $("#productId").val();
	var productNum = $("#buyNum").val();
	
	var cart={"telephone":phoneNum,"productId":productId,"num":productNum};
	$.ajax({
		url:"/micro/cart.do?method=addCart",
		type:"POST",
		data:"cart="+JSON.stringify(cart),
		success:function(data){
			$("#right-icon").removeClass("hide");
		}
	});
	
}

function addOrder()
{
	var provId = $("#province").val();
	var cityId = $("#city").val();
	var districtId = $("#district").val();
	var provName = $("#province").get(0).options[$("#province").get(0).selectedIndex].innerHTML;
	var cityName = $("#city").get(0).options[$("#city").get(0).selectedIndex].innerHTML;
	var districtName = $("#district").get(0).options[$("#district").get(0).selectedIndex].innerHTML;
	var addr = $("#address").val();
	if(provName != ""&&cityName != ""&&districtName != ""&&addr != "")
	{
		var url = "http://api.map.baidu.com/geocoder/v2/?ak=C93b5178d7a8ebdb830b9b557abce78b&address="+encodeURI(provName+cityName+districtName+addr)+"&output=json&pois=0&coordtype=wgs84ll"; 
		$.ajax({
			type: "GET", 
			dataType: "jsonp", 
			url: url, 
			async:false,
			success: function (json) { 
				if (json == null || typeof (json) == "undefined") { 
					return; 
				} 
				if (json.status != "0") { 
					return; 
				} 
				setPlaceAxis(json.result.location);
				payFunc(provName+cityName+districtName+addr,provId,cityId,districtId);
			}
		}); 
	}
	else
	{
		payFunc(provName+cityName+districtName+addr,provId,cityId,districtId);
	}
}

function payFunc(addr,provId,cityId,districtId)
{
	var busId = $("#busId").val();
	var phoneNum = $("#phoneNum").val();
	var productId = $("#productId").val();
	var productNum = $("#buyNum").val();
	var productPrice = $("#productPrice").html();
	var name = $("#name").val();
	var contactNum = $("#phonenum").val();
	var xPos = $("#xPos").val();
	var yPos = $("#yPos").val();
	var postCode = $("#postCode").val();
	$.ajax({
		url:"/micro/pay.do?method=addOrder",
		type:"POST",
		data:"busId="+busId+"&phoneNum="+phoneNum+"&productId="+productId+"&productNum="+productNum+"&productPrice="+productPrice+"&xPos="+xPos+"&yPos="+yPos+"&name="+encodeURI(name)+"&contactNum="+contactNum+"&provId="+provId+"&cityId="+cityId+"&districtId="+districtId+"&addr="+encodeURI(addr)+"&postCode="+postCode,
		success:function(data){
			if(!isNaN(data))
			{
				window.location.href = "/micro/product.do?method=payOrder&busId="+busId+"&orderId="+data;
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
	addCart();
});

$("#saveBtn").on('touchend',function(){
	addOrder();
});
