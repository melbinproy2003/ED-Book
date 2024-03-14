<%-- 
    Document   : StudentList
    Created on : May 7, 2021, 10:40:39 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student List</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <body>

        <iframe style="border: none; border-radius: 15px; width: 100%; height: 653px ;" src = "Student.jsp" ></iframe>

    </body>
    <%@include file="Footer.jsp" %>
</html>

