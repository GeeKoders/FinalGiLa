<?php
	$id = $_GET['ID'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>gIRA Home</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection"/>
    <link rel="stylesheet" type="text/css" href="css/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/icon.css">
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/map.js"></script>
    <style type="text/css">
        .drag{
            width:160px;
            height:200px;
            padding:10px;
            margin:10px;
            border:1px solid #ccc;
            /*background:#AACCFF;*/
			background-image: url(images/item/photo_bg.gif);
			background-repeat: no-repeat;
			background-position: top center;
			float: left;
        }
        .dp{
            opacity:0.5;
            filter:alpha(opacity=50);
        }
        .over{
            /*background:#FBEC88;*/
			/*background-image: url(images/notes.gif);*/
			/*background-repeat: no-repeat;*/
        }
		#tt {
			position: relative;
			top: -35px;
			left: 368px;
			padding: 0;
			margin: 0;
			z-index: 1000000;
		}
		#apDiv1 {
			position: absolute;
			left: 300px;
			top: 126px;
			width: 500px;
			height: 500px;
			z-index: 1000001;
			visibility: hidden;
		}
		#login_func {
			
		}
    </style>
    <script type="text/javascript">
//      var ary=new Array(4);
//		var tCnt = 0;
//		var sCnt = 4;
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
//					 alert(t.tagName + ' ' + t.id);
        			// $('div#d4').html('景點 4<img src="images/item/4.jpg" width="160">').show();
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
//			$('#login_func').click(function(e) {
// 				$('#apDiv1').css('visibility','visible');
//          });

        });
    </script>
	<script type="text/javascript">
//		$(function(){
//			var qsParm = new Array();
//			function qs() {
//				var query = window.location.search.substring(1);
//				var parms = query.split('&');
//				for (var i=0; i < parms.length; i++) {
//					var pos = parms[i].indexOf('=');
//					if (pos > 0) {
//						var key = parms[i].substring(0, pos);
//						var val = parms[i].substring(pos + 1);
//						qsParm[key] = val;
//					}
//				}
//			}
//			
//			$('.result').html('<h1>'+qsParm[key]+'</h1>');
//			
//		});
    </script>

</head>

<body>
	<div class="result"><?php echo "<h1>".$id."</h1>"; ?></div>
	<div id="header-wrapper">
      <div id="title">
            <img src="images/gira.gif" id="logo" /> &nbsp;&nbsp;
            <a href="login.html">login</a>
                       
      </div>
</div>
<!--    
	<div id="page-wrap"></div>
