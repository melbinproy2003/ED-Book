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
        <title>Edit Teacher Profile</title>
    </head>
    <%
        if(request.getParameter("save")!=null){
            String name=request.getParameter("name");
            String contact=request.getParameter("contact");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String place=request.getParameter("place");
            String dob=request.getParameter("dob");
            String gender=request.getParameter("gender");
            String update="update tbl_teacher set teacher_name='"+name+"',teacher_contact='"+contact+"',teacher_email='"+email+"',teacher_address='"+address+"',place_id='"+place+"',teacher_dob='"+dob+"',teacher_gender='"+gender+"' where teacher_id='"+session.getAttribute("teacherid")+"'";
            con.executeCommand(update);
            response.sendRedirect("Teacherprofile.jsp");
        }
     String select="select * from tbl_teacher s inner join tbl_place p on s.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where teacher_id='"+session.getAttribute("teacherid")+"'";
     ResultSet teacher=con.selectCommand(select);
     teacher.next();
     String gender=teacher.getString("teacher_gender");
    %>
    <body>
        <h1 align="center"> Edit Profile </h1>
        <form method="post">
        <table  border="1" align="center">
            <tr>
                <td>Name</td>
                <td>
                    <input type="text" name="name" value="<%=teacher.getString("teacher_name")%>">
                </td>
            </tr>
            <tr>
                <td>Contact</td>
                <td>
                    <input type="number" name="contact" value="<%=teacher.getString("teacher_contact")%>">
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <input type="email" name="email" value="<%=teacher.getString("teacher_email")%>">
                </td>
            </tr>
            <tr>
                <td>Address</td>
                <td>
                    <textarea name="address"><%=teacher.getString("teacher_address")%></textarea> 
                </td>
            </tr>
            <tr>
                <td>District</td>
                <td>
                    <select name="district" onchange="getPlace(this.value)">
                        <%
                         String selectdistrict="select * from tbl_district";
                         ResultSet sd=con.selectCommand(selectdistrict);
                         while(sd.next())
                         {
                        %>
                            <option value="<%=sd.getString("district_id")%>" <% if(sd.getString("district_id").equals(teacher.getString("district_id"))){out.print("selected"); } %>><%=sd.getString("district_name")%></option>
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
                        <%
                         String selectplace="select * from tbl_place where district_id='"+teacher.getString("district_id")+"'";
                         ResultSet sp=con.selectCommand(selectplace);
                         while(sp.next())
                         {
                        %>
                            <option value="<%=sp.getString("place_id")%>" <% if(sp.getString("place_id").equals(teacher.getString("place_id"))){out.print("selected"); } %>><%=sp.getString("place_name")%></option>
                        <%
                         }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td>
                    <input type="date" name="dob" value="<%=teacher.getString("teacher_dob")%>">
                </td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <input type="radio" name="gender" <% if(gender.equals("male")){out.println("checked");}%> value="male">Male
                    <input type="radio" name="gender" <% if(gender.equals("female")){out.println("checked");}%> value="female">Female
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
