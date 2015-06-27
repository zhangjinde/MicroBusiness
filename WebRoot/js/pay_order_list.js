var items_per_page = 5;
var scroll_in_progress = true;
var myScroll;
load_content = function(refresh, next_page) {
	setTimeout(function() {
		var orderType = $("#orderType").val();
		var openId = $("#openId").val();
		var busId = $("#busId").val();
		if(next_page == null)
		{
			next_page = 1;
		}
		else if(isNaN(next_page))
		{
			next_page = 0;
		}
		$.ajax({
			url:"/micro/order.do?method=qryOrderList",
			type:"POST",
			data:"orderType="+orderType+"&openId="+openId+"&pageNum="+next_page+"&pageSize="+items_per_page,
			dataType:"json",
			success:function(data){
				var json = data;
				var arr = [];
				if(next_page == 1 && json.data.length == 0)
				{
					arr.push("<div class='empty-list list-finished' style='padding-top:60px;'>");
					arr.push("<div>");
					arr.push("<h4>居然还没有订单</h4>");
					arr.push("<p class='font-size-12'>好东西，手慢无</p>");
					arr.push("</div>");
					arr.push("<div><a href='/micro/shop.jsp' class='tag tag-big tag-orange' style='padding:8px 30px;'>去逛逛</a></div>");
					arr.push("</div>");
					$("#order-list-container").html(arr.join(""));
					return ;
				}
				for(var i = 0,n = json.data.length;i < n;i++)
				{
					arr.push("<li class='block block-order animated row'>");
					arr.push("<div class='header'>");
					arr.push("<span class='font-size-12'>订单号："+json.data[i].orderId+"</span>");
					if(json.data[i].sts != 'O' && json.data[i].sts != 'P')
					{
						arr.push("<a class='js-cancel-order pull-right font-size-12 c-blue' href='javascript:;' onclick=cancelOrderFunc('"+json.data[i].orderId+"')>取消</a>");
					}
					arr.push("</div>");
					arr.push("<hr class='margin-0 left-10'>");
					for(var j = 0,m = json.data[i].orderDetailInfo.length;j < m;j++)
					{
						arr.push("<div class='block block-list block-border-top-none block-border-bottom-none'>");
						arr.push("<div class='block-item name-card name-card-3col clearfix'>");
						arr.push("<a href='javascript:void(0)' onclick=getProds("+json.data[i].orderDetailInfo[j].productId+") class='thumb'>");
						arr.push("<img src='"+json.data[i].orderDetailInfo[j].imgUrl+"'>");
						arr.push("</a>");
						arr.push("<div class='detail'>");
						arr.push("<a href='javascript:void(0)' onclick=getProds("+json.data[i].orderDetailInfo[j].productId+")><h3>"+json.data[i].orderDetailInfo[j].productName+"</h3></a>");
						arr.push("</div>");
						arr.push("<div class='right-col'>");
						arr.push("<div class='price'>￥<span>"+json.data[i].orderDetailInfo[j].productPrice+"</span></div>");
						arr.push("<div class='num'>");
						arr.push("×<span class='num-txt'>"+json.data[i].orderDetailInfo[j].productNum+"</span>");
						arr.push("</div>");
						arr.push("</div>");
						arr.push("</div>");
						arr.push("</div>");
					}
					arr.push("<hr class='margin-0 left-10'>");
					arr.push("<div class='bottom'>");
					arr.push("总价：<span class='c-orange'>￥"+json.data[i].orderPrice+"</span>");
					arr.push("<div class='opt-btn'>");
					if(json.data[i].sts == 'A')
					{
						arr.push("<a class='btn btn-orange btn-in-order-list' href='/micro/product.do?method=payOrder&busId="+busId+"&orderId="+json.data[i].orderId+"&openId="+openId+"'>付款</a>");
					}
					else 
					{
						var textCont = "";
						if(json.data[i].sts == 'R')
						{
							textCont = "待发货";
						}
						else if(json.data[i].sts == 'H')
						{
							textCont = "已发货";
						}
						else if(json.data[i].sts == 'O')
						{
							textCont = "已完成";
						}
						else if(json.data[i].sts == 'P')
						{
							textCont = "已取消";
						}
						arr.push("<span style=''>"+textCont+"</span>");
					}			
					arr.push("</div>");
					arr.push("</div>");
					arr.push("</li>");
				}
				$('#wrapper > #scroller > ul').append(arr.join(""));
				if (refresh) {
					myScroll.refresh();
					pullActionCallback();
				} 
				else 
				{
					if (myScroll) {
						myScroll.destroy();
						$(myScroll.scroller).attr('style', '');
						myScroll = null;
					}
					trigger_myScroll();
				}
			}
		});
	}, 0);
};

