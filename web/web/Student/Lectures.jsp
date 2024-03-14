<%-- 
    Document   : Lectures
    Created on : May 14, 2021, 10:17:57 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lecture</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
            <h1>Lecture</h1>
                <table>
                    <tr>
                        <th>sl.no</th>
                        <th>Teacher</th>
                        <th>subject</th>
                        <th>caption</th>
                        <th>file</th>
                    </tr>
                    <%                                
                    int i = 0;
                        String selQry1 = "select * from tbl_lectures l inner join tbl_subject s on s.subject_id=l.subject_id inner join tbl_teacher t on t.teacher_id=l.teacher_id where s.semester_id = '" + session.getAttribute("ssid") + "'";
                        ResultSet rsz = con.selectCommand(selQry1);
                        while (rsz.next()) {
                            i++;
                            String format = "none";
                            String fileName = rsz.getString("lecture_file");
                            int index = fileName.lastIndexOf(".");
                            if (index > 0) {
                                format = fileName.substring(index + 1);
                                format = format.toLowerCase();
                            }
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rsz.getString("subject_name")%></td>
                        <td><%=rsz.getString("subject_name")%></td>
                        <td><%=rsz.getString("lecture_content")%></td>
                        <td><%

                            if (format.equals("png") || format.equals("jpg") || format.equals("jpeg")) {
                               out.println("<a href='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' download>"
                                       + "<img src='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' width='120' height='120' alt='" + rsz.getString("lecture_file") + "'>"
                                       + "</a>");
                            } else if (format.equals("pdf") || format.equals("doc") || format.equals("txt")) {
                                out.println("<a href='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' download>Download This Document</a>");
                            } else if (format.equals("mp3") || format.equals("ogg") || format.equals("m4a")) {

                                out.println("<audio controls>"
                                        + "<source src='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' type='audio/mp3'>"
                                        + "<source src='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' type='audio/ogg'>"
                                        + " <source src='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' type='audio/m4a'>"
                                        + "Your browser does not support the audio element."
                                        + " </audio>");
                                
                            } else if (format.equals("mp4") || format.equals("mov") || format.equals("avi") || format.equals("mkv")) {

                                out.println("<video width='350' controls>"
                                        + "<source src='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' type='video/mp4'>"
                                        + "<source src='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' type='video/mov'>"
                                        + " <source src='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' type='video/avi'>"
                                         + " <source src='../Assets/LectureAssets/Lectures/" + rsz.getString("lecture_file") + "' type='video/mkv'>"
                                        + "Your browser does not support the video tag."
                                        + " </audio>");
                            }


                            %></td>
                        
                    </tr>
                    <%                        }
                    %>
                </table>
        </div>
        <%@include file="Footer.jsp" %>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
                                function getSubject(sid)
                                {

                                    var id = document.getElementById("sel_cou").value;
                                    $.ajax({url: "../Assets/AjaxPages/AjaxLecture.jsp?sid=" + sid + "&id=" + id,
                                        success: function(result) {
                                            $("#sel_sub").html(result);
                                        }});
                                }
        </script>
    </body>
</html>

