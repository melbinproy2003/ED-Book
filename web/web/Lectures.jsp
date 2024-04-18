<%-- 
    Document   : Lectures
    Created on : May 14, 2021, 10:17:57 PM
    Author     : Pro-TECH
--%>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con" />
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lecture</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Lectures</a>
  </div>
</nav>
    <%-- Fetching student information --%>
    <%
        String studentQuery = "select * from tbl_student where student_id='" + request.getParameter("uid") + "'";
        ResultSet studentResult = con.selectCommand(studentQuery);
        studentResult.next();
    %>

    <%-- Displaying lecture cards --%>
    <div class="container">
        <%          
            int i = 0;
            String lectureQuery = "select * from tbl_lecture l inner join tbl_subject s on s.subject_id=l.subject_id inner join tbl_teacher t on t.teacher_id=l.teacher_id where s.semester_id = '" + studentResult.getString("semester_id") + "'";
            ResultSet lectureResultSet = con.selectCommand(lectureQuery);
            while (lectureResultSet.next()) {
                i++;
                String format = "none";
                String fileName = lectureResultSet.getString("lecture_file");
                int index = fileName.lastIndexOf(".");
                if (index > 0) {
                    format = fileName.substring(index + 1);
                    format = format.toLowerCase();
                }
        %>

        <div class="card text-center mt-3">
            <div class="card-header">
                <%= lectureResultSet.getString("subject_name") %>
            </div>
            <div class="card-body">
                <h5 class="card-title"><%= lectureResultSet.getString("teacher_name") %></h5>
                <p class="card-text"><%= lectureResultSet.getString("lecture_content") %></p>
                <button class="btn btn-warning">
                    <%-- Generating download link based on file format --%>
                    <%
                        if (format.equals("png") || format.equals("jpg") || format.equals("jpeg")) {
                    %>
                            <a href='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' download>
                                <img src='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' width='120' height='120' alt='<%= lectureResultSet.getString("lecture_file") %>'>
                            </a>
                    <% 
                        } else if (format.equals("pdf") || format.equals("doc") || format.equals("txt")) {
                    %>
                            <a href='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' download>Download This Document</a>
                    <% 
                        } else if (format.equals("mp3") || format.equals("ogg") || format.equals("m4a")) {
                    %>
                            <audio controls>
                                <source src='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' type='audio/mp3'>
                                <source src='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' type='audio/ogg'>
                                <source src='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' type='audio/m4a'>
                                Your browser does not support the audio element.
                            </audio>
                    <% 
                        } else if (format.equals("mp4") || format.equals("mov") || format.equals("avi") || format.equals("mkv")) {
                    %>
                            <video width='350' controls>
                                <source src='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' type='video/mp4'>
                                <source src='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' type='video/mov'>
                                <source src='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' type='video/avi'>
                                <source src='Assets/LectureAssets/Lectures/<%= lectureResultSet.getString("lecture_file") %>' type='video/mkv'>
                                Your browser does not support the video tag.
                            </video>
                    <% 
                        }
                    %>
                </button>
            </div>
            <div class="card-footer text-muted">
                uploaded on <%= lectureResultSet.getString("lecture_date") %>
               
            </div>
        </div>

        <% 
            }
        %>
    </div>

    <%@include file="Student/Footer.jsp" %>
    <script src="Assets/JQuery/jQuery.js"></script>
    <script>
        function getSubject(sid)
        {
            var id = document.getElementById("sel_cou").value;
            $.ajax({
                url: "Assets/AjaxPages/AjaxLecture.jsp?sid=" + sid + "&id=" + id,
                success: function(result) {
                    $("#sel_sub").html(result);
                }
            });
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
