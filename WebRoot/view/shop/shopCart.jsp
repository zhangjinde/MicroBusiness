<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html class="no-js admin responsive-320" lang="zh-CN">
<head>
	<meta charset="utf-8">
	<script type="text/javascript"
	src="http://bam.nr-data.net/1/8ff6e5d792?a=4643704&amp;pl=1433556821932&amp;v=632.2b17625&amp;to=YVNRMRADVhFWV0UIV1gZZhcLTU5QGENQERdfWFcAGkxICkc%3D&amp;ap=38&amp;be=105&amp;fe=269&amp;dc=92&amp;f=%5B%22err%22,%22xhr%22,%22stn%22,%22ins%22%5D&amp;perf=%7B%22timing%22:%7B%22of%22:1433556821932,%22n%22:0,%22u%22:82,%22ue%22:83,%22dl%22:90,%22di%22:197,%22ds%22:197,%22de%22:197,%22dc%22:373,%22l%22:373,%22le%22:376,%22f%22:0,%22dn%22:0,%22dne%22:0,%22c%22:0,%22ce%22:0,%22rq%22:9,%22rp%22:81,%22rpe%22:83%7D,%22navigation%22:%7B%7D%7D&amp;at=TRRSR1gZRR8%3D&amp;jsonp=NREUM.setToken">
	</script>
	<script src="http://js-agent.newrelic.com/nr-632.min.js">
	</script>
	<script src="//hm.baidu.com/hm.js?96801ca9ab090e6db01b2b8377a4e979">
	</script>
	<script type="text/javascript">
	(window.NREUM || (NREUM = {})).loader_config = {
		xpid : "UwQGU15WGwcGUFJVBwU="
	};
	window.NREUM||(NREUM={}),__nr_require=function(t,e,n){function r(n){if(!e[n]){var o=e[n]={exports:{}};t[n][0].call(o.exports,function(e){var o=t[n][1][e];return r(o?o:e)},o,o.exports)}return e[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({QJf3ax:[function(t,e){function n(t){function e(e,n,a){t&&t(e,n,a),a||(a={});for(var c=s(e),f=c.length,u=i(a,o,r),d=0;f>d;d++)c[d].apply(u,n);return u}function a(t,e){f[t]=s(t).concat(e)}function s(t){return f[t]||[]}function c(){return n(e)}var f={};return{on:a,emit:e,create:c,listeners:s,_events:f}}function r(){return{}}var o="nr@context",i=t("gos");e.exports=n()},{gos:"7eSDFh"}],ee:[function(t,e){e.exports=t("QJf3ax")},{}],3:[function(t){function e(t){try{i.console&&console.log(t)}catch(e){}}var n,r=t("ee"),o=t(1),i={};try{n=localStorage.getItem("__nr_flags").split(","),console&&"function"==typeof console.log&&(i.console=!0,-1!==n.indexOf("dev")&&(i.dev=!0),-1!==n.indexOf("nr_dev")&&(i.nrDev=!0))}catch(a){}i.nrDev&&r.on("internal-error",function(t){e(t.stack)}),i.dev&&r.on("fn-err",function(t,n,r){e(r.stack)}),i.dev&&(e("NR AGENT IN DEVELOPMENT MODE"),e("flags: "+o(i,function(t){return t}).join(", ")))},{1:23,ee:"QJf3ax"}],4:[function(t){function e(t,e,n,i,s){try{c?c-=1:r("err",[s||new UncaughtException(t,e,n)])}catch(f){try{r("ierr",[f,(new Date).getTime(),!0])}catch(u){}}return"function"==typeof a?a.apply(this,o(arguments)):!1}function UncaughtException(t,e,n){this.message=t||"Uncaught error with no additional information",this.sourceURL=e,this.line=n}function n(t){r("err",[t,(new Date).getTime()])}var r=t("handle"),o=t(6),i=t("ee"),a=window.onerror,s=!1,c=0;t("loader").features.err=!0,t(5),window.onerror=e;try{throw new Error}catch(f){"stack"in f&&(t(1),t(2),"addEventListener"in window&&t(3),window.XMLHttpRequest&&XMLHttpRequest.prototype&&XMLHttpRequest.prototype.addEventListener&&window.XMLHttpRequest&&XMLHttpRequest.prototype&&XMLHttpRequest.prototype.addEventListener&&!/CriOS/.test(navigator.userAgent)&&t(4),s=!0)}i.on("fn-start",function(){s&&(c+=1)}),i.on("fn-err",function(t,e,r){s&&(this.thrown=!0,n(r))}),i.on("fn-end",function(){s&&!this.thrown&&c>0&&(c-=1)}),i.on("internal-error",function(t){r("ierr",[t,(new Date).getTime(),!0])})},{1:10,2:9,3:7,4:11,5:3,6:24,ee:"QJf3ax",handle:"D5DuLP",loader:"G9z0Bl"}],5:[function(t){t("loader").features.ins=!0},{loader:"G9z0Bl"}],6:[function(t){function e(){}if(window.performance&&window.performance.timing&&window.performance.getEntriesByType){var n=t("ee"),r=t("handle"),o=t(1),i=t(2);t("loader").features.stn=!0,t(3),n.on("fn-start",function(t){var e=t[0];e instanceof Event&&(this.bstStart=Date.now())}),n.on("fn-end",function(t,e){var n=t[0];n instanceof Event&&r("bst",[n,e,this.bstStart,Date.now()])}),o.on("fn-start",function(t,e,n){this.bstStart=Date.now(),this.bstType=n}),o.on("fn-end",function(t,e){r("bstTimer",[e,this.bstStart,Date.now(),this.bstType])}),i.on("fn-start",function(){this.bstStart=Date.now()}),i.on("fn-end",function(t,e){r("bstTimer",[e,this.bstStart,Date.now(),"requestAnimationFrame"])}),n.on("pushState-start",function(){this.time=Date.now(),this.startPath=location.pathname+location.hash}),n.on("pushState-end",function(){r("bstHist",[location.pathname+location.hash,this.startPath,this.time])}),"addEventListener"in window.performance&&(window.performance.addEventListener("webkitresourcetimingbufferfull",function(){r("bstResource",[window.performance.getEntriesByType("resource")]),window.performance.webkitClearResourceTimings()},!1),window.performance.addEventListener("resourcetimingbufferfull",function(){r("bstResource",[window.performance.getEntriesByType("resource")]),window.performance.clearResourceTimings()},!1)),document.addEventListener("scroll",e,!1),document.addEventListener("keypress",e,!1),document.addEventListener("click",e,!1)}},{1:10,2:9,3:8,ee:"QJf3ax",handle:"D5DuLP",loader:"G9z0Bl"}],7:[function(t,e){function n(t){i.inPlace(t,["addEventListener","removeEventListener"],"-",r)}function r(t){return t[1]}var o=(t(1),t("ee").create()),i=t(2)(o),a=t("gos");if(e.exports=o,n(window),"getPrototypeOf"in Object){for(var s=document;s&&!s.hasOwnProperty("addEventListener");)s=Object.getPrototypeOf(s);s&&n(s);for(var c=XMLHttpRequest.prototype;c&&!c.hasOwnProperty("addEventListener");)c=Object.getPrototypeOf(c);c&&n(c)}else XMLHttpRequest.prototype.hasOwnProperty("addEventListener")&&n(XMLHttpRequest.prototype);o.on("addEventListener-start",function(t){if(t[1]){var e=t[1];"function"==typeof e?this.wrapped=t[1]=a(e,"nr@wrapped",function(){return i(e,"fn-",null,e.name||"anonymous")}):"function"==typeof e.handleEvent&&i.inPlace(e,["handleEvent"],"fn-")}}),o.on("removeEventListener-start",function(t){var e=this.wrapped;e&&(t[1]=e)})},{1:24,2:25,ee:"QJf3ax",gos:"7eSDFh"}],8:[function(t,e){var n=(t(2),t("ee").create()),r=t(1)(n);e.exports=n,r.inPlace(window.history,["pushState"],"-")},{1:25,2:24,ee:"QJf3ax"}],9:[function(t,e){var n=(t(2),t("ee").create()),r=t(1)(n);e.exports=n,r.inPlace(window,["requestAnimationFrame","mozRequestAnimationFrame","webkitRequestAnimationFrame","msRequestAnimationFrame"],"raf-"),n.on("raf-start",function(t){t[0]=r(t[0],"fn-")})},{1:25,2:24,ee:"QJf3ax"}],10:[function(t,e){function n(t,e,n){t[0]=o(t[0],"fn-",null,n)}var r=(t(2),t("ee").create()),o=t(1)(r);e.exports=r,o.inPlace(window,["setTimeout","setInterval","setImmediate"],"setTimer-"),r.on("setTimer-start",n)},{1:25,2:24,ee:"QJf3ax"}],11:[function(t,e){function n(){f.inPlace(this,p,"fn-")}function r(t,e){f.inPlace(e,["onreadystatechange"],"fn-")}function o(t,e){return e}function i(t,e){for(var n in t)e[n]=t[n];return e}var a=t("ee").create(),s=t(1),c=t(2),f=c(a),u=c(s),d=window.XMLHttpRequest,p=["onload","onerror","onabort","onloadstart","onloadend","onprogress","ontimeout"];e.exports=a,window.XMLHttpRequest=function(t){var e=new d(t);try{a.emit("new-xhr",[],e),u.inPlace(e,["addEventListener","removeEventListener"],"-",o),e.addEventListener("readystatechange",n,!1)}catch(r){try{a.emit("internal-error",[r])}catch(i){}}return e},i(d,XMLHttpRequest),XMLHttpRequest.prototype=d.prototype,f.inPlace(XMLHttpRequest.prototype,["open","send"],"-xhr-",o),a.on("send-xhr-start",r),a.on("open-xhr-start",r)},{1:7,2:25,ee:"QJf3ax"}],12:[function(t){function e(t){var e=this.params,r=this.metrics;if(!this.ended){this.ended=!0;for(var i=0;c>i;i++)t.removeEventListener(s[i],this.listener,!1);if(!e.aborted){if(r.duration=(new Date).getTime()-this.startTime,4===t.readyState){e.status=t.status;var a=t.responseType,f="arraybuffer"===a||"blob"===a||"json"===a?t.response:t.responseText,u=n(f);if(u&&(r.rxSize=u),this.sameOrigin){var d=t.getResponseHeader("X-NewRelic-App-Data");d&&(e.cat=d.split(", ").pop())}}else e.status=0;r.cbTime=this.cbTime,o("xhr",[e,r,this.startTime])}}}function n(t){if("string"==typeof t&&t.length)return t.length;if("object"!=typeof t)return void 0;if("undefined"!=typeof ArrayBuffer&&t instanceof ArrayBuffer&&t.byteLength)return t.byteLength;if("undefined"!=typeof Blob&&t instanceof Blob&&t.size)return t.size;if("undefined"!=typeof FormData&&t instanceof FormData)return void 0;try{return JSON.stringify(t).length}catch(e){return void 0}}function r(t,e){var n=i(e),r=t.params;r.host=n.hostname+":"+n.port,r.pathname=n.pathname,t.sameOrigin=n.sameOrigin}if(window.XMLHttpRequest&&XMLHttpRequest.prototype&&XMLHttpRequest.prototype.addEventListener&&!/CriOS/.test(navigator.userAgent)){t("loader").features.xhr=!0;var o=t("handle"),i=t(2),a=t("ee"),s=["load","error","abort","timeout"],c=s.length,f=t(1);t(4),t(3),a.on("new-xhr",function(){this.totalCbs=0,this.called=0,this.cbTime=0,this.end=e,this.ended=!1,this.xhrGuids={}}),a.on("open-xhr-start",function(t){this.params={method:t[0]},r(this,t[1]),this.metrics={}}),a.on("open-xhr-end",function(t,e){"loader_config"in NREUM&&"xpid"in NREUM.loader_config&&this.sameOrigin&&e.setRequestHeader("X-NewRelic-ID",NREUM.loader_config.xpid)}),a.on("send-xhr-start",function(t,e){var r=this.metrics,o=t[0],i=this;if(r&&o){var f=n(o);f&&(r.txSize=f)}this.startTime=(new Date).getTime(),this.listener=function(t){try{"abort"===t.type&&(i.params.aborted=!0),("load"!==t.type||i.called===i.totalCbs&&(i.onloadCalled||"function"!=typeof e.onload))&&i.end(e)}catch(n){try{a.emit("internal-error",[n])}catch(r){}}};for(var u=0;c>u;u++)e.addEventListener(s[u],this.listener,!1)}),a.on("xhr-cb-time",function(t,e,n){this.cbTime+=t,e?this.onloadCalled=!0:this.called+=1,this.called!==this.totalCbs||!this.onloadCalled&&"function"==typeof n.onload||this.end(n)}),a.on("xhr-load-added",function(t,e){var n=""+f(t)+!!e;this.xhrGuids&&!this.xhrGuids[n]&&(this.xhrGuids[n]=!0,this.totalCbs+=1)}),a.on("xhr-load-removed",function(t,e){var n=""+f(t)+!!e;this.xhrGuids&&this.xhrGuids[n]&&(delete this.xhrGuids[n],this.totalCbs-=1)}),a.on("addEventListener-end",function(t,e){e instanceof XMLHttpRequest&&"load"===t[0]&&a.emit("xhr-load-added",[t[1],t[2]],e)}),a.on("removeEventListener-end",function(t,e){e instanceof XMLHttpRequest&&"load"===t[0]&&a.emit("xhr-load-removed",[t[1],t[2]],e)}),a.on("fn-start",function(t,e,n){e instanceof XMLHttpRequest&&("onload"===n&&(this.onload=!0),("load"===(t[0]&&t[0].type)||this.onload)&&(this.xhrCbStart=(new Date).getTime()))}),a.on("fn-end",function(t,e){this.xhrCbStart&&a.emit("xhr-cb-time",[(new Date).getTime()-this.xhrCbStart,this.onload,e],e)})}},{1:"XL7HBI",2:13,3:11,4:7,ee:"QJf3ax",handle:"D5DuLP",loader:"G9z0Bl"}],13:[function(t,e){e.exports=function(t){var e=document.createElement("a"),n=window.location,r={};e.href=t,r.port=e.port;var o=e.href.split("://");return!r.port&&o[1]&&(r.port=o[1].split("/")[0].split("@").pop().split(":")[1]),r.port&&"0"!==r.port||(r.port="https"===o[0]?"443":"80"),r.hostname=e.hostname||n.hostname,r.pathname=e.pathname,r.protocol=o[0],"/"!==r.pathname.charAt(0)&&(r.pathname="/"+r.pathname),r.sameOrigin=!e.hostname||e.hostname===document.domain&&e.port===n.port&&e.protocol===n.protocol,r}},{}],14:[function(t,e){function n(t){return function(){r(t,[(new Date).getTime()].concat(i(arguments)))}}var r=t("handle"),o=t(1),i=t(2);"undefined"==typeof window.newrelic&&(newrelic=window.NREUM);var a=["setPageViewName","addPageAction","setCustomAttribute","finished","addToTrace","inlineHit","noticeError"];o(a,function(t,e){window.NREUM[e]=n("api-"+e)}),e.exports=window.NREUM},{1:23,2:24,handle:"D5DuLP"}],"7eSDFh":[function(t,e){function n(t,e,n){if(r.call(t,e))return t[e];var o=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,e,{value:o,writable:!0,enumerable:!1}),o}catch(i){}return t[e]=o,o}var r=Object.prototype.hasOwnProperty;e.exports=n},{}],gos:[function(t,e){e.exports=t("7eSDFh")},{}],handle:[function(t,e){e.exports=t("D5DuLP")},{}],D5DuLP:[function(t,e){function n(t,e,n){return r.listeners(t).length?r.emit(t,e,n):(o[t]||(o[t]=[]),void o[t].push(e))}var r=t("ee").create(),o={};e.exports=n,n.ee=r,r.q=o},{ee:"QJf3ax"}],id:[function(t,e){e.exports=t("XL7HBI")},{}],XL7HBI:[function(t,e){function n(t){var e=typeof t;return!t||"object"!==e&&"function"!==e?-1:t===window?0:i(t,o,function(){return r++})}var r=1,o="nr@id",i=t("gos");e.exports=n},{gos:"7eSDFh"}],G9z0Bl:[function(t,e){function n(){var t=p.info=NREUM.info,e=f.getElementsByTagName("script")[0];if(t&&t.licenseKey&&t.applicationID&&e){s(d,function(e,n){e in t||(t[e]=n)});var n="https"===u.split(":")[0]||t.sslForHttp;p.proto=n?"https://":"http://",a("mark",["onload",i()]);var r=f.createElement("script");r.src=p.proto+t.agent,e.parentNode.insertBefore(r,e)}}function r(){"complete"===f.readyState&&o()}function o(){a("mark",["domContent",i()])}function i(){return(new Date).getTime()}var a=t("handle"),s=t(1),c=(t(2),window),f=c.document,u=(""+location).split("?")[0],d={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-632.min.js"},p=e.exports={offset:i(),origin:u,features:{}};f.addEventListener?(f.addEventListener("DOMContentLoaded",o,!1),c.addEventListener("load",n,!1)):(f.attachEvent("onreadystatechange",r),c.attachEvent("onload",n)),a("mark",["firstbyte",i()])},{1:23,2:14,handle:"D5DuLP"}],loader:[function(t,e){e.exports=t("G9z0Bl")},{}],23:[function(t,e){function n(t,e){var n=[],o="",i=0;for(o in t)r.call(t,o)&&(n[i]=e(o,t[o]),i+=1);return n}var r=Object.prototype.hasOwnProperty;e.exports=n},{}],24:[function(t,e){function n(t,e,n){e||(e=0),"undefined"==typeof n&&(n=t?t.length:0);for(var r=-1,o=n-e||0,i=Array(0>o?0:o);++r<o;)i[r]=t[e+r];return i}e.exports=n},{}],25:[function(t,e){function n(t){return!(t&&"function"==typeof t&&t.apply&&!t[i])}var r=t("ee"),o=t(1),i="nr@wrapper",a=Object.prototype.hasOwnProperty;e.exports=function(t){function e(t,e,r,a){function nrWrapper(){var n,i,s,f;try{i=this,n=o(arguments),s=r&&r(n,i)||{}}catch(d){u([d,"",[n,i,a],s])}c(e+"start",[n,i,a],s);try{return f=t.apply(i,n)}catch(p){throw c(e+"err",[n,i,p],s),p}finally{c(e+"end",[n,i,f],s)}}return n(t)?t:(e||(e=""),nrWrapper[i]=!0,f(t,nrWrapper),nrWrapper)}function s(t,r,o,i){o||(o="");var a,s,c,f="-"===o.charAt(0);for(c=0;c<r.length;c++)s=r[c],a=t[s],n(a)||(t[s]=e(a,f?s+o:o,i,s))}function c(e,n,r){try{t.emit(e,n,r)}catch(o){u([o,e,n,r])}}function f(t,e){if(Object.defineProperty&&Object.keys)try{var n=Object.keys(t);return n.forEach(function(n){Object.defineProperty(e,n,{get:function(){return t[n]},set:function(e){return t[n]=e,e}})}),e}catch(r){u([r])}for(var o in t)a.call(t,o)&&(e[o]=t[o]);return e}function u(e){try{t.emit("internal-error",e)}catch(n){}}return t||(t=r),e.inPlace=s,e.flag=i,e}},{1:24,ee:"QJf3ax"}]},{},["G9z0Bl",4,12,6,5]);</script>
	<meta name="keywords" content="有赞,移动电商服务平台">
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="cleartype" content="on">
	<link rel="dns-prefetch" href="//tj.koudaitong.com/">
	<link rel="dns-prefetch" href="//imgqn.koudaitong.com/">
	<link rel="dns-prefetch" href="//kdt-static.qiniudn.com/">
	<link rel="shortcut icon"
	href="http://kdt-static.qiniucdn.com/v2/image/yz_fc.ico">
	<title>购物车</title>

	<script>
	var _global = {
		"kdt_id" : "1836140",
		"user_id" : 0,
		"run_mode" : "online",
		"debug" : false,
		"project" : "default",
		"online_debug" : false,
		"js" : {
			"js_compress" : true,
			"css_compress" : true,
			"use_js_cdn" : true,
			"use_css_cdn" : true,
			"message_report" : true,
			"checkbrowser" : true,
			"hide_wx_nav" : true,
			"qn_public" : "kdt_img",
			"qn_private" : "kdt-private"
		},
		"query_path" : "\/trade\/cart",
		"query_key" : "kdt_id=1836140&spm=g27775159_h1818292_g27775156",
		"real_query_path" : "get:\/trade\/cart\/index.html",
		"module" : "trade",
		"controller" : "Trade_Cart_Controller",
		"action" : "index",
		"full_action" : "getIndexHtml",
		"method" : "get",
		"format" : "html",
		"platform" : "mobile",
		"is_mobile" : true,
		"authorize" : "unknown",
		"platform_version" : "",
		"mobile_system" : "ios",
		"isFromShare" : false,
		"page_size" : 320,
		"isShopDomain" : false,
		"share" : {
			"notShare" : true
		},
		"jsBradgeSupport" : true,
		"wuxi1_0_0" : false,
		"source" : "",
		"track" : "",
		"nobody" : "g19r93f8cj9mu5r5gsks5c0jm1",
		"mp_changed" : false,
		"team_certificate" : false,
		"is_secured_transactions" : 0,
		"hide_shopping_cart" : 0,
		"mp_data" : {
			"logo" : "http:\/\/imgqn.koudaitong.com\/upload_files\/shop2.png",
			"team_name" : "Lapland_Alone",
			"intro" : "",
			"is_display_footbar" : "1",
			"is_display_suffix_name" : "1",
			"suffix_name" : "Lapland_Alone",
			"shopping_cart_style" : "1",
			"team_type" : "youzan",
			"team_physical" : 0
		},
		"wxpay_big" : false,
		"alipay_env" : true,
		"wxpay_env" : false,
		"wxaddress_env" : false,
		"is_owner_team" : true,
		"weixin_jssdk_use" : 0,
		"fans_id" : 0,
		"is_fans" : 2,
		"fans_nickname" : "",
		"fans_type" : 0,
		"fans_token" : "",
		"mp_id" : 0,
		"fans_picture" : "",
		"proxy_fans_id" : 0,
		"youzan_fans_id" : 0,
		"youzan_fans_nickname" : "",
		"youzan_fans_picture" : "",
		"no_user_login" : false,
		"buyer_id" : 0,
		"change_password_url" : "http:\/\/wap.koudaitong.com\/v2\/buyer\/auth\/changepassword?redirect_uri=http%3A%2F%2Fwap.koudaitong.com%2Fv2%2Ftrade%2Fcart%3Fkdt_id%3D1836140%26spm%3Dg27775159_h1818292_g27775156",
		"buyer" : {
			"id" : 0,
			"phone" : ""
		},
		"open_token" : [],
		"need_ajax_login" : true,
		"directSeller" : {
			"seller" : "",
			"is_display_directseller_button" : false
		},
		"spm" : {
			"logType" : "sc",
			"logId" : "1836140"
		},
		"url" : {
			"base" : "http:\/\/koudaitong.com",
			"bbs" : "http:\/\/bbs.youzan.com",
			"cdn" : "http:\/\/kdt-static.qiniucdn.com\/",
			"cdn_static" : "http:\/\/kdt-static.qiniucdn.com\/v2",
			"cp" : "http:\/\/cp.koudaitong.com",
			"daxue" : "http:\/\/xt.youzan.com",
			"fenxiao" : "http:\/\/fx.youzan.com",
			"fuwu" : "http:\/\/fuwu.youzan.com",
			"img" : "http:\/\/img.koudaitong.com",
			"imgqn" : "http:\/\/imgqn.koudaitong.com",
			"login" : "http:\/\/login.youzan.com",
			"open" : "\/\/open.koudaitong.com",
			"static" : "http:\/\/static.koudaitong.com\/v2",
			"trade" : "http:\/\/trade.koudaitong.com",
			"v1" : "http:\/\/koudaitong.com\/v1",
			"v1_static" : "http:\/\/static.koudaitong.com\/v1",
			"v2" : "http:\/\/koudaitong.com\/v2",
			"wap" : "http:\/\/wap.koudaitong.com\/v2",
			"ws" : "ws:\/\/im.koudaitong.com:83",
			"www" : "http:\/\/koudaitong.com\/v2",
			"youzan" : "http:\/\/youzan.com",
			"matrix" : "http:\/\/cp.qima-inc.com"
		}
	};
	function _cdnFallback(n) {
		if(!_cdnFb){var i=n.src;(new Image).src="//tj.koudaitong.com/1.gif?net_error=1&fileurl="+i,-1===window.location.href.indexOf("fenxiao/active/index")&&(motify.error("啊哦，有东西加载失败了，刷新下试试~"),_cdnFb=!0)}}function onReady(n,i){if(i){var o=function(){window[n]?i():setTimeout(function(){o(n,i)},1e3)};o(n,i)}}window.motify=window.motify||{},window.motify.error=function(n){document.body.insertAdjacentHTML("afterbegin",'<div class="common-error-tips c-red clearfix font-size-12"><a class="btn btn-white pull-right" onclick="location.reload();">刷新</a><p>'+n+"</p></div>")};var _cdnFb=!1;
		</script>

		<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet"
		href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/base_2ced031129.css"
		onerror="_cdnFallback(this)">
		<link rel="stylesheet"
		href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/projects/trade_626cf27050.css"
		onerror="_cdnFallback(this)">
		<link rel="stylesheet"
		href="http://kdt-static.qiniucdn.com/v2/build_css/stylesheets/wap/pages/trade/cart_579e7a1291.css"
		onerror="_cdnFallback(this)">
	</head>

	<body class=" body-fixed-bottom">


		<div class="container ">
			<div class="content clearfix" style="min-height: 480px;">

				<div class="tabber  tabber-n3 tabber-double-11 clearfix">
					<a class="active"
					href="http://wap.koudaitong.com/v2/trade/cart?source=&amp;kdt_id=1836140">购物车</a>
					<a class=""
					href="http://wap.koudaitong.com/v2/trade/record/index?source=&amp;kdt_id=1836140">购物记录</a>
					<a class=""
					href="http://wap.koudaitong.com/v2/trade/record/backs?source=&amp;kdt_id=1836140">我的返现</a>
				</div>

				<div id="cart-container" class="block block-order">
					<div class="header js-list-header">
						<span>店铺：Lapland_Alone</span>
						<a href="javascript:;"
						class="j-edit-list pull-right c-blue font-size-12 edit-list">编辑</a>
					</div>
					<ul class="list block block-list block-list-cart block-border-none">
						<li class="block-item block-item-cart relative clearfix">
							<div class="check-container
							
							">
							<span class="check
							
							checked
							"></span>
						</div>
						<div class="name-card name-card-3col clearfix">
							<a href="/v2/showcase/goods?alias=1k9bo134" class="thumb"><img
								src="http://imgqn.koudaitong.com/upload_files/2015/01/18/FpGfdfeFb5johAnMroza-CIGDiWb.png!100x100.jpg">
							</a>
							<div class="detail">
								<a href="/v2/showcase/goods?alias=1k9bo134">
									<h3 class="js-ellipsis"
									style="height: 32px; overflow: hidden;">
									<i>宫爆鸡丁炒菜，米饭需单独购买 - 测试商品，不发货，不退款</i>
								</h3> </a>
								<p class="ellipsis">




								</p>
							</div>
							<div class="right-col price-num">
								<div class="price">
									￥
									<span>0.01</span>
								</div>

								<div class="num">
									×
									<span class="num-txt">1</span>
								</div>

								<div class="error-box"></div>
							</div>
						</div>
						<div class="delete-btn">
							<span>删除</span>
						</div>

					</li>
				</ul>
				<div class="js-bottom-opts bottom-fix" style="padding: 0;">
					<div class="bottom-cart clear-fix">
						<div class="select-all checked">
							<span class="check checked"></span>全选
						</div>
						<div class="total-price">
							合计：
							<span class="js-total-price">0.01</span>元
						</div>
						<button href="javascript:;"
						class="js-go-pay btn btn-orange-dark font-size-14">
						结算(1)
					</button>
					<button href="javascript:;"
					class="j-delete-goods btn font-size-14 btn-red hide"
					disabled="true">
					删除
				</button>
			</div>
		</div>
	</div>
</div>
<div class="footer">
	<textarea id="footer-delay" style="display: none;">	&lt;div class="footer"&gt;
		&lt;div class="copyright"&gt;
		&lt;div class="ft-copyright"&gt;
		&lt;a href="http://m.youzan.com" target="_blank"&gt;华莱士提供技术支持&lt;/a&gt;
		&lt;/div&gt;
		&lt;/div&gt;
		&lt;/div&gt;
	</textarea>
	<div class="footer">
		<div class="copyright">
			<div class="ft-copyright">
				<a href="http://m.youzan.com" target="_blank">华莱士提供技术支持</a>
			</div>
		</div>
	</div>
</div>
</div>

<script
src="http://kdt-static.qiniucdn.com/v2/build/wap/common_452e0e827f.js"
onerror="_cdnFallback(this)">
</script>
<script
src="http://kdt-static.qiniucdn.com/v2/build/wap/base_ffeae21149.js"
onerror="_cdnFallback(this)">
</script>

<script src="http://kdt-static.qiniucdn.com/v2/vendor/underscore.js"
onerror="_cdnFallback(this)">
</script>
<script src="http://kdt-static.qiniucdn.com/v2/vendor/backbone.js"
onerror="_cdnFallback(this)">
</script>
<script
src="http://kdt-static.qiniucdn.com/v2/build/wap/trade/cart_89b37b50b2.js"
onerror="_cdnFallback(this)">
</script>
<script>
var _hmt = _hmt || [];
(function() {
	var hm = document.createElement("script");
	hm.src = "//hm.baidu.com/hm.js?96801ca9ab090e6db01b2b8377a4e979";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);
})();
</script>
<script type="text/javascript">
window.NREUM || (NREUM = {});
NREUM.info = {
	"beacon" : "bam.nr-data.net",
	"licenseKey" : "8ff6e5d792",
	"applicationID" : "4643704",
	"transactionName" : "YVNRMRADVhFWV0UIV1gZZhcLTU5QGENQERdfWFcAGkxICkc=",
	"queueTime" : 0,
	"applicationTime" : 38,
	"atts" : "TRRSR1gZRR8=",
	"errorBeacon" : "bam.nr-data.net",
	"agent" : "js-agent.newrelic.com\/nr-632.min.js"
}</script>
</body>
</html>