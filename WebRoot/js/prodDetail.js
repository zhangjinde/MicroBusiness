getLocation();

function addCart()
{
	var openId = $("#openId").val();
	var productId = $("#productId").val();
	var productNum = $("#buyNum").val();
	
	var cart={"weixinId":openId,"productId":productId,"num":productNum};
	$.ajax({
		url:"/micro/cart.do?method=addCart",
		type:"POST",
		data:"cart="+JSON.stringify(cart),
		success:function(data){
			$("#right-icon").removeClass("hide");
			alert("已加入购物车!")
		}
	});
	
}

function addOrder()
{
  	if(isWorkRange())
  	{
  		var productPrice = $("#productPrice").html();
        var buyNum = parseInt($("#buyNum").val());
		if(Number(productPrice)*buyNum >= gDisFeeLimit)
		{
			var addr = $("#address").val();
			if(addr != "")
			{
				var url = "http://api.map.baidu.com/geocoder/v2/?ak=C93b5178d7a8ebdb830b9b557abce78b&address="+encodeURI(addr)+"&output=json&pois=0&coordtype=wgs84ll"; 
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
						payFunc(addr);
					}
				}); 
			}
			else
			{
				var addrName = $("#addrName").html();
				payFunc(addrName);
			}
		}
		else
		{
			alert("消费必须"+gDisFeeLimit+"元才与配送哦~");
			addCart();
		}
  	}
  	else
  	{
  		alert("当前时间不在订餐时段内("+gStartHour+":00:00~"+gEndHour+":00:00)!");
  	}
}

function payFunc(addr)
{
	var busId = $("#busId").val();
	var openId = $("#openId").val();
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
		data:"busId="+busId+"&openId="+openId+"&productId="+productId+"&productNum="+productNum+"&productPrice="+productPrice+"&xPos="+xPos+"&yPos="+yPos+"&name="+encodeURI(name)+"&contactNum="+contactNum+"&addr="+encodeURI(addr)+"&postCode="+postCode,
		success:function(data){
			var orderId = data;
			data = data.substring(1);
			if(!isNaN(data))
			{
				window.location.href = "/micro/product.do?method=payOrder&busId="+busId+"&orderId="+orderId+"&openId="+openId;
			}
			else
			{
				alert(orderId);
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
