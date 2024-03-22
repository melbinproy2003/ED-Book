<%-- 
    Document   : University
    Created on : May 5, 2021, 2:10:08 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Post</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp"%>
    </head>
    <% 
        if (request.getParameter("btn_save") != null) {
            String uid=request.getParameter("txt_university");
            String Content=request.getParameter("content");
            String File=request.getParameter("converted_photo");
            
            String usel="select * from tbl_university where university_id='"+uid+"'";
            ResultSet s=con.selectCommand(usel);
            s.next();
            String uphoto=s.getString("university_photo");
            String uname=s.getString("university_name");

            String insQry = "insert into tbl_post(post_date,university_id,university_name,college_photo,department_photo,teacher_photo,student_photo,post_content,post_file,university_photo)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'"+uid+"','"+uname+"','0','0','0','0','"+Content+"','"+File+"','"+uphoto+"')";
    System.out.println(insQry);
            if (con.executeCommand(insQry)) {
    %> 
    <script type="text/javascript">
        setTimeout(function() {
            window.location.href = 'HomePage.jsp'
        }, 40);//40millisecend it go to next page
    </script>
    <%
            }
        }
    %>
    <body>
         <section class="main_content dashboard_part">
        <div class="main_content_iner">
            <div class="container-fluid p-0">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="QA_section">
                            <div class="white_box_tittle list_header">
                                <div class="col-lg-12">
                                    <div class="white_box mb-30">
                                        <div class="box_header">
                                            <div class="main-title">
                                                <h3 class="mb-0">University Post</h3>
                                            </div>
                                        </div>
                                        <form method="post">
                                            <div class="form-group">
                                                <label for="txt_university">University Name</label>
                                                <select required class="form-control" id="txt_university" name="txt_university">
                                                    <option value="">---select---</option>
                                                    <%
                                                        String selectu="select * from tbl_university";
                                                        ResultSet rsu=con.selectCommand(selectu);
                                                        while(rsu.next()){
                                                    %>
                                                        <option value="<%=rsu.getString("university_id")%>"><%=rsu.getString("university_name")%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="txt_university">Post Content</label>
                                                <textarea id="post_content" name="content" class="form-control"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="file_photo">Post Image</label>
                                                <input type="file" id="file_photo" name="post_image" required class="form-control">
                                                <input type="hidden" id="converted" name="converted_photo">
                                            </div>
                                            <div class="form-group" align="center">
                                                <input type="submit" class="btn btn-dark" style="width:100px; border-radius: 10px 5px" name="btn_save" value="Save">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Check for the File API support.
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            document.getElementById('file_photo').addEventListener('change', handleFileSelect, false);
        } else {
            alert('The File APIs are not fully supported in this browser.');
        }

        function handleFileSelect(evt) {
            var file = evt.target.files[0]; // File object
            var reader = new FileReader();

            // Closure to capture the file information.
            reader.onload = function (e) {
                var base64String = e.target.result;
                // Set the base64 string as the value of the converted input field
                document.getElementById('converted').value = base64String;
            };

            // Read in the image file as a data URL.
            reader.readAsDataURL(file);
        }
    </script>
</body>
<%@include file="Footer.jsp" %>
</html>
