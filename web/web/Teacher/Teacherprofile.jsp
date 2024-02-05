<%-- 
    Document   : Teacherprofile
    Created on : 19 Dec, 2023, 12:08:35 AM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Profile</title>
    </head>
    <%
     String select="select * from tbl_teacher t inner join tbl_department dep on t.department_id=dep.department_id inner join tbl_departmenttype dety on dep.departmenttype_id=dety.departmenttype_id inner join tbl_place p on t.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where teacher_id='"+session.getAttribute("teacherid")+"'";
     ResultSet teacher=con.selectCommand(select);
     teacher.next();
    %>
    <body>
        <h1 align="center"> Profile </h1>
        <table  border="1" align="center">
            <tr>
                <td colspan="2" align="center">
                    <img src="../Assets/Files/Teacher/<%=teacher.getString("teacher_photo")%>" width="100px" height="100px">
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=teacher.getString("teacher_name")%></td>
            </tr>
            <tr>
                <td>Contact</td>
                <td><%=teacher.getString("teacher_contact")%></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%=teacher.getString("teacher_email")%></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%=teacher.getString("teacher_address")%></td>
            </tr>
            <tr>
                <td>District</td>
                <td><%=teacher.getString("district_name")%></td>
            </tr>
            <tr>
                <td>Place</td>
                <td><%=teacher.getString("place_name")%></td>
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td><%=teacher.getString("teacher_dob")%></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><%=teacher.getString("teacher_gender")%></td>
            </tr>
            <tr>
                <td>Department</td>
                <td><%=teacher.getString("departmenttype_name")%></td>
            </tr>
            <tr>
                <td>About</td>
                <td><%=teacher.getString("teacher_about")%></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a href="EditProfile.jsp"><button>Edit profile</button></a>
                    <a href="ChangePassword.jsp"><button>Change Password</button></a>
                </td>
            </tr>
        </table>
    </body>
</html>
