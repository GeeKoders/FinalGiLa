<%-- 
    Document   : index
    Created on : 2013/7/30, 下午 10:30:58
    Author     : Administrator
--%>




<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false"%>
<%@page import="java.util.*" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <style>
        #infoWindo{
            width:250px ;
            text-align: justify;
        }
        
        
    </style>
    <head>
        
      
        <title>JSP Page</title>
         <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAA1j86tnUDFv8OAtC8dZVtKRT8YXSkg32FmSueYimfV_yj5DJguRRW5eQHwEBk10jwkDxLKNltT_kuQA" type="text/javascript"></script>
<%@include file="viewpoint.html"%>

    </head>
    <body onload="initialize()" >
   	 
     
       

                        <%
                            //將資料庫的座標資料取出
                            String str="" ; 
                            StringBuffer sb = (StringBuffer) request.getAttribute("coodStr");
                            //out.println(sb);
                            //將使用者選取的地區取出
                            String strArea = request.getParameter("area");
                            try {
                                List<String> list = (List<String>) request.getAttribute("divStr");
                                for (String item : list) {
                                 str+=item ;
                                }
                            } catch (Exception e) {
                            }
                        %>
                  

                       
                        <script>document.getElementById("show_vp").setAttribute("height","2000").val()</script> 
                       <script>document.getElementById("source").innerHTML='<%=str%>'</script>
                       
                        </body> 

                        </html>
                       
          <script type="text/javascript">

        var map;
        //將Array資料從JSP中塞入至JS


        var myIcon = new Array(arr.length);
        //建立myIcon的物件陣列
        for (var i = 0; i < myIcon.length; i++)
        {
            myIcon[i] = new Array();
        }
        //創建一個自定義的GIcon	
        for (var i = 0; i < myIcon.length; i++)
        {
            myIcon[i] = new GIcon();
        }
        //建立前景圖片
        for (var i = 0; i < myIcon.length; i++)
        {
            myIcon[i].image = '0' + (i + 1) + '.jpg';
        }
        //前景圖片大小，長x寬
        for (var i = 0; i < myIcon.length; i++)
        {
            myIcon[i].iconSize = new GSize(48, 80);
        }

        //陰影圖片大小，長x寬
        //myIcon.shadowSize = new GSize(12, 20);

        //以下兩個屬性很難解釋，讀者可自行調整其數值以便理解其意義
        // myIcon錨定點相對於myIcon圖片左上角的像素距離
        //    for (var i = 0; i < arr.length; i++)
        //    {
        //        for (var j = 0; j < 1; j++)
        //        {
        //            myIcon[i].iconAnchor = new GLatLng(arr[i][j], arr[i][j + 1]);
        //        }
        //    }


        //初始化GM地圖
        function initialize() {
            if (GBrowserIsCompatible()) {
                map = new GMap2(document.getElementById("google_map"));
                map.addControl(new GSmallMapControl());
                map.addControl(new GMapTypeControl());

                map.setCenter(new GLatLng(25.107984, 121.558807), 11);
            }
        }
        function showMap() {




            var arr = new Array(<%=sb%>);
            //利用二維陣列建立座標
            var geoPoint = new Array(arr.length);

            for (var i = 0; i < geoPoint.length; i++)
            {
                geoPoint[i] = new Array();
            }
            //創建另一個地理坐標geoPoint
            for (var i = 0; i < geoPoint.length; i++)
            {
                var j = 0;
                geoPoint[i] = new GLatLng(arr[i][j], arr[i][j + 1]);


            }


            //設定map的中心位置和scale
            // map.setCenter(new GLatLng(25.107984, 121.558807), 5);
            //利用使用者所選取的地方進行比對，並且動態設定位置
            switch ("<%=strArea%>")
            {
                case "士林區":
                    map.setCenter(new GLatLng(25.130677, 121.547386), 13);
                    break;
                case "大同區":
                    map.setCenter(new GLatLng(25.063131, 121.516415), 14);
                    break;
                case "大安區":
                    map.setCenter(new GLatLng(25.033194, 121.543709), 14);
                    break;
                case "中山區":
                    map.setCenter(new GLatLng(25.068263, 121.533237), 14);
                    break;
                case "中正區":
                    map.setCenter(new GLatLng(25.04136, 121.515134), 15);
                    break;
                case "內湖區":
                    map.setCenter(new GLatLng(25.083811, 121.594263), 14);
                    break;
                case "文山區":
                    map.setCenter(new GLatLng(24.977811, 121.589443), 14);
                    break;
                case "北投區":
                    map.setCenter(new GLatLng(25.14342, 121.520019), 14);
                    break;
                case "松山區":
                    map.setCenter(new GLatLng(25.054657, 121.570145), 14);
                    break;
                case "信義區":
                    map.setCenter(new GLatLng(25.032261, 121.571432), 14);
                    break;
                case "南港區":
                    map.setCenter(new GLatLng(25.036305, 121.621544), 14);
                    break;
                case "萬華區":
                    map.setCenter(new GLatLng(25.029462, 121.5005), 14);
                    break;
            }

            //var marker0 = new GMarker(geoPoint[0], {title: "我有titile了"});

            //建立自行定義的GMarker
            var marker = new Array(geoPoint.length);
            //建立自行定義的GMarker物件陣列
            for (var i = 0; i < marker.length; i++)
            {
                marker[i] = new Array();
            }
            for (var i = 0; i < marker.length; i++)
            {

                marker[i] = new GMarker(geoPoint[i]);

                //				marker[i]=new GMarker(geoPoint[i],{icon:myIcon[i]}) ; 
            }


            //顯示自定義了圖標的地標對象marker1
            //		var html = "台南火車<hr>站";
            //        map.openInfoWindowHtml(map.getCenter(), html); //顯示對話框及文字
            //		

            //var marker1 = new GMarker(geoPoint[1],//創建自定義的GMarker
            //                       {icon: myIcon[0],
            //                       title: "把鼠標移上來，看看有什麼"});
            //var marker2 = new GMarker(geoPoint[1],//創建自定義的GMarker
            //                      {icon: myIcon[1],
            //                      title: "把鼠標移上來，看看有什麼"});						 		//document.write(3) ;
            //map.addOverlay(marker0);
            //顯示自定義了圖標的地標對象marker1
            for (var i = 0; i < marker.length; i++)
            {
                map.addOverlay(marker[i]);

            }

            //將圖(picStr),景點名稱(viewStr)和簡介(viewIntroStr)利用GM觸發事件(Mouseover)將資料從InfoWindowHtml秀出
            //<div id="display" width=400 height=400></div>
            GEvent.addListener(marker[0], "mouseover", function() {
                marker[0].openInfoWindowHtml('<div id="infoWindo">${viewStr[0]}${viewIntroStr[0]}</div>');
            });
            GEvent.addListener(marker[1], "mouseover", function() {
                marker[1].openInfoWindowHtml('<div id="infoWindo">${viewStr[1]}${viewIntroStr[1]}</div>');

            });
            GEvent.addListener(marker[2], "mouseover", function() {
                marker[2].openInfoWindowHtml('<div id="infoWindo">${viewStr[2]}${viewIntroStr[2]}</div>');
            });

            GEvent.addListener(marker[3], "mouseover", function() {
                marker[3].openInfoWindowHtml('<div id="infoWindo">${viewStr[3]}${viewIntroStr[3]}</div>');
            });
            GEvent.addListener(marker[4], "mouseover", function() {
                marker[4].openInfoWindowHtml('<div id="infoWindo">${viewStr[4]}${viewIntroStr[4]}</div>');
            });
            GEvent.addListener(marker[5], "mouseover", function() {
                marker[5].openInfoWindowHtml('<div id="infoWindo">${viewStr[5]}${viewIntroStr[5]}</div>');
            });
            GEvent.addListener(marker[6], "mouseover", function() {
                marker[6].openInfoWindowHtml('<div id="infoWindo">${viewStr[6]}${viewIntroStr[6]}</div>')
            });
            GEvent.addListener(marker[7], "mouseover", function() {
                marker[7].openInfoWindowHtml('<div id="infoWindo">${viewStr[7]}${viewIntroStr[7]}</div>')
            });
            GEvent.addListener(marker[8], "mouseover", function() {
                marker[8].openInfoWindowHtml('<div id="infoWindo">${viewStr[8]}${viewIntroStr[8]}</div>')
            });
            GEvent.addListener(marker[9], "mouseover", function() {
                marker[9].openInfoWindowHtml('<div id="infoWindo">${viewStr[9]}${viewIntroStr[9]}</div>')
            });
            GEvent.addListener(marker[10], "mouseover", function() {
                marker[10].openInfoWindowHtml('<div id="infoWindo">${viewStr[10]}${viewIntroStr[10]}</div>')
            });
            GEvent.addListener(marker[11], "mouseover", function() {
                marker[11].openInfoWindowHtml('<div id="infoWindo">${viewStr[11]}${viewIntroStr[11]}</div>')
            });
            GEvent.addListener(marker[12], "mouseover", function() {
                marker[12].openInfoWindowHtml('<div id="infoWindo">${viewStr[12]}${viewIntroStr[12]}</div>')
            });
            GEvent.addListener(marker[13], "mouseover", function() {
                marker[13].openInfoWindowHtml('<div id="infoWindo">${viewStr[13]}${viewIntroStr[13]}</div>')
            });
            GEvent.addListener(marker[14], "mouseover", function() {
                marker[14].openInfoWindowHtml('<div id="infoWindo">${viewStr[14]}${viewIntroStr[14]}</div>')
            });
            GEvent.addListener(marker[15], "mouseover", function() {
                marker[15].openInfoWindowHtml('<div id="infoWindo">${viewStr[15]}${viewIntroStr[15]}</div>')
            });
            GEvent.addListener(marker[16], "mouseover", function() {
                marker[16].openInfoWindowHtml('<div id="infoWindo">${viewStr[16]}${viewIntroStr[16]}</div>')
            });
            GEvent.addListener(marker[17], "mouseover", function() {
                marker[17].openInfoWindowHtml('<div id="infoWindo">${viewStr[17]}${viewIntroStr[17]}</div>')
            });
            GEvent.addListener(marker[18], "mouseover", function() {
                marker[18].openInfoWindowHtml('<div id="infoWindo">${viewStr[18]}${viewIntroStr[18]}</div>')
            });
            GEvent.addListener(marker[19], "mouseover", function() {
                marker[19].openInfoWindowHtml('<div id="infoWindo">${viewStr[19]}${viewIntroStr[19]}</div>')
            });
            GEvent.addListener(marker[20], "mouseover", function() {
                marker[20].openInfoWindowHtml('<div id="infoWindo">${viewStr[20]}${viewIntroStr[20]}</div>')
            });
            GEvent.addListener(marker[21], "mouseover", function() {
                marker[21].openInfoWindowHtml('<div id="infoWindo">${viewStr[21]}${viewIntroStr[21]}</div>')
            });
            GEvent.addListener(marker[22], "mouseover", function() {
                marker[22].openInfoWindowHtml('<div id="infoWindo">${viewStr[22]}${viewIntroStr[22]}</div>')
            });
            GEvent.addListener(marker[23], "mouseover", function() {
                marker[23].openInfoWindowHtml('<div id="infoWindo">${viewStr[23]}${viewIntroStr[23]}</div>')
            });
            GEvent.addListener(marker[24], "mouseover", function() {
                marker[24].openInfoWindowHtml('<div id="infoWindo">${viewStr[24]}${viewIntroStr[24]}</div>')
            });
            GEvent.addListener(marker[25], "mouseover", function() {
                marker[25].openInfoWindowHtml('<div id="infoWindo">${viewStr[25]}${viewIntroStr[25]}</div>')
            });
            GEvent.addListener(marker[26], "mouseover", function() {
                marker[26].openInfoWindowHtml('<div id="infoWindo">${viewStr[26]}${viewIntroStr[26]}</div>')
            });
            GEvent.addListener(marker[27], "mouseover", function() {
                marker[27].openInfoWindowHtml('<div id="infoWindo">${viewStr[27]}${viewIntroStr[27]}</div>')
            });
            GEvent.addListener(marker[28], "mouseover", function() {
                marker[28].openInfoWindowHtml('<div id="infoWindo">${viewStr[28]}${viewIntroStr[28]}</div>')
            });
            GEvent.addListener(marker[29], "mouseover", function() {
                marker[29].openInfoWindowHtml('<div id="infoWindo">${viewStr[29]}${viewIntroStr[29]}</div>')
            });
            GEvent.addListener(marker[30], "mouseover", function() {
                marker[30].openInfoWindowHtml('<div id="infoWindo">${viewStr[30]}${viewIntroStr[30]}</div>')
            });
            GEvent.addListener(marker[31], "mouseover", function() {
                marker[31].openInfoWindowHtml('<div id="infoWindo">${viewStr[31]}${viewIntroStr[31]}</div>')
            });
            GEvent.addListener(marker[32], "mouseover", function() {
                marker[32].openInfoWindowHtml('<div id="infoWindo">${viewStr[32]}${viewIntroStr[32]}</div>')
            });
            GEvent.addListener(marker[33], "mouseover", function() {
                marker[33].openInfoWindowHtml('<div id="infoWindo">${viewStr[33]}${viewIntroStr[33]}</div>')
            });
            GEvent.addListener(marker[34], "mouseover", function() {
                marker[34].openInfoWindowHtml('<div id="infoWindo">${viewStr[34]}${viewIntroStr[34]}</div>')
            });
            GEvent.addListener(marker[35], "mouseover", function() {
                marker[35].openInfoWindowHtml('<div id="infoWindo">${viewStr[35]}${viewIntroStr[35]}</div>')
            });
            GEvent.addListener(marker[36], "mouseover", function() {
                marker[36].openInfoWindowHtml('<div id="infoWindo">${viewStr[36]}${viewIntroStr[36]}</div>')
            });
            GEvent.addListener(marker[37], "mouseover", function() {
                marker[37].openInfoWindowHtml('<div id="infoWindo">${viewStr[37]}${viewIntroStr[37]}</div>')
            });
            GEvent.addListener(marker[38], "mouseover", function() {
                marker[38].openInfoWindowHtml('<div id="infoWindo">${viewStr[38]}${viewIntroStr[38]}</div>')
            });
            GEvent.addListener(marker[39], "mouseover", function() {
                marker[39].openInfoWindowHtml('<div id="infoWindo">${viewStr[39]}${viewIntroStr[39]}</div>')
            });
            GEvent.addListener(marker[40], "mouseover", function() {
                marker[40].openInfoWindowHtml('<div id="infoWindo">${viewStr[40]}${viewIntroStr[40]}</div>')
            });

            GEvent.addListener(marker[41], "mouseover", function() {
                marker[41].openInfoWindowHtml('<div id="infoWindo">${picStr[41]}${viewStr[41]}${viewIntroStr[41]}</div>');
            });
            GEvent.addListener(marker[42], "mouseover", function() {
                marker[42].openInfoWindowHtml('<div id="infoWindo">${picStr[42]}${viewStr[42]}${viewIntroStr[42]}</div>');
            });
            GEvent.addListener(marker[43], "mouseover", function() {
                marker[43].openInfoWindowHtml('<div id="infoWindo">${picStr[43]}${viewStr[43]}${viewIntroStr[43]}</div>');
            });
            GEvent.addListener(marker[44], "mouseover", function() {
                marker[44].openInfoWindowHtml('<div id="infoWindo">${picStr[44]}${viewStr[44]}${viewIntroStr[44]}</div>');
            });
            GEvent.addListener(marker[45], "mouseover", function() {
                marker[45].openInfoWindowHtml('<div id="infoWindo">${picStr[45]}${viewStr[45]}${viewIntroStr[45]}</div>');
            });
            GEvent.addListener(marker[46], "mouseover", function() {
                marker[46].openInfoWindowHtml('<div id="infoWindo">${picStr[46]}${viewStr[46]}${viewIntroStr[46]}</div>');
            });
            GEvent.addListener(marker[47], "mouseover", function() {
                marker[47].openInfoWindowHtml('<div id="infoWindo">${picStr[47]}${viewStr[47]}${viewIntroStr[47]}</div>');
            });
            GEvent.addListener(marker[48], "mouseover", function() {
                marker[48].openInfoWindowHtml('<div id="infoWindo">${picStr[48]}${viewStr[48]}${viewIntroStr[48]}</div>');
            });
            GEvent.addListener(marker[49], "mouseover", function() {
                marker[49].openInfoWindowHtml('<div id="infoWindo">${picStr[49]}${viewStr[49]}${viewIntroStr[49]}</div>');
            });
            GEvent.addListener(marker[50], "mouseover", function() {
                marker[50].openInfoWindowHtml('<div id="infoWindo">${picStr[50]}${viewStr[50]}${viewIntroStr[50]}</div>');
            });
            GEvent.addListener(marker[51], "mouseover", function() {
                marker[51].openInfoWindowHtml('<div id="infoWindo">${picStr[51]}${viewStr[51]}${viewIntroStr[51]}</div>');
            });
            GEvent.addListener(marker[52], "mouseover", function() {
                marker[52].openInfoWindowHtml('<div id="infoWindo">${picStr[52]}${viewStr[52]}${viewIntroStr[52]}</div>');
            });
            GEvent.addListener(marker[53], "mouseover", function() {
                marker[53].openInfoWindowHtml('<div id="infoWindo">${picStr[53]}${viewStr[53]}${viewIntroStr[53]}</div>');
            });
            GEvent.addListener(marker[54], "mouseover", function() {
                marker[54].openInfoWindowHtml('<div id="infoWindo">${picStr[54]}${viewStr[54]}${viewIntroStr[54]}</div>');
            });
            GEvent.addListener(marker[55], "mouseover", function() {
                marker[55].openInfoWindowHtml('<div id="infoWindo">${picStr[55]}${viewStr[55]}${viewIntroStr[55]}</div>');
            });
            GEvent.addListener(marker[56], "mouseover", function() {
                marker[56].openInfoWindowHtml('<div id="infoWindo">${picStr[56]}${viewStr[56]}${viewIntroStr[56]}</div>');
            });
            GEvent.addListener(marker[57], "mouseover", function() {
                marker[57].openInfoWindowHtml('<div id="infoWindo">${picStr[57]}${viewStr[57]}${viewIntroStr[57]}</div>');
            });
            GEvent.addListener(marker[58], "mouseover", function() {
                marker[58].openInfoWindowHtml('<div id="infoWindo">${picStr[58]}${viewStr[58]}${viewIntroStr[58]}</div>');
            });
            GEvent.addListener(marker[59], "mouseover", function() {
                marker[59].openInfoWindowHtml('<div id="infoWindo">${picStr[59]}${viewStr[59]}${viewIntroStr[59]}</div>');
            });
            GEvent.addListener(marker[60], "mouseover", function() {
                marker[60].openInfoWindowHtml('<div id="infoWindo">${picStr[60]}${viewStr[60]}${viewIntroStr[60]}</div>');
            });
            GEvent.addListener(marker[61], "mouseover", function() {
                marker[61].openInfoWindowHtml('<div id="infoWindo">${picStr[61]}${viewStr[61]}${viewIntroStr[61]}</div>');
            });
            GEvent.addListener(marker[62], "mouseover", function() {
                marker[62].openInfoWindowHtml('<div id="infoWindo">${picStr[62]}${viewStr[62]}${viewIntroStr[62]}</div>');
            });
            GEvent.addListener(marker[63], "mouseover", function() {
                marker[63].openInfoWindowHtml('<div id="infoWindo">${picStr[63]}${viewStr[63]}${viewIntroStr[63]}</div>');
            });
            GEvent.addListener(marker[64], "mouseover", function() {
                marker[64].openInfoWindowHtml('<div id="infoWindo">${picStr[64]}${viewStr[64]}${viewIntroStr[64]}</div>');
            });
            GEvent.addListener(marker[65], "mouseover", function() {
                marker[65].openInfoWindowHtml('<div id="infoWindo">${picStr[65]}${viewStr[65]}${viewIntroStr[65]}</div>');
            });
            GEvent.addListener(marker[66], "mouseover", function() {
                marker[66].openInfoWindowHtml('<div id="infoWindo">${picStr[66]}${viewStr[66]}${viewIntroStr[66]}</div>');
            });
            GEvent.addListener(marker[67], "mouseover", function() {
                marker[67].openInfoWindowHtml('<div id="infoWindo">${picStr[67]}${viewStr[67]}${viewIntroStr[67]}</div>');
            });
            GEvent.addListener(marker[68], "mouseover", function() {
                marker[68].openInfoWindowHtml('<div id="infoWindo">${picStr[68]}${viewStr[68]}${viewIntroStr[68]}</div>');
            });
            GEvent.addListener(marker[69], "mouseover", function() {
                marker[69].openInfoWindowHtml('<div id="infoWindo">${picStr[69]}${viewStr[69]}${viewIntroStr[69]}</div>');
            });
            GEvent.addListener(marker[70], "mouseover", function() {
                marker[70].openInfoWindowHtml('<div id="infoWindo">${picStr[70]}${viewStr[70]}${viewIntroStr[70]}</div>');
            });
            GEvent.addListener(marker[71], "mouseover", function() {
                marker[71].openInfoWindowHtml('<div id="infoWindo">${picStr[71]}${viewStr[71]}${viewIntroStr[71]}</div>');
            });
            GEvent.addListener(marker[72], "mouseover", function() {
                marker[72].openInfoWindowHtml('<div id="infoWindo">${picStr[72]}${viewStr[72]}${viewIntroStr[72]}</div>');
            });
            GEvent.addListener(marker[73], "mouseover", function() {
                marker[73].openInfoWindowHtml('<div id="infoWindo">${picStr[73]}${viewStr[73]}${viewIntroStr[73]}</div>');
            });
            GEvent.addListener(marker[74], "mouseover", function() {
                marker[74].openInfoWindowHtml('<div id="infoWindo">${picStr[74]}${viewStr[74]}${viewIntroStr[74]}</div>');
            });
            GEvent.addListener(marker[75], "mouseover", function() {
                marker[75].openInfoWindowHtml('<div id="infoWindo">${picStr[75]}${viewStr[75]}${viewIntroStr[75]}</div>');
            });
            GEvent.addListener(marker[76], "mouseover", function() {
                marker[76].openInfoWindowHtml('<div id="infoWindo">${picStr[76]}${viewStr[76]}${viewIntroStr[76]}</div>');
            });
            GEvent.addListener(marker[77], "mouseover", function() {
                marker[77].openInfoWindowHtml('<div id="infoWindo">${picStr[77]}${viewStr[77]}${viewIntroStr[77]}</div>');
            });
            GEvent.addListener(marker[78], "mouseover", function() {
                marker[78].openInfoWindowHtml('<div id="infoWindo">${picStr[78]}${viewStr[78]}${viewIntroStr[78]}</div>');
            });
            GEvent.addListener(marker[79], "mouseover", function() {
                marker[79].openInfoWindowHtml('<div id="infoWindo">${picStr[79]}${viewStr[79]}${viewIntroStr[79]}</div>');
            });
            GEvent.addListener(marker[80], "mouseover", function() {
                marker[80].openInfoWindowHtml('<div id="infoWindo">${picStr[80]}${viewStr[80]}${viewIntroStr[80]}</div>');
            });
            GEvent.addListener(marker[81], "mouseover", function() {
                marker[81].openInfoWindowHtml('<div id="infoWindo">${picStr[81]}${viewStr[81]}${viewIntroStr[81]}</div>');
            });
            GEvent.addListener(marker[82], "mouseover", function() {
                marker[82].openInfoWindowHtml('<div id="infoWindo">${picStr[82]}${viewStr[82]}${viewIntroStr[82]}</div>');
            });
            GEvent.addListener(marker[83], "mouseover", function() {
                marker[83].openInfoWindowHtml('<div id="infoWindo">${picStr[83]}${viewStr[83]}${viewIntroStr[83]}</div>');
            });
            GEvent.addListener(marker[84], "mouseover", function() {
                marker[84].openInfoWindowHtml('<div id="infoWindo">${picStr[84]}${viewStr[84]}${viewIntroStr[84]}</div>');
            });
            GEvent.addListener(marker[85], "mouseover", function() {
                marker[85].openInfoWindowHtml('<div id="infoWindo">${picStr[85]}${viewStr[85]}${viewIntroStr[85]}</div>');
            });
            GEvent.addListener(marker[86], "mouseover", function() {
                marker[86].openInfoWindowHtml('<div id="infoWindo">${picStr[86]}${viewStr[86]}${viewIntroStr[86]}</div>');
            });
            GEvent.addListener(marker[87], "mouseover", function() {
                marker[87].openInfoWindowHtml('<div id="infoWindo">${picStr[87]}${viewStr[87]}${viewIntroStr[87]}</div>');
            });
            GEvent.addListener(marker[88], "mouseover", function() {
                marker[88].openInfoWindowHtml('<div id="infoWindo">${picStr[88]}${viewStr[88]}${viewIntroStr[88]}</div>');
            });
            GEvent.addListener(marker[89], "mouseover", function() {
                marker[89].openInfoWindowHtml('<div id="infoWindo">${picStr[89]}${viewStr[89]}${viewIntroStr[89]}</div>');
            });
            GEvent.addListener(marker[90], "mouseover", function() {
                marker[90].openInfoWindowHtml('<div id="infoWindo">${picStr[90]}${viewStr[90]}${viewIntroStr[90]}</div>');
            });
            GEvent.addListener(marker[91], "mouseover", function() {
                marker[91].openInfoWindowHtml('<div id="infoWindo">${picStr[91]}${viewStr[91]}${viewIntroStr[91]}</div>');
            });
            GEvent.addListener(marker[92], "mouseover", function() {
                marker[92].openInfoWindowHtml('<div id="infoWindo">${picStr[92]}${viewStr[92]}${viewIntroStr[92]}</div>');
            });
            GEvent.addListener(marker[93], "mouseover", function() {
                marker[93].openInfoWindowHtml('<div id="infoWindo">${picStr[93]}${viewStr[93]}${viewIntroStr[93]}</div>');
            });
            GEvent.addListener(marker[94], "mouseover", function() {
                marker[94].openInfoWindowHtml('<div id="infoWindo">${picStr[94]}${viewStr[94]}${viewIntroStr[94]}</div>');
            });
            GEvent.addListener(marker[95], "mouseover", function() {
                marker[95].openInfoWindowHtml('<div id="infoWindo">${picStr[95]}${viewStr[95]}${viewIntroStr[95]}</div>');
            });
            GEvent.addListener(marker[96], "mouseover", function() {
                marker[96].openInfoWindowHtml('<div id="infoWindo">${picStr[96]}${viewStr[96]}${viewIntroStr[96]}</div>');
            });
            GEvent.addListener(marker[97], "mouseover", function() {
                marker[97].openInfoWindowHtml('<div id="infoWindo">${picStr[97]}${viewStr[97]}${viewIntroStr[97]}</div>');
            });
            GEvent.addListener(marker[98], "mouseover", function() {
                marker[98].openInfoWindowHtml('<div id="infoWindo">${picStr[98]}${viewStr[98]}${viewIntroStr[98]}</div>');
            });
            GEvent.addListener(marker[99], "mouseover", function() {
                marker[99].openInfoWindowHtml('<div id="infoWindo">${picStr[99]}${viewStr[99]}${viewIntroStr[99]}</div>');
            });
            GEvent.addListener(marker[100], "mouseover", function() {
                marker[100].openInfoWindowHtml('<div id="infoWindo">${picStr[100]}${viewStr[100]}${viewIntroStr[100]}</div>');
            });

        }
                        </script>