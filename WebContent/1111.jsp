

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>gIRA Home</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection"/>
    <link rel="stylesheet" type="text/css" href="css/nivo-slider.css">
    <link rel="stylesheet" href="images/themes/default/default.css" type="text/css" />
    
    <style type="text/css">
		#wrapper{
			position: relative;
			width: 968px;
			height: 300px;  
			margin: 0 auto;
			padding: 0;
			top: 0;		/* 20px  */
			left: 0;
			background-color: white;
		}
		.slider-wrapper { 
			width: 968px; 
			margin: 0 auto;
		}
		div#news {
			display: block;
			width: 49%;
			height: 240px;
			margin: 0;
			padding: 0;
			float: left;
			background-color: white;
		}
		div#hot {
			display: block;
			width: 49%;
			height: 240px;
			margin: 0;
			padding: 0;
			float: right;
			background-color: white;
		}
		h2 {
			font-family: "微軟正黑體", "新細明體", "標楷體";
			font-size: 18px;
			color: #333;
			margin: 0;
			padding-left: 25px;
		}
		h2.title {
			color: black;
			padding-top: 2px;
			padding-left: 20px;
			background-image:url(images/title.png);
			background-repeat: no-repeat;
			line-height: 34px;
		}
		.more {
			position: relative;
			padding-top: 0px;
			padding-right: 70px;	
			text-align: right;
			color: #999;	
		}

    </style>
    
    <script type="text/javascript">
//      var ary=new Array(8);
//		var tCnt = 0;
//		var sCnt = 8;
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
					// 取得來源 tag 及 id 名稱 
//					var t = source;
//					ary[tCnt] = t.id;					
//					tCnt++;
//					sCnt--;
//					alert(t.tagName + ' ' + t.id);
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

//					var S = source;
//					ary[tCnt]='';
//					tCnt--;
//					sCnt++;
//					alert(S.tagName + ' ' + S.id);

                }
            });
			
			$('#vp').click(function(){				
				var vp='';
				$('#target div.drag').map(function() {
					vp += this.id+', ';
				  	return vp;
				});		
				alert('景點排序: '+vp);
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
    </script>
    
	<script type="text/javascript">
		window.onload = function () {
	
			//當頁面載完之後，用AddressSeleclList.Initialize()，
			//傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
			AddressSeleclList.Initialize('縣市1', '鄉鎮市區1');
	   }
	
	   function show() {
			//取出指定縣市及鄉鎮市區的下拉選單的值
		//	alert(AddressSeleclList.ReturnSelectAddress('縣市1', '鄉鎮市區1'));
			
			var adr = (AddressSeleclList.ReturnSelectAddress('縣市1', '鄉鎮市區1'));
			return adr;
	   }
	   
	   function doSearch(value){
            alert( show() + ", " + value );
       }
	   
    </script>
</head>

<body>
	<!--<div class="result"></div>-->
	<div id="header-wrapper">
    	<div id="title">
            <img src="images/gira.gif" name="logo" width="200" height="100" id="logo" /> &nbsp;&nbsp;
            <!--<a href="login.html">login</a>-->
            <div id="login"><span>
            <%if(session.getAttribute("access")=="Y"){%>
	嗨!<% out.print(session.getAttribute("name")); %> 歡迎來到Gira旅遊網
	<form method="post" action="Logout">
		<input type="submit" value="登出" name="Logout">
	</form>     
<%}else{%>
	嗨!訪客,<a href="login.jsp" style="color:#FCF">登入</a><br>
	還不是會員？<a href="register.jsp" style="color:#FCF">註冊</a>
<%}%>
</span>
            </div>
            <div id="menu">
                <ul>
                    <li id='btn1'><a href="home.jsp"></a></li>
                    <li id='btn2'><a href="viewpoint.jsp"></a></li>
                    <li id='btn3'><a href="plan.jsp"></a></li>
                    <li id='btn4'><a href="cust.jsp"></a></li>
                    <li id='btn5'><a href="package.jsp"></a></li>
                    <li id='btn6'><a href="contact.jsp"></a></li>
                </ul>  
            </div>
   	  	</div>
	</div>

    <div id="wrapper">
        <div class="slider-wrapper theme-default">       
            <div id="slider" class="nivoSlider">
                <a href="http://localhost/home.html"><img src="images/banner/demo/1.jpg" data-thumb="images/banner/demo/1.jpg" alt="" title="" data-transition="" /></a>
                <img src="images/banner/demo/2.jpg" data-thumb="images/banner/demo/2.jpg" alt="" data-transition="slideInLeft" />
                <img src="images/banner/demo/3.jpg" data-thumb="images/banner/demo/3.jpg" alt="" data-transition="slideInLeft" />
                <img src="images/banner/demo/4.jpg" data-thumb="images/banner/demo/4.jpg" alt="" data-transition="slideInRight" />
                <img src="images/banner/demo/5.jpg" data-thumb="images/banner/demo/5.jpg" alt="" data-transition="" />
                <img src="images/banner/demo/6.jpg" data-thumb="images/banner/demo/6.jpg" alt="" data-transition="" />
                <img src="images/banner/demo/7.jpg" data-thumb="images/banner/demo/7.jpg" alt="" data-transition="" />
                <img src="images/banner/demo/8.jpg" data-thumb="images/banner/demo/8.jpg" alt="" data-transition="" />
            </div>
        </div>
    </div>
    <div id="content">
        <div id="news">
            <h2 class="title">最新消息</h2>
    <!--        <br />
            <ul>
                <li><a href="#">2013年台北國際美食節 ..2012/09/26</a></li>
                <li><a href="#">2013年台北國際美食節 ..2012/09/26</a></li>
                <li><a href="#">2013年台北國際美食節 ..2012/09/26</a></li>
                <li><a href="#">2013年台北國際美食節 ..2012/09/26</a></li>
            </ul>
            <p class="more"><a href="#">more...</a></p>
    -->    </div>
        
        <div id="hot">
            <h2 class="title">熱門景點</h2>
        </div>
    </div>
    <div id="footer"> </div>
<!--	
    <div id="apDiv1">
    	<iframe src="#" width="500" height="500" frameborder="5" id="show_func"></iframe>
    </div>
-->
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
		$(window).load(function() {
			$('#slider').nivoSlider();
		});
    </script>
</body>

</html>
