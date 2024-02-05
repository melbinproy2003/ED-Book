<%-- 
    Document   : NewDepartment
    Created on : 16 Dec, 2023, 3:26:31 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Profile</title>
    </head>
    <%
     String select="select * from tbl_department d inner join tbl_departmenttype dt on d.departmenttype_id=dt.departmenttype_id inner join tbl_college c on d.college_id=c.college_id where department_id='"+session.getAttribute("departmentid")+"'";
     ResultSet rs=con.selectCommand(select);
     rs.next();
    %>
    <body>
        <h1 align="center">Profile</h1>
            <table border="1" align="center">
                <tr>
                    <td>Department Name</td>
                    <td>
                       <%=rs.getString("departmenttype_name")%>
                    </td>
                </tr>
                <tr>
                    <td>Department Email</td>
                    <td>
                         <%=rs.getString("department_email")%>
                    </td>
                </tr>
                <tr>
                    <td>Department Contact</td>
                    <td>
                       <%=rs.getString("department_contact")%>
                    </td>
                </tr>
                <tr>
                    <td>Department photo</td>
                    <td>
                        <img src="../Assets/Files/Department/<%=rs.getString("department_photo")%>" width="200px">
                    </td>
                </tr>
                <tr>
                    <td>Department Landmark</td>
                    <td>
                        <%=rs.getString("department_landmark")%>
                    </td>
                </tr>
                <tr>
                    <td>College name</td>
                    <td>
                        <%=rs.getString("college_name")%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="EditProfile.jsp"><button>Edit Profile</button></a>
                        <a href="ChangePassword.jsp"><button>Change Password</button></a>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
