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
        <link rel="icon" type="image/png" href="../Assets/friendskit/assets/img/favicon.png" />
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/fontisto@v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet">
        <!-- Core CSS -->
        <link rel="stylesheet" href="../Assets/friendskit/assets/css/app.css">
        <link rel="stylesheet" href="../Assets/friendskit/assets/css/core.css">
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <body onload="loadPage()">
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
                                                <div onClick="window.location.href = 'CollegeList.jsp'" class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/admin/img/icon/College.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                                <%                                                                String csel = "select count(*) as c from tbl_college where college_status='1'";
                                                                    ResultSet cc = con.selectCommand(csel);
                                                                    if (cc.next()) {
                                                                        out.println(cc.getString("c"));
                                                                    }
                                                                %>
                                                            </span> </h3>
                                                        <p>Colleges</p>
                                                    </div>
                                                </div>
                                                <div onClick="window.location.href = 'DepartmentList.jsp'" class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/admin/img/icon/Department.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                                <%
                                                                    String dsel = "select count(*) as c from tbl_department";
                                                                    ResultSet dc = con.selectCommand(dsel);
                                                                    if (dc.next()) {
                                                                        out.println(dc.getString("c"));
                                                                    }
                                                                %>
                                                            </span> </h3>
                                                        <p>Departments</p>
                                                    </div>
                                                </div>
                                                <div onClick="window.location.href = 'TeacherList.jsp'" class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/admin/img/icon/professor.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                                <%
                                                                    String tsel = "select count(*) as c from tbl_teacher";
                                                                    ResultSet tc = con.selectCommand(tsel);
                                                                    if (tc.next()) {
                                                                        out.println(tc.getString("c"));
                                                                    }
                                                                %>
                                                            </span> </h3>
                                                        <p>Teachers</p>
                                                    </div>
                                                </div>
                                                <div onClick="window.location.href = 'StudentList.jsp'" class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/admin/img/icon/Student.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"> 
                                                                <%
                                                                    String ssel = "select count(*) as c from tbl_student";
                                                                    ResultSet sc = con.selectCommand(ssel);
                                                                    if (sc.next()) {
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
                        <!--view profile-->
                        <!-- Feed page main wrapper -->
                        <!--                <div id="activity-feed" class="view-wrap true-dom is-hidden">
                                            <div class="columns">-->

                        <!-- Middle column -->
                        <div class="column is-8">

                            <!-- Publishing Area -->
                            <!-- /partials/pages/feed/compose-card.html -->

                            <!-- POST #1 -->
                            <div id="post-load">

                            </div>
                            <!-- POST #1 -->
                            <!-- Load more posts -->
                            <div class=" load-more-wrap has-text-centered">
                                <a href="#" class="load-more-button" onclick="loadPage()">Load More</a>
                            </div>
                            <!-- /Load more posts -->

                        </div>
                        <!--                    </div>
                                        </div>-->

                    </div>
                </div>
            </div>
        </section>

        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
                                    function deletePost(id)
                                    {


                                        $.ajax({url: "../Assets/AjaxPages/AjaxDeletePost.jsp?id=" + id,
                                            success: function() {
                                                loadPage();
                                            }});

                                    }
                                    function loadPage()
                                    {
                                        $("#post-load").load('../Assets/AjaxPages/AjaxUniversityPostLoad.jsp');
                                    }
        </script>

        <!-- Concatenated js plugins and jQuery -->
        <script src="../Assets/friendskit/assets/js/app.js"></script>
        <script src="https://js.stripe.com/v3/"></script>
        <script src="../Assets/friendskit/assets/data/tipuedrop_content.js"></script>

        <!-- Core js -->
        <script src="../Assets/friendskit/assets/js/global.js"></script>

        <!-- Navigation options js -->
        <script src="../Assets/friendskit/assets/js/navbar-v1.js"></script>
        <script src="../Assets/friendskit/assets/js/navbar-v2.js"></script>
        <script src="../Assets/friendskit/assets/js/navbar-mobile.js"></script>
        <script src="../Assets/friendskit/assets/js/navbar-options.js"></script>
        <script src="../Assets/friendskit/assets/js/sidebar-v1.js"></script>

        <!-- Core instance js -->
        <script src="../Assets/friendskit/assets/js/main.js"></script>
        <script src="../Assets/friendskit/assets/js/chat.js"></script>
        <script src="../Assets/friendskit/assets/js/touch.js"></script>
        <script src="../Assets/friendskit/assets/js/tour.js"></script>
        <!-- Components js -->
        <script src="../Assets/friendskit/assets/js/explorer.js"></script>
        <script src="../Assets/friendskit/assets/js/widgets.js"></script>
        <script src="../Assets/friendskit/assets/js/modal-uploader.js"></script>
        <script src="../Assets/friendskit/assets/js/popovers-users.js"></script>
        <script src="../Assets/friendskit/assets/js/popovers-pages.js"></script>
        <script src="../Assets/friendskit/assets/js/lightbox.js"></script>

        <script src="../Assets/friendskit/assets/js/feed.js"></script>

        <script src="../Assets/friendskit/assets/js/webcam.js"></script>
        <script src="../Assets/friendskit/assets/js/compose.js"></script>
        <script src="../Assets/friendskit/assets/js/autocompletes.js"></script>
    </body>
    <%@include file="Footer.jsp" %>
</html>
