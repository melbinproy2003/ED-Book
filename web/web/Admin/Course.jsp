<%-- 
    Document   : Course
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
        <title>Course</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <%     

        if (request.getParameter("btn_save") != null) {

                String insQry = "insert into tbl_course(department_type_id,course_name,sem_count,university_id)values('" + request.getParameter("sel_department_type") + "','" + request.getParameter("txt_course") + "','" + request.getParameter("txt_count") + "','" + request.getParameter("sel_university") + "')";
                con.executeCommand(insQry);
                response.sendRedirect("Course.jsp");
            
        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_course where course_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Course.jsp");
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
                                                    <h3 class="mb-0" >Table Course</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="sel_department_type">Select University</label>
                                                    <select required="" class="form-control" name="sel_university" id="sel_department_type">
                                                        <option value="" >Select</option>
                                                        <%                                                            String disQryu = "select * from tbl_university";
                                                            ResultSet rs1u = con.selectCommand(disQryu);
                                                            while (rs1u.next()) {
                                                        %>
                                                        <option value="<%=rs1u.getString("university_id")%>" ><%=rs1u.getString("university_name")%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sel_department_type">Select Department Type</label>
                                                    <select required="" class="form-control" name="sel_department_type" id="sel_department_type">
                                                        <option value="" >Select</option>
                                                        <%                                                            String disQry = "select * from tbl_department_type";
                                                            ResultSet rs1 = con.selectCommand(disQry);
                                                            while (rs1.next()) {
                                                        %>
                                                        <option value="<%=rs1.getString("department_type_id")%>" ><%=rs1.getString("department_type_name")%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_course">Course Name</label>
                                                    <input required="" type="text" class="form-control" id="txt_course" name="txt_course">
                                                </div>
                                                 <div class="form-group">
                                                    <label for="txt_course">Sem Count</label>
                                                    <input required="" type="text" class="form-control" id="txt_course" name="txt_count">
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
                                                <td align="center" scope="col">Count</td>
                                                <td align="center" scope="col">University</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_course p inner join tbl_department_type d on d.department_type_id=p.department_type_id inner join tbl_university u on u.university_id=p.university_id";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>    
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("department_type_name")%></td>
                                                <td align="center"><%=rs.getString("course_name")%></td>
                                                <td align="center"><%=rs.getString("sem_count")%></td>
                                                <td align="center"><%=rs.getString("university_name")%></td>
                                                <td align="center"> 
                                                    <a href="Course.jsp?del=<%=rs.getString("course_id")%>" class="status_btn">Delete</a> 
                                                </td> 
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
    <%@include file="Footer.jsp" %>
</html>
