var scrWidth = $(".admin").width();
if(scrWidth != ""||scrWidth != null)
{
	if(scrWidth<=320)
	{
	 	scrWidth=320;
	}
	else if(scrWidth>320&&scrWidth<=400)
	{
	  	scrWidth=360;
	}
	else if(scrWidth>400&&scrWidth<=540)
	{
	  	scrWidth=540;
	}
	else if(scrWidth>540)
	{
	  	scrWidth=800;
	}
	$(".admin").addClass("responsive-"+scrWidth);
}

function setCookie(name,value){
var Days = 30;
var exp = new Date(); 
exp.setTime(exp.getTime() + Days*24*60*60*1000);
document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

function getCookie(name){
var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
if(arr=document.cookie.match(reg)) return unescape(arr[2]);
else return null;
}

function delCookie(name){
var exp = new Date();
exp.setTime(exp.getTime() - 1);
var cval=getCookie(name);
if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

function encodeURL(url)
{
	var str=encodeURIComponent(url);
	var urls= "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx9de1544a58642739&redirect_uri="+str+"&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
	window.location.href = urls;
}

function weixinPayFunc()
{
	
}
