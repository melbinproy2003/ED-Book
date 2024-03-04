<%-- 
    Document   : Subject
    Created on : 15 Dec, 2023, 12:56:43 PM
    Author     : MELBIN
--%>
<%-- 
    Document   : Place
    Created on : 5 Dec, 2023, 2:35:48 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject</title>
    </head>
    <body>
        <%
            if (request.getParameter("save") != null) {
                if (!request.getParameter("update").equals("")) {
                    String id = request.getParameter("update");
                    String subject = request.getParameter("subject");
                    String course = request.getParameter("course");
                    String sem = request.getParameter("sem");
                    String upsubject = "update tbl_subject set course_id='" + course + "',subject_name='" + subject + "',semester_id='" + sem + "' where subject_id='" + id + "'";
                    con.executeCommand(upsubject);
                    response.sendRedirect("Subject.jsp");
                } else {
                    String subject = request.getParameter("subject");
                    String course = request.getParameter("course");
                    String sem = request.getParameter("sem");
                    String insert = "insert into tbl_subject (course_id,subject_name,semester_id)value('" + course + "','" + subject + "','" + sem + "')";
                    con.executeCommand(insert);
                }
            }

            if (request.getParameter("del") != null) {
                String id = request.getParameter("del");
                String delete = "delete from tbl_subject where subject_id='" + id + "'";
                con.executeCommand(delete);
            }
            String subuniversity = "", subject = "", subjectid = "", semester = "", upid = "", courseid = "",semcount="";
            if (request.getParameter("up") != null) {
                upid = request.getParameter("up");
                String select = "select * from tbl_subject s inner join tbl_course c on s.course_id=c.course_id inner join tbl_university u on c.university_id=u.university_id where subject_id='" + upid + "'";
                ResultSet re = con.selectCommand(select);
                re.next();
                subuniversity = re.getString("university_id");
                semester = re.getString("semester_id");
                courseid = re.getString("course_id");
                subject = re.getString("subject_name");
                subjectid = re.getString("subject_id");
                semcount=re.getString("sem_count");
            }
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        University
                    </td>
                    <td>
                        <select name="university" onchange="getCourse(this.value)">
                            <option value="">--select--</option>
                            <%
                                if (request.getParameter("up") != null) {
                                    String select = "select * from tbl_course c inner join tbl_university u on c.university_id=u.university_id where course_id='" + courseid + "'";
                                    ResultSet rs = con.selectCommand(select);
                                    while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("university_id")%>" <% if (rs.getString("university_id").equals(subuniversity)) {
                                    out.print("selected");
                                }%>><%=rs.getString("university_name")%></option>
                            <%
                                }
                            } else {
                                String select = "select * from tbl_university";
                                ResultSet rs = con.selectCommand(select);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("university_id")%>"><%=rs.getString("university_name")%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Course
                    </td>
                    <td>
                        <select name="course" id="sel_course" onchange="getSemester(this.value)">
                            <option value="">--select--</option>
                            <%
                                if (request.getParameter("up") != null) {
                                    String cid = request.getParameter("cid");
                                    String selcourse = "select * from tbl_course";
                                    ResultSet res = con.selectCommand(selcourse);
                                    while (res.next()) {
                            %>
                                    <option value="<%=res.getString("course_id")%>" <% if (res.getString("course_id").equals(cid)) {
                                            out.print("selected");
                                        }%>><%=res.getString("course_name")%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Semester
                    </td>
                    <td>
                        <select name="sem" id="sel_semester">
                            <option value=" ">--select--</option>
                            <%
                                if (request.getParameter("up") != null) {
                                    String sid = request.getParameter("sid");
                                    String selsemester = "select * from tbl_semester limit "+semcount+"";
                                    ResultSet rese = con.selectCommand(selsemester);
                                    while (rese.next()) {
                            %>
                                    <option value="<%=rese.getString("semester_id")%>"<% if (rese.getString("semester_id").equals(sid)) {
                                            out.print("selected");
                                        }%>><%=rese.getString("semester_count")%></option>
                            <%
                                    }
                                }
                            %>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td>
                        Subject
                    </td>
                    <td>
                        <input type="text" name="subject" value="<%=subject%>">
                        <input type="hidden" name="update" value="<%=subjectid%>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
            <table border="1">
                <tr>
                    <td>S.NO</td>
                    <td>Course</td>
                    <td>Semester</td>
                    <td>Subject</td>
                    <td colspan="2" align="center">Action</td>
                </tr>
                <%
                    String selsubject = "select * from tbl_subject s inner join tbl_course c on s.course_id=c.course_id inner join tbl_semester sem on s.semester_id=sem.semester_id";
                    ResultSet display = con.selectCommand(selsubject);
                    int i = 0;
                    while (display.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=display.getString("course_name")%></td>
                    <td><%=display.getString("semester_count")%></td>
                    <td><%=display.getString("subject_name")%></td>
                    <td><a href="Subject.jsp?del=<%=display.getString("subject_id")%>">Delete</a></td>
                    <td><a href="Subject.jsp?up=<%=display.getString("subject_id")%>&cid=<%=display.getString("course_id")%>&sid=<%=display.getString("semester_id")%>">Update</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                            function getCourse(uid)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxCourse.jsp?uid=" + uid,
                                    success: function(html) {
                                        $("#sel_course").html(html);

                                    }
                                });
                            }

                            function getSemester(sid)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxSemester.jsp?sid=" + sid,
                                    success: function(html) {
                                        $("#sel_semester").html(html);

                                    }
                                });
                            }
    </script>
</html>
