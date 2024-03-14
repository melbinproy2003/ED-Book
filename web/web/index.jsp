<%-- 
    Document   : Login
    Created on : May 5, 2021, 2:13:16 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta http-equiv="x-ua-compatible" content="ie=edge">

            <title>Login</title>

            <!-- Core CSS -->
            <link rel="stylesheet" href="Assets/friendskit/assets/css/bulma.css">
            <link rel="stylesheet" href="Assets/friendskit/assets/css/app.css">
            <link rel="stylesheet" href="Assets/friendskit/assets/css/core.css">

        </head>
    <%

        if (request.getParameter("btn_login") != null) {

            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");
            String admin = "select * from tbl_admin where admin_email ='" + email + "' and admin_password='" + password + "' ";
            ResultSet rsA = con.selectCommand(admin);

            String college = "select * from tbl_college where college_email ='" + email + "' and college_password='" + password + "'";
            ResultSet rsC = con.selectCommand(college);

            String department = "select * from tbl_department d inner join tbl_college c on c.college_id=d.college_id where department_email = '" + email + "' and department_password= '" + password + "'";
            ResultSet rsD = con.selectCommand(department);

            String teacher = "select * from tbl_teacher t inner join tbl_department d on t.department_id=d.department_id inner join tbl_department_type dt on dt.department_type_id=d.department_type_id inner join tbl_college c on c.college_id=d.college_id where teacher_email =  '" + email + "' and teacher_password= '" + password + "'";
            ResultSet rsT = con.selectCommand(teacher);

            String student = "select * from tbl_student s inner join tbl_department d on s.department_id=d.department_id inner join tbl_college c on c.college_id=d.college_id where student_email = '" + email + "' and student_password= '" + password + "'";
            ResultSet rsS = con.selectCommand(student);

            if (rsA.next()) {
                session.setAttribute("aid", rsA.getString("admin_id"));
                session.setAttribute("aname", rsA.getString("admin_name"));
                response.sendRedirect("Admin/HomePage.jsp");
            } else if (rsC.next()) {
                if (rsC.getString("college_status").equals("1")) {

                    session.setAttribute("cid", rsC.getString("college_id"));
                    session.setAttribute("cname", rsC.getString("college_name"));
                    session.setAttribute("cphoto", rsC.getString("college_photo"));
                    session.setAttribute("cemail", rsC.getString("college_email"));
                    response.sendRedirect("College/HomePage.jsp");

                } else if (rsC.getString("college_status").equals("0")) {

    %> 
    <script type="text/javascript">
        alert("Wait for response......");
        setTimeout(function() {
            window.location.href = 'index.jsp'
        }, 100);
    </script>
    <%        } else if (rsC.getString("college_status").equals("2")) {

    %> 
    <script type="text/javascript">
        alert("Rejected.....!!!!");
        setTimeout(function() {
            window.location.href = 'index.jsp'
        }, 100);
    </script>
    <%        }
    } else if (rsD.next()) {
        session.setAttribute("did", rsD.getString("department_id"));
        session.setAttribute("dname", rsD.getString("department_name"));
        session.setAttribute("dphoto", rsD.getString("department_photo"));
        session.setAttribute("dcid", rsD.getString("college_id"));
        session.setAttribute("dcname", rsD.getString("college_name"));
        session.setAttribute("dcphoto", rsD.getString("college_photo"));
        session.setAttribute("dtype", rsD.getString("department_type_id"));
        session.setAttribute("demail", rsD.getString("department_email"));
        response.sendRedirect("Department/HomePage.jsp");
    } else if (rsT.next()) {
        session.setAttribute("tid", rsT.getString("teacher_id"));
        session.setAttribute("tname", rsT.getString("teacher_name"));
        session.setAttribute("tcid", rsT.getString("college_id"));
        session.setAttribute("tdid", rsT.getString("department_id"));
        session.setAttribute("tdtid", rsT.getString("department_type_id"));
        session.setAttribute("tdname", rsT.getString("department_name"));
        session.setAttribute("tdphoto", rsT.getString("department_photo"));
        session.setAttribute("tphoto", rsT.getString("teacher_photo"));
        session.setAttribute("temail", rsT.getString("teacher_email"));
        response.sendRedirect("Teacher/HomePage.jsp");
    } else if (rsS.next()) {
        session.setAttribute("sid", rsS.getString("student_id"));
        session.setAttribute("sname", rsS.getString("student_name"));
        session.setAttribute("scid", rsS.getString("college_id"));
        session.setAttribute("ssid", rsS.getString("semester_id"));
        session.setAttribute("sdid", rsS.getString("department_id"));
        session.setAttribute("sdname", rsS.getString("department_name"));
        session.setAttribute("sdphoto", rsS.getString("department_photo"));
        session.setAttribute("sphoto", rsS.getString("student_photo"));
        session.setAttribute("semail", rsS.getString("student_email"));
        response.sendRedirect("Student/HomePage.jsp");

    } else {

    %> 
    <script type="text/javascript">
        alert("Invalid Login Credentials");
        setTimeout(function() {
            window.location.href = 'index.jsp'
        }, 100);
    </script>
    <%            }
        }
    %>
    <body>

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>
        <div class="signup-wrapper">

            <!--        Fake navigation
                    <div class="fake-nav">
                        <a href="/" class="logo" style="font-weight:bolder;font-size: xx-large;color: dimgray;" >
                         College-Connect
                            
                        </a>
                    </div>-->

            <div class="container">
                <!--Container-->
                <div class="login-container">
                    <div class="columns is-vcentered">
                        <div class="column is-6 image-column">
                            <!--Illustration-->
                            <img class="light-image login-image" src="Assets/friendskit/assets/img/illustrations/login.svg" alt="">
                            <img class="dark-image login-image" src="Assets/friendskit/assets/img/illustrations/login-dark.svg" alt="">
                        </div>
                        <div class="column is-6">

                            <h2 class="form-title">Welcome </h2>
                            <h3 class="form-subtitle">Enter your credentials to sign in.</h3>

                            <!--Form-->

                            <form method="post">
                                <div class="login-form">
                                    <div class="form-panel">
                                        <div class="field">
                                            <label>Email</label>
                                            <div class="control">
                                                <input type="email" id="input" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                                       class="input" autocomplete="off"  name="txt_email" placeholder="Enter your Email" required="required"/>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label>Password</label>
                                            <div class="control">
                                                <input type="password" class="input" name="txt_password" placeholder="Enter your password" required="required"/>
<!--                                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                                       title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" -->
                                                       
                                            </div>
                                        </div>
                                        <br><br>
                                    </div>
                                    <div class="buttons">
                                        <button class="button is-solid primary-button is-fullwidth raised" type="submit"  name="btn_login"><span>Login</span></button>                    
                                    </div>
                                    <div align="right" >
                                        <a href="SignUp.jsp"><span>sign up -></span></a>                    
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Concatenated js plugins and jQuery -->
        <script src="Assets/friendskit/assets/js/app.js"></script>

        <!-- Core js -->
        <script src="Assets/friendskit/assets/data/tipuedrop_content.js"></script>
        <script src="Assets/friendskit/assets/js/global.js"></script>
        <script src="Assets/friendskit/assets/js/main.js"></script>

        <!-- Page and UI related js -->
        <script src="Assets/friendskit/assets/js/signup.js"></script>
    </body>

</html>