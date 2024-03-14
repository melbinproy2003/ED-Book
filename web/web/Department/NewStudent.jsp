<%-- 
    Document   : NewStudent
    Created on : May 5, 2021, 9:58:30 PM
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
    <%        DateFormat yearf = new SimpleDateFormat("YYYY");
        DateFormat monthf = new SimpleDateFormat("MM");
        DateFormat dayf = new SimpleDateFormat("dd");

        String year = yearf.format(new Date());
        String month = monthf.format(new Date());
        String day = dayf.format(new Date());

        int yearnew = Integer.parseInt(year) - 16;

        String Date = String.valueOf(yearnew) + "-" + month + "-" + day;


    %>
    <%          if (request.getParameter("btn_save") != null) {

            String insQry = "insert into tbl_student(student_name,student_dob,student_contact,student_email,student_gender,student_address,student_photo,student_password,place_id,semester_id,department_id,course_id)"
                    + "values('" + request.getParameter("txt_name") + "','" + request.getParameter("date_dob") + "','" + request.getParameter("txt_contact") + "','" + request.getParameter("txt_email") + "',"
                    + "'" + request.getParameter("rdo_gender") + "','" + request.getParameter("txt_address") + "','" + request.getParameter("converted_photo") + "','" + request.getParameter("txt_password") + "',"
                    + "'" + request.getParameter("sel_place") + "','" + request.getParameter("sel_semester") + "','" + session.getAttribute("did") + "','" + request.getParameter("sel_course") + "')";
            if(con.executeCommand(insQry))
          {
              %> 
        <script type="text/javascript">
            setTimeout(function() {
                window.location.href = 'StudentList.jsp'
            }, 40);//40millisecend it go to next page
        </script>
        <%
          }

        }

    %>
    <body>
        <div id="tab" align="center">
            <h1>Add New Student</h1>
            <form method="post">
                <table border="1">
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txt_name"></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td><input type="date" max="<%=Date%>" name="date_dob"></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>
                            <input type="radio" name="rdo_gender" value="Male">Male
                            <input type="radio" name="rdo_gender" value="Female">Female
                            <input type="radio" name="rdo_gender" value="Others">Others
                        </td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><input type="text" name="txt_contact"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="txt_email"></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea name="txt_address"></textarea></td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td>
                            <select name="sel_district" onchange="getPlace(this.value)">
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
                            <select name="sel_place" id="sel_place">
                                <option value="">-------Select-------</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Course</td>
                        <td>
                            <select name="sel_course" >
                                <option value="">-------Select-------</option>
                                <%                                    String coQry = "select * from tbl_course where department_type_id='" + session.getAttribute("dtype") + "'";
                                    System.out.println(coQry);
                                    ResultSet rsc = con.selectCommand(coQry);
                                    while (rsc.next()) {
                                %>
                                <option value="<%=rsc.getString("course_id")%>"><%=rsc.getString("course_name")%></option>
                                <%
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Semester</td>
                        <td>
                            <select name="sel_semester" >
                                <option value="">-------Select-------</option>
                                <%                                    String semQry = "select * from tbl_semester";
                                    ResultSet rss = con.selectCommand(semQry);
                                    while (rss.next()) {
                                %>
                                <option value="<%=rss.getString("semester_id")%>"><%=rss.getString("semester_name")%></option>
                                <%
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Photo</td>
                        <td><input type="file" id="file_photo">
                            <input type="hidden" id="converted" name="converted_photo"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                   title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" name="txt_password"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="btn_save" value="Save"></td>
                    </tr>
                </table>
            </form>
        </div>
        <%@include file="Footer.jsp" %>
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
</html>



