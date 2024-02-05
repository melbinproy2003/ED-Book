<%-- 
    Document   : ViewLecture
    Created on : 26 Dec, 2023, 3:17:27 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Lecture</title>
    </head>
    <%
        String courseid = session.getAttribute("courseid").toString();
    %>
    <body align="center">
        <h1>NOTES</h1>
        <form method="post">
            <table border="1">
                <tr>
                    <th>Semester</th>
                    <td>
                        <select name="sem" id="sem" onchange="getSubject(this.value,<%=courseid%>), getData()">
                            <option value="">--select--</option>
                            <%
                                String selcourse = "select * from tbl_course where course_id='" + courseid + "' ";
                                out.print(selcourse);
                                ResultSet re = con.selectCommand(selcourse);
                                re.next();
                                String semcount = re.getString("sem_count");
                                String sel = "select * from tbl_semester limit " + semcount + "";
                                out.print(sel);
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("semester_id")%>"><%=rs.getString("semester_count")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                    <th>Subject</th>
                    <td>
                        <select name="subject" id="sel_subject" onchange="getData()">
                            <option value="">--select--</option>
                        </select>
                    </td>
                </tr>
            </table>
            <div id="loadData">
                <table border="0" align="center" width="60%">
                    <tr>
                        <th>Sl.No</th>
                        <th>Subject</th>
                        <th>Content</th>
                        <th>File</th>
                        <th>Uploaded Date</th>
                    </tr>
                    <%
                        String select = "select * from tbl_lecture l inner join tbl_subject s on l.subject_id=s.subject_id where s.course_id='" + session.getAttribute("courseid") + "' ORDER BY lecture_id DESC";
                        ResultSet display = con.selectCommand(select);
                        int i = 0;
                        while (display.next()) {
                            i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=display.getString("subject_name")%></td>
                        <td><%=display.getString("lecture_content")%></td>
                        <td>
                            <iframe src="../Assets/Files/LectureFile/<%=display.getString("lecture_file")%>"></iframe><br>
                            <%=display.getString("lecture_file")%><br>
                            <a href="../Assets/Files/LectureFile/<%=display.getString("lecture_file")%>" target="_blank">Open</a>
                            <a href="../Assets/Files/LectureFile/<%=display.getString("lecture_file")%>" download>Download</a>
                        </td>
                        <td><%=display.getString("lecture_date")%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </form>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                            function getSubject(subid, id)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxSubject.jsp?sid=" + subid + "&cid=" + id,
                                    success: function(html) {
                                        $("#sel_subject").html(html);

                                    }
                                });
                            }

                            function getData()
                            {
                                var subid = document.getElementById("sel_subject").value;
                                var sem = document.getElementById("sem").value;
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxData.jsp?sid=" + subid + "&sem=" + sem + "&cou=<%=courseid%>",
                                    success: function(html) {
                                        $("#loadData").html(html);

                                    }
                                });
                            }
    </script>
</html>
