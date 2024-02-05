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
        <title>Edit Student Profile</title>
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
            String update="update tbl_student set student_name='"+name+"',student_contact='"+contact+"',student_email='"+email+"',student_address='"+address+"',place_id='"+place+"',student_dob='"+dob+"',student_gender='"+gender+"' where student_id='"+session.getAttribute("studentid")+"'";
            con.executeCommand(update);
            System.out.print(update);
            response.sendRedirect("Studentprofile.jsp");
        }
     String select="select * from tbl_student s inner join tbl_place p on s.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where student_id='"+session.getAttribute("studentid")+"'";
     ResultSet student=con.selectCommand(select);
     student.next();
     String gender=student.getString("student_gender");
    %>
    <body>
        <h1 align="center"> Edit Profile </h1>
        <form method="post">
        <table  border="1" align="center">
            <tr>
                <td>Name</td>
                <td>
                    <input type="text" name="name" value="<%=student.getString("student_name")%>">
                </td>
            </tr>
            <tr>
                <td>Contact</td>
                <td>
                    <input type="number" name="contact" value="<%=student.getString("student_contact")%>">
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <input type="email" name="email" value="<%=student.getString("student_email")%>">
                </td>
            </tr>
            <tr>
                <td>Address</td>
                <td>
                    <textarea name="address"><%=student.getString("student_address")%></textarea> 
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
                            <option value="<%=sd.getString("district_id")%>" <% if(sd.getString("district_id").equals(student.getString("district_id"))){out.print("selected"); } %>><%=sd.getString("district_name")%></option>
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
                         String selectplace="select * from tbl_place where district_id='"+student.getString("district_id")+"'";
                         ResultSet sp=con.selectCommand(selectplace);
                         while(sp.next())
                         {
                        %>
                            <option value="<%=sp.getString("place_id")%>" <% if(sp.getString("place_id").equals(student.getString("place_id"))){out.print("selected"); } %>><%=sp.getString("place_name")%></option>
                        <%
                         }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td>
                    <input type="date" name="dob" value="<%=student.getString("student_dob")%>">
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
