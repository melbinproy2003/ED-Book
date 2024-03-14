<%-- 
    Document   : NewStaff
    Created on : May 5, 2021, 9:57:44 PM
    Author     : Pro-TECH
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>College</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <%
        DateFormat yearf = new SimpleDateFormat("YYYY");
        DateFormat monthf = new SimpleDateFormat("MM");
        DateFormat dayf = new SimpleDateFormat("dd");

        String year = yearf.format(new Date());
        String month = monthf.format(new Date());
        String day = dayf.format(new Date());

        int yearnew = Integer.parseInt(year) - 24;
        
        String Date = String.valueOf(yearnew)+"-"+month+"-"+day;

     

    %>
      <%
        if(request.getParameter("btn_save")!=null)
        {
            
            String insQry = "insert into tbl_teacher(teacher_name,teacher_dob,teacher_contact,teacher_email,teacher_gender,teacher_address,teacher_photo,teacher_password,place_id,department_id,teacher_about)"
                    + "values('"+request.getParameter("txt_name")+"','"+request.getParameter("date_dob")+"','"+request.getParameter("txt_contact")+"','"+request.getParameter("txt_email")+"',"
                    + "'"+request.getParameter("rdo_gender")+"','"+request.getParameter("txt_address")+"','"+request.getParameter("converted_photo")+"','"+request.getParameter("txt_password")+"',"
                    + "'"+request.getParameter("sel_place")+"','"+session.getAttribute("did")+"','"+request.getParameter("txt_about")+"')";

             if(con.executeCommand(insQry))
          {
              %> 
        <script type="text/javascript">
            setTimeout(function() {
                window.location.href = 'StaffList.jsp'
            }, 40);//40millisecend it go to next page
        </script>
        <%
          }
            
        }
    
    %>
    <body>
        <div id="tab" align="center">
            <h1> Add New Staff</h1>
            <form method="post">
                <table border="1">
                    <tr>
                        <td>Name</td>
                        <td><input type="text" required="" name="txt_name"></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td><input type="date" required="" max="<%=Date%>" name="date_dob"></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td> 
                            <input type="radio" required="" name="rdo_gender" value="Male">Male
                            <input type="radio" name="rdo_gender" value="Female">Female
                            <input type="radio" name="rdo_gender" value="Others">Others
                        </td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><input type="text" required="" pattern="{10,12}" name="txt_contact"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" required="" name="txt_email"></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea name="txt_address" required=""></textarea></td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td>
                            <select name="sel_district" required="" onchange="getPlace(this.value)">
                                <option value="">-------Select-------</option>
                                <%
                                    String disQry = "select * from tbl_district";
                                    ResultSet rs = con.selectCommand(disQry);
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                <%
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Place</td>
                        <td>
                            <select name="sel_place" required="" id="sel_place">
                                <option value="">-------Select-------</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>About</td>
                        <td><textarea name="txt_about" required=""></textarea></td>
                    </tr>
                    <tr>
                        <td>Photo</td>
                        <td><input type="file" required="" id="file_photo">
                            <input type="hidden" id="converted" name="converted_photo"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                         title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" name="txt_password"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="btn_save" value="Save"></td>
                    </tr>
                </table>
            </form>
        </div>
               
    </body>
   <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                                function getPlace(did)
                                {

                                    $.ajax({url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                        success: function(result) {
                                            $("#sel_place").html(result);
                                        }});
                                }
                                // Check for the File API support.
                                if (window.File && window.FileReader && window.FileList && window.Blob) {
                                    document.getElementById('file_photo').addEventListener('change', handleFileSelect, false);
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
                                            document.getElementById('converted').value = 'data:image/jpeg;base64,' + base64String;

//                                            //url to image
//                                            var url = 'data:image/jpeg;base64,' + base64String;
//                                            img.src = url;
//                                            document.body.img.appendChild(img);

                                        };
                                    })(f);
                                    // Read in the image file as a data URL.
                                    reader.readAsBinaryString(f);
                                }

    </script>
                     <%@include file="Footer.jsp" %>
</html>


