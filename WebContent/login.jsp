
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.util.List" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
	body {
		width: 300px;
		margin: 0 auto;
		text-align: center;
	}
</style>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>會員登入</title>
    <link rel="stylesheet" type="text/css" href="css/easyui.css">
	<!--<link rel="stylesheet" href="css/contactpopup.css" />-->
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <!--<script type="text/javascript" src="js/contactpopup.js"></script>-->
    <script type="text/javascript">
//	$(function(){
		// Init Plugin
/*		$(".clickable").contactpopup({
			'formelement' : '#Form_PopContactUs',
			'transition' : '' // options - slide,fade,grow
		});
		$(".clickableFade").contactpopup({
			'formelement' : '#Form_PopContactUs',
			'transition' : 'fade' // options - slide,fade,grow
		});
		$(".clickableSlide").contactpopup({
			'formelement' : '#Form_PopContactUs',
			'transition' : 'slide' // options - slide,fade,grow
		});
		$(".clickableGrow").contactpopup({
			'formelement' : '#Form_PopContactUs',
			'transition' : 'grow' // options - slide,fade,grow
		});
*/						
		//$('#ff').form({  
		//	url:'Login',  
		//	onSubmit:function(){  
		//		return $(this).form('validate');  
		//	}, 
		//	success:function(data){ 			 
		//		$.messager.alert('Info',data.email);
			//	$.messager.alert('Info',data.ID);
			//	var obj = jQuery.parseJSON(data);
			//	 請改用回傳 nickname
			//	 window.location.href='home.php?ID='+obj.ID;
			//	window.location.href='home.html?ID='+obj.ID;
//			}  
//		});
		
//	});
	
    </script>    
</head>
<body>

    <h2>&nbsp;</h2>
    <img src="images/gira1.gif" align="center" width="300" height="150" /> <br><br><br>
    <div class="easyui-panel" title="<h1 align=center>會員登入</h1>" style="width:300px; padding: 10px;">
        <form id="ff" name="form1" method="post" action="Login">
            <table cellpadding="5" cellspacing="5">
                <tr>
                  <td colspan="2">還不是會員？<a href="register.jsp">註冊</a></td>
                </tr>
                <tr>
                    <td align="right">Email:</td>
                    <td><input id="email" name="email" type="text" class="easyui-validatebox" required validType="email"></input></td>
                </tr>
                <tr>
                    <td align="right">Password:</td>
                    <td><input name="password" type="password" class="easyui-validatebox" required validType="length[0,8]" /></input></td>
                </tr>
             	<tr>
                    <td></td>
                    <td><input type="submit" value="Submit"></input>&nbsp;&nbsp;<a href="forgot.html">忘記密碼</a></td>
                </tr>
            </table>
            <p align="center">使用Facebook帳號登入<img src="images/FBLogin.jpg" align="center" width="220" height="50" /></p>
        </form>
    </div>
    <h1>${Answer}</h1><br>
<%
    List<String> errors = (List<String>)request.getAttribute("loginerrors");
      if(errors!=null){
    	  for(String error : errors){
    		  out.print("<h1>"+error+"</h1><br>");
    	  }
      }
%>



</body>
</html>
