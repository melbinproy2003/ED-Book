<%-- 
    Document   : NewDepartment
    Created on : May 5, 2021, 9:55:55 PM
    Author     : Pro-TECH
--%>

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
      if(request.getParameter("btn_save")!=null)
      {
            
          String insQry = "insert into tbl_department(department_type_id,department_name,department_email,department_contact,department_landmark,department_photo,department_password,college_id)"
                  + "values('"+request.getParameter("sel_type")+"',"
                  + "'"+request.getParameter("txt_name")+"','"+request.getParameter("txt_email")+"','"+request.getParameter("txt_number")+"',"
                  + "'"+request.getParameter("txt_landmark")+"','"+request.getParameter("converted_photo")+"','"+request.getParameter("txt_password")+"','"+session.getAttribute("cid")+"')";
         System.out.println("query="+insQry);
          if(con.executeCommand(insQry))
          {
              %> 
        <script type="text/javascript">
            setTimeout(function() {
                window.location.href = 'DepartmentList.jsp'
            }, 40);//40millisecend it go to next page
        </script>
        <%
          }
      }
    
    %>
    <body>
        <div id="tab" align="center">
            <h1>Add New Department</h1>
            <form method="post" >
                <table border="1">
                     <tr>
                        <td>Name</td>
                        <td><input type="text" required="" name="txt_name"></td>
                    </tr>
                   
                    <tr>
                        <td>Contact</td>
                        <td><input type="text" required="" name="txt_number"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" required="" name="txt_email"></td>
                    </tr>
                    <tr>
                        <td>Landmark</td>
                        <td><textarea name="txt_landmark" required=""></textarea></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td>
                            <select name="sel_type" required="">
                                <option value="">-------Select-------</option>
                                <%
                                    String disQry = "select * from tbl_department_type";
                                    ResultSet rs = con.selectCommand(disQry);
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("department_type_id")%>"><%=rs.getString("department_type_name")%></option>
                                <%
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Photo</td>
                        <td><input type="file" id="file_photo" required="">
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
        <%@include file="Footer.jsp" %>

        <script>
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
    </body>
</html>

