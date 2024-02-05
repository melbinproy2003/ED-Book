<%-- 
    Document   : Editprofile
    Created on : 9 Dec, 2023, 2:29:46 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit College profile</title>
    </head>
    <%
     String select="select * from tbl_college c inner join tbl_university u on c.university_id=u.university_id inner join tbl_place p on c.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where college_id='"+session.getAttribute("collegeid")+"'";
     ResultSet college=con.selectCommand(select);
     college.next();
     if(request.getParameter("save") != null){
         String name=request.getParameter("name");
         String contact=request.getParameter("contact");
         String email=request.getParameter("email");
         String address=request.getParameter("address");
         String university=request.getParameter("university");
         String place=request.getParameter("place");
         String up="update tbl_college set college_name='"+name+"',college_contact='"+contact+"',college_email='"+email+"',college_address='"+address+"',university_id='"+university+"',place_id='"+place+"' where college_id='"+session.getAttribute("collegeid")+"'";
         con.executeCommand(up);
         response.sendRedirect("CollegeProfile.jsp");
     }
    %>
    <body>
        <h1 align="center">EDIT PROFILE</h1>
        <form method="post">
        <table border="1" align="center">
            <tr>
                <td>Name</td>
                <td>
                    <input type="text" name="name" value="<%=college.getString("college_name")%>">
                </td>
            </tr>
            <tr>
                <td>Contact</td>
                <td>
                    <input type="number" name="contact" value="<%=college.getString("college_contact")%>">
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <input type="email" name="email" value="<%=college.getString("college_email")%>">
                </td>
            </tr>
            
            <tr>
                <td>Address</td>
                <td>
                    <textarea name="address"><%=college.getString("college_address")%></textarea>
                </td>
            </tr>
            <tr>
                <td>University</td>
                <td>
                    <select name="university">
                        <%
                         String selectuniversity="select * from tbl_university";
                         ResultSet rs=con.selectCommand(selectuniversity);
                         while(rs.next())
                         {
                        %>
                            <option value="<%=rs.getString("university_id")%>" <% if(rs.getString("university_id").equals(college.getString("university_id"))){out.print("selected"); } %>><%=rs.getString("university_name")%></option>
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
                        <%
                         String selectdistrict="select * from tbl_district";
                         ResultSet sd=con.selectCommand(selectdistrict);
                         while(sd.next())
                         {
                        %>
                            <option value="<%=sd.getString("district_id")%>" <% if(sd.getString("district_id").equals(college.getString("district_id"))){out.print("selected"); } %>><%=sd.getString("district_name")%></option>
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
                         String selectplace="select * from tbl_place where district_id='"+college.getString("district_id")+"'";
                         ResultSet sp=con.selectCommand(selectplace);
                         while(sp.next())
                         {
                        %>
                            <option value="<%=sp.getString("place_id")%>" <% if(sp.getString("place_id").equals(college.getString("place_id"))){out.print("selected"); } %>><%=sp.getString("place_name")%></option>
                        <%
                         }
                        %>
                    </select>
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
