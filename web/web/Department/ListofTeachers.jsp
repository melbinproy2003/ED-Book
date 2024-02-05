<%-- 
    Document   : ListofTeachers
    Created on : 19 Dec, 2023, 2:02:47 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teachers List</title>
    </head>
    <body align="center">
        <h1>Teachers</h1>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <th>SI.NO</th>
                    <th>NAME</th>
                    <th>ABOUT</th>
                    <th>ASSIGN</th>
                </tr>
                <%
                 String select="select * from tbl_teacher where department_id='"+session.getAttribute("departmentid")+"'";
                 ResultSet teacher=con.selectCommand(select);
                 int i=0;
                 while(teacher.next())
                 {
                     i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=teacher.getString("teacher_name")%></td>
                    <td><%=teacher.getString("teacher_about")%></td>
                    <td>
                        <button> <a href="AssigningTeacher.jsp?id=<%=teacher.getString("teacher_id")%>">Assign</a></button>
                    </td>
                </tr>
                <%
                 }
                %>
            </table>
        </form>
    </body>
</html>
