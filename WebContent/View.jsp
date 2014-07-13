<%-- 
    Document   : UsingQueryBean
    Created on : 2013/8/21, 上午 10:44:11
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*"%>

<jsp:useBean id="DataBean" scope="application" class="bean.DataBean"/>
<%
       
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
Connection conn=DataBean.setConnection() ; 

String str="C1_301020000G_000035,C1_301020000G_000037,C1_301020000G_000043" ;
String []a=str.split(",") ; 


DataBean.setModify("insert into 套裝行程檔 values('5','ryan@gmail.com','樂活之旅',null,null,null,null,null)");

for(int i=0;i<a.length;i++)
{
DataBean.setModify("insert into 行程明細檔  values('2','"+a[i]+"',null)");    
}

%>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>
                   行程流水號 
                </th>
                <th>
                   景點代號 
                </th>    
                <th>
                   預計停留時間 
                </th>
            </tr>
        <%
ResultSet rs=DataBean.getQuery("select * from 行程明細檔") ; 
            while(rs.next()){
        %>       
            <tr>
              <td><%=rs.getString("行程流水號")%></td>  
              <td><%=rs.getString("景點代號")%></td>
              <td><%=rs.getInt("預計停留時間")%></td>
            </tr>    
        
        <%
            }
        %>
        
        
        </table>
    </body>
</html>
