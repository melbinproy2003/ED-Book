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
        <title>University</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <%        if (request.getParameter("btn_save") != null) {

            String insQry = "insert into tbl_university(university_name,university_photo)"
                    + "values('" + request.getParameter("txt_university") + "','" + request.getParameter("converted_photo") + "')";
            System.out.println("query=" + insQry);
            if (con.executeCommand(insQry)) {
    %> 
    <script type="text/javascript">
        setTimeout(function() {
            window.location.href = 'University.jsp'
        }, 40);//40millisecend it go to next page
    </script>
    <%
            }
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_university where university_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("University.jsp");
        }


    %>
    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <!--Form-->
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table University</h3>
                                                </div>
                                            </div>
                                            <form method="post">
                                                <div class="form-group">
                                                    <label for="txt_university">University Name</label>
                                                    <input required="" type="text" class="form-control" id="txt_university" name="txt_university" >
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_university">University Photo</label>
                                                    <input type="file" id="file_photo" required="" class="form-control" >
                                                    <input type="hidden" id="converted" name="converted_photo">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">University</td>
                                                <td align="center" scope="col">Photo</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_university";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("university_name")%></td>
                                                <td align="center"><img src="<%=rs.getString("university_photo")%>"/></td>
                                                <td align="center"><a href="University.jsp?del=<%=rs.getString("university_id")%>" class="status_btn">Delete</a></td>
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
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
    <%@include file="Footer.jsp" %>
</html>
