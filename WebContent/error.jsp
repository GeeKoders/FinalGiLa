<%-- 
    Document   : error
    Created on : 2013/8/19, 上午 07:43:07
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body bgcolor="white">
        <h1>Error Page</h1>
        <p>
            <font color='red'>Please correct the following errors:
        <ul>
            <%
                List errorMsgs = (List) request.getAttribute("errorMsgs");
                Iterator items = errorMsgs.iterator();
                while (items.hasNext()) {
                    String message = (String) items.next();

            %>
            <li><%=message%></li>
                <%
                    }
                %>

            <ul> 
          <a href="plan.jsp" align="left">Try again</a>    
          
                </body>
               
                </html>
