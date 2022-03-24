<%-- 
    Document   : logout
    Created on : Dec 15, 2018, 1:30:14 AM
    Author     : NightPredetor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging Out....</title>
    </head>
    <body>
        <% 
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
