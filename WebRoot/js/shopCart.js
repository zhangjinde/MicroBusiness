getLocation();

var ProductObj = function(productId , productNum , productPrice){
	this.productId = productId;
	this.productNum = productNum;
	this.productPrice = productPrice;
}

$(document).ready(function(){
	var openId = $("#openId").val();
	qryCartProds(openId, "");
});

function toOrderPage()
{
	var url="/micro/cart.do?method=getOrder";
	var openid=getCookie("openid");
	if(openid=='' || openid==null)
	{
		encodeURL(url); 
	}
}

var prodsNum=0;
var prodsCount=0;
var prodsArray;

function addOrder()
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

function payFunc(addr)
{
	var arr = [];
	for(var i = 0,n = prodsArray.length;i < n;i++)
	{
		var classInfo = $("#div"+prodsArray[i].productId).attr("class");
		if(classInfo.indexOf("checked") != -1)
		{
			arr.push(prodsArray[i]);
		}
	}
	if(arr.length != 0)
	{
		var xPos = $("#xPos").val();
		var yPos = $("#yPos").val();
		var busId = $("#busId").val();
		var openId = $("#openId").val();
		var name = $("#name").val();
		var contactNum = $("#phonenum").val();
		var postCode = $("#postCode").val();
		var totalPrice = $("#totalPrice").html();
		var prodJson = [];
		for(var i = 0,n = arr.length;i < n;i++)
		{
			var obj = new ProductObj(arr[i].productId,arr[i].num,arr[i].productPrice);
			prodJson.push(obj);
		}
		var productInfo = JSON.stringify(prodJson);
		$.ajax({
			url:"/micro/pay.do?method=payCart",
			type:"POST",
			data:"busId="+busId+"&openId="+openId+"&productInfo="+encodeURI(productInfo)+"&xPos="+xPos+"&yPos="+yPos+"&name="+encodeURI(name)+"&contactNum="+contactNum+"&addr="+encodeURI(addr)+"&postCode="+postCode+"&provId=&cityId=&districtId=&totalPrice="+totalPrice,
			success:function(data)
			{
				if(!isNaN(data))
				{
					window.location.href = "/micro/product.do?method=payOrder&busId="+busId+"&orderId="+data+"&openId="+openId+"&name="+encodeURI(name);
				}
				else
				{
					alert(data);
				}
			}
		});
	}
	else
	{
		alert("请先勾选要结算的产品");
	}
}

function deleteProd()
{
 	for(var i=0;i<prodsArray.length;i++)
    {
		var id= prodsArray[i].productId;
	 	if($("#div"+id).attr("choose")=='true')
	 	{
 			$("#li"+id).addClass("hide");
	 	}
    }
}
 
function edit()
{
	if($("#edit").html()=="编辑")
	{
		for(var i=0;i<prodsArray.length;i++)
		{
			var prodId=prodsArray[i].productId;
			$("#tradeNumDiv"+prodId).addClass("hide");
			$("#editNum"+prodId).removeClass("hide");
			var num=$("#tradeNum"+prodId).html();
			$("#prodNum"+prodId).val(num);
			 
		}
		$("#deleteProd").removeClass("hide");
		$("#pay").addClass("hide");
		$("#edit").html("完成");
	}
	else
	{
	  	for(var i=0;i<prodsArray.length;i++)
	    {
	  		var id= prodsArray[i].productId;
	  		$("#tradeNumDiv"+id).removeClass("hide");
	  		$("#editNum"+id).addClass("hide");
	  		$("#tradeNum"+id).html($("#prodNum"+id).val());
	    }
	  	$("#deleteProd").addClass("hide");
	  	$("#pay").removeClass("hide");
	  	$("#edit").html("编辑");
	}
}
 
function chooseProd(id,price,num)
{
	var oldTotal=Number($("#totalPrice").html());
	var choose= $("#div"+id).attr("choose");
	var priceNum=Number(price)*parseInt(num);
	if(choose=='true')
	{
		$("#totalPrice").html(oldTotal-priceNum); 
		$("#div"+id).attr("choose",'false');
		$("#div"+id).removeClass("checked");
		prodsCount--;
	}
	else
	{
		$("#totalPrice").html(oldTotal+priceNum);  
		$("#div"+id).attr("choose",'true');
		$("#div"+id).addClass("checked");
		prodsCount++;
	}
	if(prodsCount==prodsNum)
	{
		$("#allselect").addClass("checked");
	}
	else
	{
		$("#allselect").removeClass("checked");
	}
}
  
function addNum(id)
{
	var num=$("#prodNum"+id).val();
	var numInt=Number(num);
	$("#prodNum"+id).val(++numInt);
}
  
function deleteNum(id)
{
	var num=$("#prodNum"+id).val();
	var numInt=Number(num);
	var n=--numInt;
	if(n==0)
	{
		return;
	}
	$("#prodNum"+id).val(numInt);
}
  
