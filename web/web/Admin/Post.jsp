<%-- 
    Document   : Post
    Created on : 15 Jan, 2024, 10:20:19 AM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Post</title>
    </head>
    <body>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/AdminPostAction.jsp">
            <table border="1" align="center">
                <tr>
                    <th colspan="2">
                        New Post
                    </th>
                </tr>
                <tr>
                    <th>University</th>
                    <td>
                        <select name="university">
                            <option value="">--select--</option>
                            <%
                                String sel="select * from tbl_university";
                                ResultSet seluniversity=con.selectCommand(sel);
                                while(seluniversity.next()){
                            %>
                            <option value="<%=seluniversity.getString("university_id")%>"><%=seluniversity.getString("university_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Add Post</th>
                    <td>
                        <input type="file" name="post">
                    </td>
                </tr>
                <tr>
                    <th>Content</th>
                    <td>
                        <input type="text" name="content">
                    </td>
                </tr>
                <tr>
                    <th>Privacy</th>
                    <td>
                        <input type="radio" name="privacy" value="0">public
                        <input type="radio" name="privacy" value="1">Private
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Post">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
