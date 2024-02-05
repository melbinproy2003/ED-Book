<%-- 
    Document   : College
    Created on : 15 Dec, 2023, 11:14:12 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COLLEGE REGISTRATION</title>
    </head>
    <body>
        <h1 align="center">College Registration</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/CollegeUploadAction.jsp">
            <table border="1" align="center">
                <tr>
                    <td>College Name</td>
                    <td>
                        <input type="text" name="name">
                    </td>
                </tr>
                <tr>
                    <td>College Contact</td>
                    <td>
                        <input type="number" name="contact">
                    </td>
                </tr>
                <tr>
                    <td>College Email</td>
                    <td>
                        <input type="email" name="email">
                    </td>
                </tr>
                <tr>
                    <td>College Address</td>
                    <td>
                        <textarea name="address"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>College Photo</td>
                    <td>
                        <input type="file" name="photo">
                    </td>
                </tr>
                <tr>
                    <td>university</td>
                    <td>
                        <select name="university">
                            <option value="">---select---</option>
                            <%
                             String selectuniversity="select * from tbl_university";
                             ResultSet su=con.selectCommand(selectuniversity);
                             while(su.next())
                             {
                            %>
                            <option value="<%=su.getString("university_id")%>"><%=su.getString("university_name")%></option>
                            <%
                             }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="district" onchange="getPlace(this.value)">
                            <option value="">---select---</option>
                            <%
                             String selectdistrict="select * from tbl_district";
                             ResultSet sd=con.selectCommand(selectdistrict);
                             while(sd.next())
                             {
                            %>
                            <option value="<%=sd.getString("district_id")%>"><%=sd.getString("district_name")%></option>
                            <%
                             }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="place" id="sel_place">
                            <option value="">---select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
        function getPlace(did)
        {
            $.ajax({
                url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                success: function(html) {
                    $("#sel_place").html(html);

                }
            });
        }
    </script>
</html>