function qryCartProds(id, telephone)
{
	var obj = "";
	var dig = null;
	$.ajax({
	  type: "POST",
	  url: "/micro/product.do?method=getCartProds&id=" + id + "&telephone=" + telephone,
	  data: obj,
	  contentType: "application/json;charset=UTF-8",
	  dataType: "json",
	  beforeSend: function() {
	    //	$(".overlay").css({ 'display': 'block', 'opacity': '0.8' }); $(".showbox").stop(true).animate({ 'margin-top': '300px', 'opacity': '1' }, 0);
	  },
	  success: function(data) {
	    // $(".showbox").stop(true).animate({ 'margin-top': '250px', 'opacity': '0' }, 0); $(".overlay").css({ 'display': 'none', 'opacity': '0' });
	    try {
	      dig.close();
	    } catch(e) {
	
	 	}
	    var content = "";
	    count = data.size;
	    prodsNum=data.size;
	    prodsArray=data.prods;
	    var openId = $("#openId").val();
	    $.each(data.prods, function(i, obj) {
	    	content+="<li id='li"+obj.productId+"' class='block-item block-item-cart relative clearfix'>";
	    	content+="<div class='check-container'>"; 
	    	content+="<span id='div"+obj.productId+"' choose='false'  onclick=chooseProd("+obj.productId+","+obj.productPrice+","+obj.num+") class='check'>"; 
	    	content+="</span>"; 
	    	content+="</div>"; 
	    	content+="<div class='name-card name-card-3col clearfix'>"; 
	    	content+="<a href='/micro/product.do?method=getProduct&productId="+obj.productId+"&busId=100&openId="+openId+"' class='thumb'>"; 
	    	content+="<img src='"+obj.imgUrl+"'>"; 
	    	content+="</a>"; 
	    	content+="<div class='detail'>"; 
	    	content+="<a href='/micro/product.do?method=getProduct&productId="+obj.productId+"&busId=100&openId="+openId+"'>"; 
	    	content+="<h3 class='js-ellipsis' style='height: 32px; overflow: hidden;'>"; 
	    	content+="<i>"; 
	    	content+=obj.productName; 
	    	content+="</i>"; 
	    	content+="</h3>"; 
	    	content+="</a>"; 
	    	content+="<p class='ellipsis'>"; 
	    	content+="</p>"; 
	    	content+="</div>"; 
	    	content+="<div class='right-col price-num'>"; 
	    	content+="<div class='price'>"; 
	    	content+="￥"; 
	    	content+="<span>"; 
	    	content+=obj.productPrice; 
	    	content+="</span>"; 
	    	content+="</div>";
	    	content+="<div id='tradeNumDiv"+obj.productId+"' class='num'>"; 
	    	content+="×"; 
	    	content+="<span id='tradeNum"+obj.productId+"' class='num-txt'>"; 
	    	content+=obj.num; 
	    	content+="</span>"; 
	    	content+="</div>"; 
	    	content+="<div id='editNum"+obj.productId+"' class='num hide'>";
	    	content+="<div class='quantity'>";
	    	content+="<button class='minus' type='button' >";
	    	content+="</button>";
	    	content+="<input id='prodNum"+obj.productId+"' type='text' class='txt' value='1'>";
	    	content+="<button class='plus' type='button'>";
	    	content+="</button>";
	    	content+="<div id='deleteNum"+obj.productId+"' onclick=deleteNum("+obj.productId+") class='response-area response-area-minus'>";
	    	content+="</div>";
	    	content+="<div id='addNum"+obj.productId+"' onclick=addNum("+obj.productId+") class='response-area response-area-plus'>";
	    	content+="</div>";
	    	content+="<div class='txtCover'>";
	    	content+="</div>";
	    	content+="</div>";
	    	content+="</div>";
	    	content+="<div class='error-box'>"; 
	    	content+="</div>"; 
	    	content+="</div>"; 
	    	content+="</div>"; 
	    	content+="<div class='delete-btn'> "; 
	    	content+="<span>"; 
	    	content+="删除"; 
	    	content+="</span>"; 
	    	content+="</div>"; 
	    	content+="</li>"; 
	    });
	    $("#template").html(content);
	    //var result=data.wakeContent;
	    //$("#result").html(result);
	  },
	  error: function(data) {
	    $(".showbox").stop(true).animate({
	      'margin-top': '250px',
	      'opacity': '0'
	    }, 0);
	    $(".overlay").css({
	      'display': 'none',
	      'opacity': '0'
	    });
	    $("#template").html("暂无信息");
	    //$.dialog.alert(data.statusText, function(){window.location.reload(); return true;});
	  }
	});
}

function selectAll()
{
	var total=0;
	if(!$("#allselect").hasClass("checked"))
	{
		for(var i=0;i<prodsArray.length;i++)
		{
			var price=Number(prodsArray[i].productPrice);
			var num = parseInt(prodsArray[i].num);
			total=price*num+total;
			$("#div"+prodsArray[i].productId).addClass("checked");
		}
		$("#totalPrice").html(total); 
		$("#allselect").addClass("checked");
	}
	else
	{
		for(var i=0;i<prodsArray.length;i++)
	    {
			$("#div"+prodsArray[i].productId).removeClass("checked");
	    } 
	  	$("#totalPrice").html(0); 
	  	$("#allselect").removeClass("checked");
	}
}