-->
<div id="content">
        <div id="tw_map">
          <img src="images/map/map.gif" alt="Taiwan" width="298" height="228" usemap="#map" id="map" border="0" />
          <map name="map" id="map">
            <area id="map1" data-name="基隆市" shape="poly" coords="214,22,211,17,208,20,213,23" href="#" />
            <area id="map2" data-name="台北市" shape="poly" coords="207,28,201,26,199,19,204,15,208,27" href="#" />
            <area id="map3" data-name="新北市" shape="poly" coords="223,26,221,20,215,20,203,9,199,9,194,16,188,19,194,26,189,29,189,37,194,36,196,43,197,47,202,45,203,39,208,39,212,35,214,35,223,27" href="#" />
            <area id="map4" data-name="桃園縣" shape="poly" coords="188,19,178,23,171,29,175,34,178,35,181,38,186,42,186,46,189,47,191,53,196,48,194,37,189,37,189,29,194,26,188,19" href="#" />
            <area id="map5" data-name="新竹縣" shape="poly" coords="172,30,186,43,186,46,188,48,192,53,192,57,188,62,184,63,181,58,174,58,173,51,168,45,163,44,166,34,172,31" href="#" />
            <area id="map6" data-name="苗栗縣" shape="poly" coords="164,44,173,50,174,59,181,58,184,62,183,65,176,69,172,71,167,69,163,71,159,71,150,63,153,54,158,49,164,46" href="#" />
            <area id="map7" data-name="宜蘭縣" shape="poly" coords="217,33,217,46,219,55,216,61,214,65,213,71,206,68,203,71,198,69,193,67,188,63,189,59,192,56,193,52,196,48,202,46,203,40,208,39,217,32" href="#" />
            <area id="map8" data-name="花蓮縣" shape="poly" coords="214,71,207,78,206,81,205,85,204,88,205,92,197,125,191,131,186,145,181,141,175,137,171,132,171,127,171,120,177,121,177,118,183,116,182,107,181,103,185,97,185,91,186,87,190,84,187,80,189,77,195,69,202,70,206,68,215,71" href="#" />
            <area id="map9" data-name="台中市" shape="poly" coords="196,69,188,63,185,63,178,69,171,70,168,69,164,71,159,71,150,62,148,65,147,69,145,71,142,74,141,79,144,84,147,84,150,87,155,90,161,85,167,83,178,78,181,76,186,76,191,76,195,70" href="#" />
            <area id="map10" data-name="彰化縣" shape="poly" coords="139,78,137,84,134,89,131,94,128,100,129,104,134,103,136,103,138,104,141,104,147,105,149,103,148,99,149,96,151,91,149,88,145,85,141,81,139,77" href="#" />
            <area id="map11" data-name="南投縣" shape="poly" coords="188,77,180,77,173,81,167,84,161,85,156,88,150,91,148,99,148,103,150,106,148,112,150,116,155,116,160,117,160,123,165,125,170,125,173,122,177,122,178,119,183,118,182,110,182,105,184,101,185,98,184,93,185,90,189,87,190,84,188,80,188,77" href="#" />
            <area id="map12" data-name="雲林縣" shape="poly" coords="127,100,124,106,121,112,120,118,124,121,129,119,135,114,140,114,144,116,147,116,153,117,153,115,149,112,150,107,150,103,145,103,137,102,130,101,128,99" href="#" />
            <area id="map13" data-name="嘉義縣" shape="poly" coords="165,124,160,122,160,117,152,116,143,116,136,114,126,120,119,120,121,127,120,133,124,134,129,130,136,128,141,131,141,137,147,139,152,135,157,133,161,129,165,125" href="#" />
            <area id="map14" data-name="台南市" shape="poly" coords="119,133,116,140,116,146,113,148,117,151,120,155,121,159,127,160,133,159,137,157,139,152,143,150,147,147,149,139,143,138,141,133,137,128,132,128,124,133,119,132" href="#" />
            <area id="map15" data-name="高雄市" shape="poly" coords="170,124,165,124,160,130,153,135,148,137,148,142,144,150,139,153,137,157,129,160,121,159,123,165,126,170,126,174,127,179,134,185,137,178,136,171,138,166,145,165,150,163,157,163,161,163,160,158,163,150,162,146,163,140,169,136,172,134,170,124,172,129,170,125" href="#" />
            <area id="map16" data-name="台東縣" shape="poly" coords="197,126,196,132,192,137,192,144,191,146,185,157,180,164,179,169,172,174,170,177,167,185,164,191,162,196,162,202,156,193,156,188,154,182,158,175,163,173,163,168,160,163,161,154,162,147,164,141,171,134,175,138,181,141,186,145,189,135,196,126" href="#" />
            <area id="map17" data-name="屏東縣" shape="poly" coords="135,184,136,177,137,169,140,167,148,164,156,163,160,163,163,167,163,173,158,176,155,181,155,186,156,193,158,199,162,202,162,207,162,214,159,220,153,217,153,212,152,203,149,198,140,189,134,184" href="#" />
            <area id="map18" data-name="澎湖" shape="poly" coords="83,156,87,150,92,146,98,139,105,139,103,132,97,128,98,122,100,118,95,115,91,123,85,127,80,135,83,139,89,137,91,141,84,146,78,151,80,157" href="#" />
            <area id="map19" data-name="金門" shape="poly" coords="98,56,108,56,117,55,117,46,112,44,107,46,101,45,98,52,96,56" href="#" />
  		</map>          
  	</div>
        
  	<div id="google_map">
  		<iframe width="500" height="500" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
            src="https://maps.google.com.tw/maps?f=q&amp;source=s_q&amp;hl=zh-TW&amp;geocode=&amp;q=%E5%8F%B0%E5%8C%97%E5%B8%82%E5%A3%AB%E6%9E%97%E5%8D%80&amp;aq=&amp;sll=23.48575,119.49965&amp;sspn=5.761725,6.04248&amp;brcurrent=3,0x3442ae741e185a49:0x8c8db93eb1d0d2b6,0,0x3442ac6b61dbbd9d:0xc0c243da98cba64b&amp;ie=UTF8&amp;hq=&amp;hnear=%E5%8F%B0%E5%8C%97%E5%B8%82%E5%A3%AB%E6%9E%97%E5%8D%80&amp;ll=25.0833,121.517&amp;spn=0.355721,0.377655&amp;t=m&amp;z=11&amp;iwloc=A&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com.tw/maps?f=q&amp;source=embed&amp;hl=zh-TW&amp;geocode=&amp;q=%E5%8F%B0%E5%8C%97%E5%B8%82%E5%A3%AB%E6%9E%97%E5%8D%80&amp;aq=&amp;sll=23.48575,119.49965&amp;sspn=5.761725,6.04248&amp;brcurrent=3,0x3442ae741e185a49:0x8c8db93eb1d0d2b6,0,0x3442ac6b61dbbd9d:0xc0c243da98cba64b&amp;ie=UTF8&amp;hq=&amp;hnear=%E5%8F%B0%E5%8C%97%E5%B8%82%E5%A3%AB%E6%9E%97%E5%8D%80&amp;ll=25.0833,121.517&amp;spn=0.355721,0.377655&amp;t=m&amp;z=11&amp;iwloc=A"
             style="color:#0000FF;text-align:right">顯示詳細地圖</a></small>        </div> 
    </div>
    
    <!-- 景點購物車操作區塊 -->               
    <div id="cart">
       	<!-- 依會員選擇條件帶入「景點項目」 -->
        <div id="source">
        
            <div id="d1" class="drag">
                <img src="images/item/1.jpg" width="160" />
            	<p>景點 1</p>
            </div>
            <div id="d2" class="drag">
                <img src="images/item/2.jpg" width="160" />
            	<p>景點 2</p>
            </div>
            <div id="d3" class="drag">
                <img src="images/item/3.jpg" width="160" />
            	<p>景點 3</p>
            </div>
            <div id="d4" class="drag">
                <img src="images/item/4.jpg" width="160" />
            	<p>景點 4</p>
            </div>
            <div id="d5" class="drag">
                <img src="images/item/5.jpg" width="160" />
            	<p>景點 5</p>
            </div>
            <div id="d6" class="drag">
                <img src="images/item/6.jpg" width="160" />
            	<p>景點 6</p>
            </div>
            <div id="d7" class="drag">
                <img src="images/item/7.jpg" width="160" />
            	<p>景點 7</p>
            </div>
            <div id="d8" class="drag">
                <img src="images/item/8.jpg" width="160" />
            	<p>景點 8</p>
            </div>
        </div>
            
   		<div id="plan">
        	<!-- 依會員輸入帶入「行程名稱」 -->
       	  <div id="plan_title">
            	<h2>行程名稱：台北一日遊</h2>
            </div>
        	<!-- 景點購物車 -->
            <div id="target"> </div>
        </div>
            
    </div>
    
    <div id="footer"> </div>
<!--	
    <div id="apDiv1">
    	<iframe src="#" width="500" height="500" frameborder="5" id="show_func"></iframe>
    </div>
-->
</body>

</html>
