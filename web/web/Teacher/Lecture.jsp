<%-- 
    Document   : Lecture
    Created on : 25 Dec, 2023, 10:31:49 AM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Lecture</title>
    </head>
    <body>
        <h1 align="center">Add Lecture</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/LectureUploadAction.jsp">
            <table border="1" align="center">
                <tr>
                    <td>Subject</td>
                    <td>
                        <select name="subject">
                            <option value="">---Select---</option>
                            <%
                            String select="select * from tbl_assignteacher a inner join tbl_subject s on a.subject_id=s.subject_id where a.teacher_id='"+session.getAttribute("teacherid")+"'";
                            ResultSet selsubject=con.selectCommand(select);
                            while(selsubject.next()){
                            %>
                            <option value="<%=selsubject.getString("subject_id")%>"><%=selsubject.getString("subject_name")%></option>
                            <%
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Content</td>
                    <td>
                        <textarea name="content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>File</td>
                    <td>
                        <input type="file" name="file">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="submit">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
