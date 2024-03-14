<%-- 
    Document   : HomePage
    Created on : May 5, 2021, 2:13:50 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <body>
        <section class="main_content dashboard_part">
            <!-- menu  -->
           
            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="single_element">
                                <div class="quick_activity">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="quick_activity_wrap">
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/admin/img/icon/College.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                            <%
                                                            String csel = "select count(*) as c from tbl_college where college_status='1'";
                                                            ResultSet cc = con.selectCommand(csel);
                                                            if(cc.next())
                                                            {
                                                                out.println(cc.getString("c"));
                                                            }
                                                            %>
                                                            </span> </h3>
                                                        <p>Colleges</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/admin/img/icon/Department.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                            <%
                                                            String dsel = "select count(*) as c from tbl_department";
                                                            ResultSet dc = con.selectCommand(dsel);
                                                            if(dc.next())
                                                            {
                                                                out.println(dc.getString("c"));
                                                            }
                                                            %>
                                                            </span> </h3>
                                                        <p>Departments</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/admin/img/icon/professor.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                            <%
                                                            String tsel = "select count(*) as c from tbl_teacher";
                                                            ResultSet tc = con.selectCommand(tsel);
                                                            if(tc.next())
                                                            {
                                                                out.println(tc.getString("c"));
                                                            }
                                                            %>
                                                            </span> </h3>
                                                        <p>Teachers</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/admin/img/icon/Student.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"> 
                                                                <%
                                                            String ssel = "select count(*) as c from tbl_student";
                                                            ResultSet sc = con.selectCommand(ssel);
                                                            if(sc.next())
                                                            {
                                                                out.println(sc.getString("c"));
                                                            }
                                                            %>
                                                            </span> </h3>
                                                        <p>Students</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Colleges</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">
                                    
                                    
                                    <%
                                    String cQry = "select * from tbl_college c inner join tbl_place p on p.place_id=c.place_id ORDER BY RAND()";
                                    ResultSet crs = con.selectCommand(cQry);
                                    while(crs.next())
                                    {
                                    
                                    %>
                                    
                                    
                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="<%=crs.getString("college_photo")%>" alt="">
                                        </div>
                                        <h4><%=crs.getString("college_name")%></h4>
                                        <p><%=crs.getString("place_name")%></p>
                                    </div>
                                    
                                    
                                    
                                   <%
                                   
                                    }
                                   %>
                                </div>
                            </div>
                        </div>
                                <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Departments</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">
                                    
                                    
                                    <%
                                    String dQry = "select * from tbl_department d inner join tbl_college c on c.college_id=d.college_id inner join tbl_department_type dt on dt.department_type_id=d.department_type_id ORDER BY RAND()";
                                    ResultSet drs = con.selectCommand(dQry);
                                    while(drs.next())
                                    {
                                    
                                    %>
                                    
                                    
                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="<%=drs.getString("department_photo")%>" alt="">
                                        </div>
                                        <h4><%=drs.getString("department_type_name")%></h4>
                                        <p><%=drs.getString("college_name")%></p>
                                    </div>
                                    
                                    
                                    
                                   <%
                                   
                                    }
                                   %>
                                </div>
                            </div>
                        </div>
                                <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Teachers</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">
                                    
                                    
                                    <%
                                    String tQry = "select * from tbl_teacher t inner join tbl_department d on d.department_id=t.department_id inner join tbl_college c on c.college_id=d.college_id ORDER BY RAND()";
                                    ResultSet trs = con.selectCommand(tQry);
                                    while(trs.next())
                                    {
                                    
                                    %>
                                    
                                    
                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="<%=trs.getString("teacher_photo")%>" alt="">
                                        </div>
                                        <h4><%=trs.getString("teacher_name")%></h4>
                                        <p><%=trs.getString("college_name")%></p>
                                    </div>
                                    
                                    
                                    
                                   <%
                                   
                                    }
                                   %>
                                </div>
                            </div>
                        </div>
                                <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Students</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">
                                    
                                    
                                    <%
                                    String sQry = "select * from tbl_student s inner join tbl_course co on co.course_id=s.course_id inner join tbl_department d on d.department_id=s.department_id inner join tbl_college c on d.college_id=c.college_id ORDER BY RAND()";
                                    ResultSet srs = con.selectCommand(sQry);
                                    while(srs.next())
                                    {
                                    
                                    %>
                                    
                                    
                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="<%=srs.getString("student_photo")%>" alt="">
                                        </div>
                                        <h4><%=srs.getString("student_name")%></h4>
                                        <p><%=srs.getString("college_name")%></p>
                                        <p><%=srs.getString("course_name")%></p>
                                    </div>
                                    
                                    
                                    
                                   <%
                                   
                                    }
                                   %>
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
