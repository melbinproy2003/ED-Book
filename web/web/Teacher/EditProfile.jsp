<%-- 
    Document   : EditProfile
    Created on : May 5, 2021, 2:15:04 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <%
        if(request.getParameter("btn_update")!=null)
        {
            
            String upQry = "update tbl_teacher set "
                    + "teacher_name='"+request.getParameter("txt_name")+"', "
                    + "teacher_contact='"+request.getParameter("txt_number")+"',"
                    + "teacher_email='"+request.getParameter("txt_email")+"',"
                    + "teacher_photo='"+request.getParameter("txt_pic")+"',"
                    + "teacher_address='"+request.getParameter("txt_address")+"'"
                    + "where teacher_id='"+session.getAttribute("tid")+"'";
            con.executeCommand(upQry);
            response.sendRedirect("ViewProfile.jsp");
            
        }
    
    
    %>
    <body>
        <div id="tab" align="center">
        <h1>Edit Profile</h1>
        <form method="post">
        <table border="1">
            <%
                String selQry = "select * from tbl_teacher where teacher_id='"+session.getAttribute("tid")+"'";
                ResultSet rs = con.selectCommand(selQry);
                if(rs.next())
                {
            %>
            <tr>
                        <td colspan="2" align="center"><img id="img_pic" src="<%=rs.getString("teacher_photo")%>" style="border-radius: 50%" width="120" height="120">
                            <input type="file" id="file_pic" style="display: none">
                            <input type="hidden" id="txt_pic" name="txt_pic">
                        </td>
                    </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="txt_name" value="<%=rs.getString("teacher_name")%>"></td>
            </tr>
             <tr>
                <td>Contact</td>
                <td><input type="text" name="txt_number" value="<%=rs.getString("teacher_contact")%>"></td>
            </tr>
             <tr>
                <td>Email</td>
                <td><input type="email" name="txt_email" value="<%=rs.getString("teacher_email")%>"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><textarea name="txt_address"><%=rs.getString("teacher_address")%></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Update" name="btn_update"></td>
            </tr>
            <%
                }
            %>
        </table>
        </form>
        </div>
            <%@include file="Footer.jsp" %>
            <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
            $('#img_pic').click(function() {
                $('#file_pic').trigger('click');
            });

            // Check for the File API support.
            if (window.File && window.FileReader && window.FileList && window.Blob) {
                document.getElementById('file_pic').addEventListener('change', handleFileSelect, false);
            } else {
                alert('The File APIs are not fully supported in this browser.');
            }

            function handleFileSelect(evt) {
                var f = evt.target.files[0]; // FileList object
                var reader = new FileReader();
                // Closure to capture the file information.
                reader.onload = (function(theFile) {
                    return function(e) {
                        var binaryData = e.target.result;
                        //Converting Binary Data to base 64
                        var base64String = window.btoa(binaryData);
                        //showing file converted to base64
                        document.getElementById('txt_pic').value = 'data:image/jpeg;base64,' + base64String;

                        //url to image
                        var url = 'data:image/jpeg;base64,' + base64String;
                        document.getElementById("img_pic").src=url;

                    };
                })(f);
                // Read in the image file as a data URL.
                reader.readAsBinaryString(f);
            }

        </script>
    </body>
</html>
