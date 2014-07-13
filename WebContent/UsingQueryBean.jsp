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

DataBean.setModify("insert into 個人資料  values('"+request.getParameter("area")+"','Zyyyyy','AAAAAA')");
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
                   Name 
                </th>
                <th>
                   Tel 
                </th>    
                <th>
                   Email 
                </th>
            </tr>
        <%
ResultSet rs=DataBean.getQuery("select * from 個人資料") ; 
            while(rs.next()){
        %>       
            <tr>
              <td><%=rs.getString("Name")%></td>  
              <td><%=rs.getString("Tel")%></td>
              <td><%=rs.getString("Email")%></td>
            </tr>    
        
        <%
            }
        %>
        
        
        </table>
    </body>
</html>
