// JavaScript Document
function getLocation() 
{ 
	//检查浏览器是否支持地理位置获取 
	if (navigator.geolocation) { 
		//若支持地理位置获取,成功调用showPosition(),失败调用showError 
		// alert("正在努力获取位置..."); 
		var config = { enableHighAccuracy: true, timeout: 5000, maximumAge: 30000 }; 
		navigator.geolocation.getCurrentPosition(showPosition, showError, config); 
	} else { 
		//alert("Geolocation is not supported by this browser."); 
		alert("定位失败,用户已禁用位置获取权限"); 
	}
} 
/** 
* 获取地址位置成功 
*/ 
function showPosition(position) 
{ 
	//获得经度纬度 
	var x = position.coords.latitude; 
	document.getElementById("xPos").value = x;
	var y = position.coords.longitude; 
	document.getElementById("yPos").value = y;
	//配置Baidu Geocoding API 
	var url = "http://api.map.baidu.com/geocoder/v2/?ak=C93b5178d7a8ebdb830b9b557abce78b&callback=renderReverse&location=" + x + "," + y + 
	"&output=json&pois=0&coordtype=wgs84ll"; 
	$.ajax({
		type: "GET", 
		dataType: "jsonp", 
		url: url, 
		success: function (json) { 
			if (json == null || typeof (json) == "undefined") { 
				return; 
			} 
			if (json.status != "0") { 
				return; 
			} 
			setAddress(json.result.formatted_address); 
		}, 
		error: function (XMLHttpRequest, textStatus, errorThrown) { 
			alert("[x:" + x + ",y:" + y + "]地址位置获取失败,请手动选择地址"); 
		} 
	}); 
} 
/** 
* 获取地址位置失败[暂不处理] 
*/ 
function showError(error) { 
	switch (error.code) 
	{ 
		case error.PERMISSION_DENIED: 
			alert("定位失败,用户拒绝请求地理定位"); 
			//x.innerHTML = "User denied the request for Geolocation.[用户拒绝请求地理定位]" 
			break; 
		case error.POSITION_UNAVAILABLE: 
			alert("定位失败,位置信息是不可用"); 
			//x.innerHTML = "Location information is unavailable.[位置信息是不可用]" 
			break; 
		case error.TIMEOUT: 
			alert("定位失败,请求获取用户位置超时"); 
			//x.innerHTML = "The request to get user location timed out.[请求获取用户位置超时]" 
			break; 
		case error.UNKNOWN_ERROR: 
			alert("定位失败,定位系统失效"); 
			//x.innerHTML = "An unknown error occurred.[未知错误]" 
			break; 
	} 
} 
/** 
* 设置地址 
*/ 
function setAddress(addr) 
{ 
	var position = document.getElementById("addrName"); 
	position.innerHTML = addr; 
	position.style.color = 'black'; 
}

function Rad(d){
	return d * Math.PI / 180.0;//经纬度转换成三角函数中度分表形式。
}
 //计算距离，参数分别为第一点的纬度，经度；第二点的纬度，经度
 function GetDistance(lat1,lng1,lat2,lng2){
     var radLat1 = Rad(lat1);
     var radLat2 = Rad(lat2);
     var a = radLat1 - radLat2;
     var  b = Rad(lng1) - Rad(lng2);
     var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) +
     Math.cos(radLat1)*Math.cos(radLat2)*Math.pow(Math.sin(b/2),2)));
     s = s *6378.137 ;// EARTH_RADIUS;
 	s = Math.round(s * 10000) / 10000; //输出为公里
 //s=s.toFixed(4);
     return s;
 } 
 
 function getPlaceAxisByAddr(addr)
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
		}
	}); 
 }
 
 function setPlaceAxis(obj)
 {
	//获得经度纬度 
	var x = obj.lat; 
	document.getElementById("xPos").value = x;
	var y = obj.lng; 
	document.getElementById("yPos").value = y;
 }