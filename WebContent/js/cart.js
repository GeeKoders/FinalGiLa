$(function(){

	$('.drag').draggable({
		proxy:'clone',
		revert:true,
		cursor:'auto',
		onStartDrag:function(){
			$(this).draggable('options').cursor='not-allowed';
			$(this).draggable('proxy').addClass('dp');
		},
		onStopDrag:function(){
			$(this).draggable('options').cursor='auto';
		}
	});
	$('#target').droppable({
		// 依會員選擇條件帶入「景點編號」
		accept:'#d1,#d2,#d3,#d4,#d5,#d6,#d7,#d8',
		onDragEnter:function(e,source){
			$(source).draggable('options').cursor='auto';
			$(source).draggable('proxy').css('border','1px solid red');
			$(this).addClass('over');
		},
		onDragLeave:function(e,source){
			$(source).draggable('options').cursor='not-allowed';
			$(source).draggable('proxy').css('border','1px solid #ccc');
			$(this).removeClass('over');
		},
		onDrop:function(e,source){
			$(this).append(source);
			$(this).removeClass('over');
		}
	});
	$('#source').droppable({
		// 依會員選擇條件帶入「景點編號」
		accept:'#d1,#d2,#d3,#d4,#d5,#d6,#d7,#d8',
		onDragEnter:function(e,source){
			$(source).draggable('options').cursor='auto';
			$(source).draggable('proxy').css('border','1px solid red');
			$(this).addClass('over');
		},
		onDragLeave:function(e,source){
			$(source).draggable('options').cursor='not-allowed';
			$(source).draggable('proxy').css('border','1px solid #ccc');
			$(this).removeClass('over');
		},
		onDrop:function(e,source){
			$(this).append(source)
			$(this).removeClass('over');
		}
	});
	// 景點排序；依目前畫面順序
	$('#vp').click(function(){				
		var vp='';
		$('#target div.drag').map(function() {
			vp += this.id+', ';
			return vp;
		});		
		alert('景點排序: '+vp);
	});
	
	$('#showmap').hover(function(){
		$(this).attr('src','images/btn/btn7_on.png');
		$(this).click(function(){
			// window.location.assign("http://tw.yahoo.com");
			// showMap();
			alert('執行 showMap()');
		});
	}, function(){
		$(this).attr('src','images/btn/btn7.png');
	});
	
	$('#doSearch').hover(function(){
		$(this).attr('src','images/btn/btn8_on.png');
	}, function(){
		$(this).attr('src','images/btn/btn8.png');
	});

	$('#package').focus(function(){
		$(this).attr('value','');
	});
	
	$('#vp_list').hover(function(){
		$(this).attr('src','images/btn/btn9_on.png');
		$(this).click(function(){
			// window.location.assign("http://tw.yahoo.com");
			// vp_list();
			alert('執行 vp_list()');
		});
	}, function(){
		$(this).attr('src','images/btn/btn9.png');
	});
		
				
//			$('#login_func').click(function(e) {
// 				$('#apDiv1').css('visibility','visible');
//          });

	$("li a").click(function(){
		$("li a").removeClass("active");
		$(this).toggleClass("active");
	});

	$("li a").click(function(){
		$("li a").css("color","#666");
		$("li a.active").css("color","white");
	});

	$("li a").hover(function(){
			$("li a.active").css("color","white");
			$(this).css("color","black");
		},function(){
			$(this).css("color","#666");
			$("li a.active").css("color","white");
	})

});
