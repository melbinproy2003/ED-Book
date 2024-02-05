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
        <title>Registration of Department</title>
    </head>
    <body>
        <h1 align="center">Add New Department</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/DepartmentUploadAction.jsp">
            <table border="1" align="center">
                <tr>
                    <td>Department Type</td>
                    <td>
                        <select name="type">
                            <option value="">---select---</option>
                            <%
                             String selectdepartment="select * from tbl_departmenttype";
                             ResultSet selecttype=con.selectCommand(selectdepartment);
                             while(selecttype.next()){
                            %>
                            <option value="<%=selecttype.getString("departmenttype_id")%>"><%=selecttype.getString("departmenttype_name")%></option>
                            <%
                             }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Department Email</td>
                    <td>
                        <input type="email" name="email">
                    </td>
                </tr>
                <tr>
                    <td>Department Contact</td>
                    <td>
                        <input type="number" name="contact">
                    </td>
                </tr>
                <tr>
                    <td>Department photo</td>
                    <td>
                        <input type="file" name="photo">
                    </td>
                </tr>
                <tr>
                    <td>Department Landmark</td>
                    <td>
                        <input type="text" name="landmark">
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
