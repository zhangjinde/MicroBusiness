$('.addrUpdateInfo').magnificPopup({
  type: 'inline',
  preloader: false,
  fixedContentPos: false,
  fixedBgPos: true,
  focus: '#name',
  overflowY: 'auto',
  closeBtnInside: true,
  midClick: true,
  removalDelay: 300,
  mainClass: 'my-mfp-zoom-in'
});

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
          var detailId = $('.addrUpdateInfo').attr("value");
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

$('.addrInfo').magnificPopup({
  type: 'inline',
  preloader: false,
  fixedContentPos: false,
  fixedBgPos: true,
  overflowY: 'auto',
  closeBtnInside: true,
  midClick: true,
  removalDelay: 300,
  mainClass: 'my-mfp-zoom-in'
});

$("#saveBtn").on('touchstart',function(){
	alert(1)
});

$("#usaveBtn").on('touchstart',function(){
	
	$.ajax({
		
	});
});

$("#udelBtn").on('touchstart',function(){
	alert(3)
});

$(".gouPic").on('touchstart',function(){
	alert(4)
});

$(".chaPic").on('touchstart',function(){
	alert(5)
});