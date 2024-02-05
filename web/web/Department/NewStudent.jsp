<%-- 
    Document   : NewStudent
    Created on : 18 Dec, 2023, 10:20:34 AM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration of Student</title>
    </head>
    <body>
        <h1 align="center">Add Student</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/StudentUploadAction.jsp">
            <table border="2" align="center">
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="name">
                    </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td>
                        <input type="number" name="contact">
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="email" name="email">
                    </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td>
                        <input type="file" name="photo">
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea name="address"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="district" onchange="getPlace(this.value)">
                            <option value="">---select---</option>
                            <%
                             String selectdistrict="select * from tbl_district";
                             ResultSet objdistrict=con.selectCommand(selectdistrict);
                             while(objdistrict.next())
                             {
                            %>
                            <option value="<%=objdistrict.getString("district_id")%>"><%=objdistrict.getString("district_name")%></option>
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
                    <td>Gender</td>
                    <td>
                        <input type="radio" name="gender" value="male">Male
                        <input type="radio" name="gender" value="female">Female
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td>
                        <input type="date" name="dob">
                    </td>
                </tr>
                <tr>
                    <td>Course</td>
                    <td>
                        <select name="course">
                            <option value="">---select---</option>
                             <%
                             String selectcourse="select * from tbl_course where university_id='"+session.getAttribute("universityid")+"' and departmenttype_id='"+session.getAttribute("departmenttypeid")+"'";
                             out.println(selectcourse);
                             ResultSet objcourse=con.selectCommand(selectcourse);
                             while(objcourse.next())
                             {
                            %>
                            <option value="<%=objcourse.getString("course_id")%>"><%=objcourse.getString("course_name")%></option>
                            <%
                             }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Batch</td>
                    <td>
                        <select name="batch">
                            <option value="">--select--</option>
                            <%
                             String batch="select * from tbl_batch";
                             ResultSet objbatch=con.selectCommand(batch);
                             while(objbatch.next())
                             {
                            %>
                            <option value="<%=objbatch.getString("batch_id")%>"><%=objbatch.getString("batch_name")%></option>
                            <%
                             }
                            %>
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
