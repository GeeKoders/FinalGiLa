<%-- 
    Document   : Fetch
    Created on : 2013/8/21, 下午 03:59:20
    Author     : Administrator
--%>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bean.*"%>
<%@include file="cust.html"%>


<%      
     
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");

DataBean data=new DataBean() ;         
Connection conn=data.setConnection() ; 
ResultSet rs=data.getQuery("select 套裝行程檔.行程流水號,景點檔.景點代號,會員帳號,行程主題名稱,景點檔.景點代號,景點名稱,檔名 from 套裝行程檔 inner join 行程明細檔 on 套裝行程檔.行程流水號=行程明細檔.行程流水號 inner join 景點檔 on 行程明細檔.景點代號=景點檔.景點代號 inner join 景點照片檔 on 景點檔.景點代號=景點照片檔.景點代號 where 會員帳號='Bob@gmail.com' and 套裝行程檔.行程流水號=10005") ; 

%>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  
       
        <%
           
            StringBuffer sb=new StringBuffer() ; 
            List list=new ArrayList() ; 
                while(rs.next()){
                list.add(new bean.DataBean(rs.getString("行程流水號"),rs.getString("會員帳號"),rs.getString("行程主題名稱"),rs.getString("檔名"),rs.getString("景點名稱"),rs.getString("景點代號"))) ; 
                }    
          Iterator it=list.iterator() ; 
          while(it.hasNext())
          {
            DataBean obj=(DataBean)it.next() ;
             sb.append("<div id=").append(obj.getViewNum()).append(" class=drag >").append("<img src=images/").append(obj.getPic()).append(" width=160 /><br/>").append("<strong class=titleColor>").append(obj.getView()).append("</strong>").append("<br>").append("<p class=introFont>").append("</div>");
             
          }
            

        %>       
            
 <script>document.getElementById("source").innerHTML='<%=sb%>'</script>                            
 
        
        
        
  
        
        
        
        
    </body>
</html>
