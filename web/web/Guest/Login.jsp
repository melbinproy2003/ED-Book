<%-- 
    Document   : Login
    Created on : 9 Dec, 2023, 12:05:28 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Modernize Free</title>
  <link rel="shortcut icon" type="image/png" href="../Assets/Login/images/logos/favicon.png" />
  <link rel="stylesheet" href="../Assets/Login/css/styles.min.css" />
</head>
<%
     if(request.getParameter("login")!=null){
         String email=request.getParameter("email");
         String password=request.getParameter("password");
         String selectadmin="select * from tbl_admin where admin_email='"+email+"' and admin_password='"+password+"'";
         ResultSet admin=con.selectCommand(selectadmin);
         String selectcollege="select * from tbl_college c inner join tbl_university u on c.university_id=u.university_id where college_email='"+email+"' and college_password='"+password+"'";
         ResultSet college=con.selectCommand(selectcollege);
         String selectdepartment="select * from tbl_department d inner join tbl_departmenttype dt on d.departmenttype_id=dt.departmenttype_id inner join tbl_college col on d.college_id=col.college_id inner join tbl_university u on col.university_id=u.university_id  where department_email='"+email+"' and department_password='"+password+"'";
         ResultSet department=con.selectCommand(selectdepartment);
         String selectstudent="select * from tbl_student s inner join tbl_course c on s.course_id=c.course_id inner join tbl_department dep on s.department_id=dep.department_id inner join tbl_college col on dep.college_id=col.college_id inner join tbl_university un on col.university_id=un.university_id where student_email='"+email+"' and student_password='"+password+"'";
         ResultSet student=con.selectCommand(selectstudent);
         String selectteacher="select * from tbl_teacher t inner join tbl_department dep on t.department_id=dep.department_id inner join tbl_college col on dep.college_id=col.college_id inner join tbl_university un on col.university_id=un.university_id where teacher_email='"+email+"' and teacher_password='"+password+"'";
         ResultSet teacher=con.selectCommand(selectteacher);
//         college
         if(college.next()){
             int status=college.getInt("college_status");
             if(status==0){
                 out.println("Admin is Not Verified");
             }
             else if(status==1){
                session.setAttribute("collegeid", college.getString("college_id"));
                session.setAttribute("collegename", college.getString("college_name"));
                session.setAttribute("universityid", college.getString("university_id"));
                response.sendRedirect("../College/Homepage.jsp");
             }
             else{
                 out.println("Not Able to Login");
             }
         }
//         Department
         else if(department.next()){
                session.setAttribute("departmentid", department.getString("department_id"));
                session.setAttribute("departmentname", department.getString("departmenttype_name"));
                session.setAttribute("collegeid", department.getString("college_id"));
                session.setAttribute("universityid", department.getString("university_id"));
                session.setAttribute("departmenttypeid", department.getString("departmenttype_id"));
                response.sendRedirect("../Department/HomePage.jsp");
             }
//         Student
         else if(student.next()){
                session.setAttribute("studentid", student.getString("student_id"));
                session.setAttribute("studentname", student.getString("student_name"));
                session.setAttribute("courseid", student.getString("course_id"));
                session.setAttribute("departmentid", student.getString("department_id"));
                session.setAttribute("collegeid", student.getString("college_id"));
                session.setAttribute("universityid", student.getString("university_id"));
                response.sendRedirect("../Student/Homepage.jsp");
             }
//         Teacher
         else if(teacher.next()){
                session.setAttribute("teacherid", teacher.getString("teacher_id"));
                session.setAttribute("teachername", teacher.getString("teacher_name"));
                session.setAttribute("universityid", teacher.getString("university_id"));
                session.setAttribute("collegeid", teacher.getString("college_id"));
                session.setAttribute("departmentid", teacher.getString("department_id"));
                response.sendRedirect("../Teacher/Homepage.jsp");
             }
//         Admin
         else if(admin.next()){
                session.setAttribute("adminid", admin.getString("admin_id"));
                session.setAttribute("adminname", admin.getString("admin_name"));
                response.sendRedirect("../Admin/Homepage.jsp");
             }
         else{
             out.println("Email or Password is Mismatchinng");
         }
     }
    %>
<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <!-- <a href="./index.html" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="../assets/images/logos/dark-logo.svg" width="180" alt="">
                </a> -->
                <p class="text-center">Your Social Campaigns</p>
                <form method="post">
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email</label>
                    <input type="email" class="form-control" aria-describedby="emailHelp" name="email">
                  </div>
                  <div class="mb-4">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password">
                  </div>
                  <input type="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2" name="login" value="Login">
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="../Assets/Login/libs/jquery/dist/jquery.min.js"></script>
  <script src="../Assets/Login/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>