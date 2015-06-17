var curCustDetId = null;

$(document).ready(function(){
	var custAddr = $("#custAddr").html();
	getPlaceAxisByAddr(custAddr,"setAxis");

});

function setAxis()
{
	var busId = $("#busId").val();
	var xPos = $("#xPos").val();
	var yPos = $("#yPos").val();
	$.ajax({
		url:"/micro/pay.do?method=getBusinessAxis",
		type:"POST",
		data:"xPos="+xPos+"&yPos="+yPos+"&busId="+busId,
		success:function(data){
			var dataObj = null;
			try{
				dataObj = eval("("+data+")");
			}catch(e){
				
			}
			if(dataObj != null)
			{
				$("#busInfo").val(dataObj.busDetailId);
			}
		}
	});
}

$('#selectAddr').magnificPopup({
  type: 'inline',
  preloader: false,
  fixedContentPos: false,
  fixedBgPos: true,
  overflowY: 'auto',
  closeBtnInside: true,
  midClick: true,
  removalDelay: 300,
  mainClass: 'my-mfp-zoom-in',
  callbacks: {
  	change: function() {
  	  if($.magnificPopup.instance.currItem.src == "#updateAddrForm")
  	  {
      	  if($(window).width() < 700) {
            this.st.focus = false;
          } else {
            this.st.focus = '#name';
          }
          var win = $.magnificPopup.instance.content;
          var detailId = curCustDetId;
          $("#uprovince",win).val($("#provId"+detailId).val());
          $("#uprovince",win).change(function(){
          	areaChange(this,'ucity',win);
          });
          $("#uprovince",win).change();
          $("#uname",win).val($("#customerName"+detailId).val());
          $("#uphonenum",win).val($("#customerTelephone"+detailId).val());
          $("#ucity",win).val($("#cityId"+detailId).val());
          $("#ucity",win).change(function(){
          	areaChange(this,'udistrict',win);
          });
          $("#ucity",win).change();
          $("#udistrict",win).val($("#districtId"+detailId).val());
          $("#uaddress",win).val($("#customerAddress"+detailId).val());
          $("#upostCode",win).val($("#customerPostcode"+detailId).val());
  	  }
    }
  }
});

$("#saveBtn").on('touchstart',function(){
	var name = $("#name").val();
	var phonenum = $("#phonenum").val();
	var province = $("#province").val();
	var city = $("#city").val();
	var district = $("#district").val();
	var address = $("#address").val();
	var postCode = $("#postCode").val();
	var customerId = $(".customerId").val();
	var orderId = $("#orderId").val();
	var provName = $("#province").get(0).options[$("#province").get(0).selectedIndex].innerHTML;
	var cityName = $("#city").get(0).options[$("#city").get(0).selectedIndex].innerHTML;
	var distName = $("#district").get(0).options[$("#district").get(0).selectedIndex].innerHTML;
	if(name == "")
	{
		alert("收货人不能为空");
		$("#name").focus();
	}
	else if(phonenum == "")
	{
		alert("联系电话不能为空");
		$("#phonenum").focus();
	}
	else if(province == "")
	{
		alert("请先选择省份");
		$("#province").focus();
	}
	else if(city == "")
	{
		alert("请先选择城市");
		$("#city").focus();
	}
	else if(district == "")
	{
		alert("请先选择区县");
		$("#district").focus();
	}
	else if(address == "")
	{
		alert("详细地址不能为空");
		$("#address").focus();
	}
	else
	{
		$.ajax({
			url:"/micro/user.do?method=saveCustomer",
			type:"POST",
			data:"orderId="+orderId+"&customerId="+customerId+"&customerName="+name+"&customerPhone="+phonenum+"&provId="+province+"&cityId="+city+"&districtId="+district+"&addr="+address+"&postCode="+postCode+"&provName="+encodeURI(provName)+"&cityName="+encodeURI(cityName)+"&distName="+encodeURI(distName),
			success:function(data){
				if(data == "success")
				{
					$.magnificPopup.instance.close();
					window.location.reload();
				}
				else
				{
					alert("新增收货信息失败");
				}
			}
		});
	}
});

