<%-- 
    Document   : Subject
    Created on : May 5, 2021, 2:10:22 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <%        String id = "", name = "", dis = "", st = "", dt = "";

        if (request.getParameter("edit") != null) {

            id = request.getParameter("edit");
            name = request.getParameter("name");
            dis = request.getParameter("id");
            dt = request.getParameter("dtid");
            st = request.getParameter("semid");

        }

        if (request.getParameter("btn_save") != null) {

            if (id.equals("")) {
                String insQry = "insert into tbl_subject(course_id,semester_id,subject_name)values('" + request.getParameter("sel_course") + "','" + request.getParameter("sel_semester") + "','" + request.getParameter("txt_subject") + "')";
                con.executeCommand(insQry);
                response.sendRedirect("Subject.jsp");
            } else {
                String upQry = "update tbl_subject set course_id='" + request.getParameter("sel_course") + "',course_id='" + request.getParameter("sel_semester") + "',subject_name='" + request.getParameter("txt_subject") + "'";
                con.executeCommand(upQry);
                response.sendRedirect("Subject.jsp");
            }
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_subject where subject_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Subject.jsp");
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
                                                    <h3 class="mb-0" >Table Subject</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="sel_dtype">Department Type</label>
                                                    <select required="" class="form-control" id="sel_dtype" onchange="getCourse(this.value)" name="sel_dtype">
                                                        <option value="">Select</option>
                                                        <%                                    String dQry = "select * from tbl_department_type";
                                                            ResultSet rs2 = con.selectCommand(dQry);
                                                            while (rs2.next()) {
                                                        %>
                                                        <option value="<%=rs2.getString("department_type_id")%>" <%if (dt.equals(rs2.getString("department_type_id"))) {
                                                                out.println("selected");
                                                            }%>><%=rs2.getString("department_type_name")%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                    
                                                <div class="form-group">
                                                    <label for="sel_course">Course</label>
                                                    <select required="" class="form-control" id="sel_course" name="sel_course">
                                                        <option value="">Select</option>
                                                    </select>
                                                </div>
                                                    <div class="form-group">
                                                    <label for="sel_semester">Semester</label>
                                                    <select required="" class="form-control" id="sel_semester" name="sel_semester">
                                                        <option value="">Select</option>
                                                        <%                                    
                                                            String sQry = "select * from tbl_semester";
                                                            ResultSet rss = con.selectCommand(sQry);
                                                            while (rss.next()) {
                                                        %>
                                                        <option value="<%=rss.getString("semester_id")%>" <%if (st.equals(rss.getString("semester_id"))) {
                                                                out.println("selected");
                                                            }%>><%=rss.getString("semester_name")%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_subject">Subject</label>
                                                    <input required="" type="text" class="form-control" id="txt_subject" value="<%=name%>" name="txt_subject">
                                                </div>

                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" name="btn_save" style="width:100px; border-radius: 10px 5px " value="Save">
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
                                                <td align="center" scope="col">Department Type</td>
                                                <td align="center" scope="col">Course</td>
                                                <td align="center" scope="col">Semester</td>
                                                <td align="center" scope="col">Subject</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                    int i = 0;
                                                String selQry = "select * from tbl_subject p inner join tbl_semester sem on sem.semester_id=p.semester_id inner join tbl_course d on d.course_id=p.course_id inner join tbl_department_type dt on d.department_type_id=dt.department_type_id";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("department_type_name")%></td>
                                                <td align="center"><%=rs.getString("course_name")%></td>
                                                <td align="center"><%=rs.getString("semester_name")%></td>
                                                <td align="center"><%=rs.getString("subject_name")%></td>
                                                <td align="center">
                                                    <a class="status_btn" href="Subject.jsp?del=<%=rs.getString("subject_id")%>" >Delete</a> &nbsp;&nbsp;&nbsp;&nbsp; 
                                                    <a class="status_btn" href="Subject.jsp?edit=<%=rs.getString("subject_id")%>&name=<%=rs.getString("subject_name")%>&id=<%=rs.getString("course_id")%>&dtid=<%=rs.getString("department_type_id")%>&semid=<%=rs.getString("semester_id")%>">Edit</a>
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
                                            <%@include file="Footer.jsp" %>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                                                        function getCourse(did)
                                                        {

                                                            $.ajax({url: "../Assets/AjaxPages/AjaxCourse.jsp?did=" + did,
                                                                success: function(result) {
                                                                    $("#sel_course").html(result);
                                                                }});
                                                        }
    </script>
</html>