function pullUpAction(callback) {
	if ($('#wrapper > #scroller > ul').data('page')) {
		var next_page = parseInt($('#wrapper > #scroller > ul').data('page'), 5) + 1;
	} else {
		var next_page = 2;
	}
	load_content('refresh', next_page);
	$('#wrapper > #scroller > ul').data('page', next_page);
	
	if (callback) {
		callback();
	}
}

function pullActionCallback() {
	if (pullUpEl && pullUpEl.className.match('loading')) {
		$('.pullUp').removeClass('loading').html('');
	}
}

var pullActionDetect = {
	count:0,
	limit:5,
	check:function(count) {
		if (count) {
			pullActionDetect.count = 0;
		}
		setTimeout(function() {
			if (myScroll.y <= (myScroll.maxScrollY + 200) && pullUpEl && !pullUpEl.className.match('loading')) {
				$('.pullUp').addClass('loading').html('<span class="pullUpIcon" style="position:absolute;left:30%">&nbsp;</span><span class="pullUpLabel" style="position:absolute;left:45%">努力加载中...</span>');
				pullUpAction();
			} else if (pullActionDetect.count < pullActionDetect.limit) {
				pullActionDetect.check();
				pullActionDetect.count++;
			}
		}, 200);
	}
}

function trigger_myScroll(offset) {
	pullUpEl = document.querySelector('#wrapper .pullUp');	
	if (pullUpEl) {
		pullUpOffset = pullUpEl.offsetHeight;
	} else {
		pullUpOffset = 0;
	}
	if ($('#wrapper ul > li').length < items_per_page) {
		$('#wrapper .pullUp span').hide();
		offset = 0;
	} else if (!offset) {
		offset = pullUpOffset;
	}
	myScroll = new IScroll('#wrapper', {
		probeType:1, tap:true, click:false, preventDefaultException:{tagName:/.*/}, mouseWheel:true, scrollbars:true, fadeScrollbars:true, interactiveScrollbars:false, keyBindings:false,
		deceleration:0.0002,
		startY:(parseInt(offset)*(-1))
	});
	
	myScroll.on('scrollStart', function () {
		scroll_in_progress = true;
	});
	myScroll.on('scroll', function () {
		scroll_in_progress = true;
		if ($('#wrapper ul > li').length >= items_per_page) {
			pullActionDetect.check(0);
			
		}
	});
	myScroll.on('scrollEnd', function () {
		setTimeout(function() {
			scroll_in_progress = false;
		}, 100);
		if ($('#wrapper ul > li').length >= items_per_page) {
			pullActionDetect.check(0);
		}
	});
	setTimeout(function() {
		$('#wrapper').css({left:0});
	}, 100);
}

function loaded() {
	load_content();
}
document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);

function cancelOrderFunc(orderId)
{
	$.ajax({
		url:"/micro/order.do?method=cancelOrder",
		type:"POST",
		data:"orderId="+orderId,
		success:function(data){
			if(data == "success")
			{
				alert("订单已取消");
				window.location.reload();
			}
			else
			{
				alert("订单取消失败");
			}
		}
	})
}

function getProds(productId)
{
	 var url="/micro/product.do?method=getProduct&productId="+productId+"&busId=100";
	 var openId = $("#openId").val();
	 if(openId=='' || openId==null)
	 {
		  encodeURL(url); 
	 }
	 else
	 {
	 	 window.location.href = url+"&openId="+openId;
	 }
}
