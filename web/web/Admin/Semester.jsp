<%-- 
    Document   : District
    Created on : 5 Dec, 2023, 2:29:19 PM
    Author     : MELBIN
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Semester</title>
    </head>
    <body>
        <%
            if (request.getParameter("save") != null) {
                String count = request.getParameter("semester");
                String check = "select * from tbl_semester where semester_count='" + count + "'";
                ResultSet che = con.selectCommand(check);
                if (che.next()) {
        %>
        <script>
            alert('This Semester is Already Inserted');
        </script>
        <%
                } else {
                    String insQry = "insert into tbl_semester(semester_count)values('" + count + "')";
                    con.executeCommand(insQry);
                }
            }
            if (request.getParameter("id") != null) {
                String id = request.getParameter("id");
                String delete = "delete from tbl_semester where semester_id='" + id + "'";
                con.executeCommand(delete);
            }

        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        Semester
                    </td>
                    <td>
                        <input type="number" name="semester">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
            <!--            display-->
            <table border="1">
                <tr>
                    <th>S.NO</th>
                    <th>Semester</th>
                    <th>Action</th>
                </tr>
                <%
                    String selectsem = "select * from tbl_semester";
                    ResultSet rs = con.selectCommand(selectsem);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("semester_count")%></td>
                    <td><a href="Semester.jsp?id=<%=rs.getString("semester_id")%>">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