$("#usaveBtn").on('touchstart',function(){
	var customerId = $(".customerId").val();
	var customerName = $("#uname").val();
	var customerTelephone = $("#uphonenum").val();
	var provId = $("#uprovince").val();
	var cityId = $("#ucity").val();
	var districtId = $("#udistrict").val();
	var customerAddress = $("#uaddress").val();
	var customerPostcode = $("#upostCode").val();
	var orderId = $("#orderId").val();
	var provName = $("#uprovince").get(0).options[$("#uprovince").get(0).selectedIndex].innerHTML;
	var cityName = $("#ucity").get(0).options[$("#ucity").get(0).selectedIndex].innerHTML;
	var distName = $("#udistrict").get(0).options[$("#udistrict").get(0).selectedIndex].innerHTML;
	$.ajax({
		url:"/micro/user.do?method=updateCustomer",
		type:"POST",
		data:"orderId="+orderId+"&customerId="+customerId+"&customerDetailId="+curCustDetId+"&customerName="+encodeURI(customerName)+"&customerPhone="+customerTelephone+"&provId="+provId+"&cityId="+cityId+"&districtId="+districtId+"&addr="+encodeURI(customerAddress)+"&postCode="+customerPostcode+"&provName="+encodeURI(provName)+"&cityName="+encodeURI(cityName)+"&distName="+encodeURI(distName),
		success:function(data){
			if(data == "success")
			{
				$.magnificPopup.instance.close();
				window.location.reload();
			}
			else
			{
				alert("修改收货信息失败");
			}
		}
	});
});

$("#udelBtn").on('touchstart',function(){
	var customerId = $(".customerId").val();
	$.ajax({
		url:"/micro/user.do?method=delCustomer",
		type:"POST",
		data:"customerId="+customerId+"&customerDetailId="+curCustDetId,
		success:function(data){
			if(data == "success")
			{
				$.magnificPopup.instance.close();
				window.location.reload();
			}
			else
			{
				if(data != "failure")
				{
					alert(data);				
				}
				else
				{
					alert("删除收货信息失败");
				}
			}
		}
	});
});

$(".gouPic").on('touchstart',function(){
	setOrderAddr($(this).attr("value"));
});

$(".chaPic").on('touchstart',function(){
	setOrderAddr($(this).attr("value"));
});

function setOrderAddr(customerDetailId)
{
	var orderId = $("#orderId").val();
	var customerId = $(".customerId").val();
	$.ajax({
		url:"/micro/pay.do?method=setOrderAddr",
		type:"POST",
		data:"orderId="+orderId+"&customerId="+customerId+"&customerDetailId="+customerDetailId,
		success:function(data){
			if(data == "success")
			{
				$.magnificPopup.instance.close();
				window.location.reload();
			}
			else
			{
				alert(data);
			}
		}
	})
}

$(".addrInfo").on('touchstart',function(){
	$.magnificPopup.open({
	  type: 'inline',
	  preloader: false,
	  fixedContentPos: false,
	  fixedBgPos: true,
	  overflowY: 'auto',
	  closeBtnInside: true,
	  midClick: true,
	  removalDelay: 300,
	  mainClass: 'my-mfp-zoom-in',
	  items:{
		src:"#receiveAddrForm"
	  }
	}, 0);
});

$(".addrUpdateInfo").on('touchstart',function(){
	curCustDetId = $(this).attr("value");
	$.magnificPopup.open({
	  type: 'inline',
	  preloader: false,
	  fixedContentPos: false,
	  fixedBgPos: true,
	  focus: '#name',
	  overflowY: 'auto',
	  closeBtnInside: true,
	  midClick: true,
	  removalDelay: 300,
	  mainClass: 'my-mfp-zoom-in',
	  items:{
		src:"#updateAddrForm",
	  }
	}, 0);
});