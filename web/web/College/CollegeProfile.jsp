<%-- 
    Document   : CollegeProfile
    Created on : 16 Dec, 2023, 1:53:09 AM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>College Profile</title>
    </head>
    <%
     String select="select * from tbl_college c inner join tbl_university u on c.university_id=u.university_id inner join tbl_place p on c.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where college_id='"+session.getAttribute("collegeid")+"'";
     ResultSet college=con.selectCommand(select);
     college.next();
    %>
    <body>
        <h1 align="center">College Profile</h1>
       <table border="1" align="center">
                <tr>
                    <td>College Name</td>
                    <td>
                        <%=college.getString("college_name")%>
                    </td>
                </tr>
                <tr>
                    <td>College Contact</td>
                    <td>
                        <%=college.getString("college_contact")%>
                    </td>
                </tr>
                <tr>
                    <td>College Email</td>
                    <td>
                        <%=college.getString("college_email")%>
                    </td>
                </tr>
                <tr>
                    <td>College Address</td>
                    <td>
                        <%=college.getString("college_address")%>
                    </td>
                </tr>
                <tr>
                    <td>College Photo</td>
                    <td>
                        <img src="../Assets/Files/College/<%=college.getString("college_photo")%>" width="200px">
                    </td>
                </tr>
                <tr>
                    <td>university</td>
                    <td>
                        <%=college.getString("university_name")%>
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <%=college.getString("district_name")%>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                       <%=college.getString("place_name")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="EditProfile.jsp"><button>Edit</button></a>
                        <a href="ChangePassword.jsp"><button>Change Password</button></a>
                    </td>
                </tr>
            </table>
    </body>
</html>
