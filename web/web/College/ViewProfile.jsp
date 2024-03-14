<%-- 
    Document   : ViewProfile
    Created on : May 5, 2021, 2:15:04 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>

    </head>
    <body>
        <div id="tab" align="center">
        <h1>Profile</h1>
        <table border="1">
            <%
                String selQry = "select * from tbl_college where college_id='"+session.getAttribute("cid")+"'";
                ResultSet rs = con.selectCommand(selQry);
                if(rs.next())
                {
            %>
            <tr>
                <td colspan="2" align="center"><img src="<%=rs.getString("college_photo")%>" width="120" height="120" style="border-radius: 50%"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=rs.getString("college_name")%></td>
            </tr>
             <tr>
                <td>Contact</td>
                <td><%=rs.getString("college_contact")%></td>
            </tr>
             <tr>
                <td>Email</td>
                <td><%=rs.getString("college_email")%></td>
            </tr>
             <tr>
                <td>Address</td>
                <td><%=rs.getString("college_address")%></td>
            </tr>
            <tr>
                <td><a href="EditProfile.jsp">Edit Profile</a></td>
                <td><a href="ChangePassword.jsp">Change Password</a></td>
            </tr>
            <%
                }
            %>
        </table>
        </div>
            <%@include file="Footer.jsp" %>
    </body>
</html>
