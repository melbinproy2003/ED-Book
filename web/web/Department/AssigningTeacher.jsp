<%-- 
    Document   : AssigningTeacher
    Created on : 19 Dec, 2023, 1:57:48 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assigning Teachers</title>
    </head>
    <%
        String id = request.getParameter("id");
        String select = "select * from tbl_teacher where teacher_id='" + id + "'";
        ResultSet teacher = con.selectCommand(select);
        teacher.next();
        if (request.getParameter("save") != null) {
            String subject = request.getParameter("subject");
            String check = "select * from tbl_assignteacher where teacher_id='" + id + "' and subject_id='" + subject + "'";
            ResultSet checkassgin = con.selectCommand(check);
            if (checkassgin.next()) {
                out.print("aldready assigned");
            } else {
                String insert = "insert into tbl_assignteacher(subject_id,teacher_id) values('" + subject + "','" + id + "')";
                con.executeCommand(insert);
                response.sendRedirect("AssigningTeacher.jsp");
            }
        }
    %>
    <body align="center">
        <h1>Assign Teacher</h1>
        <table border="1" align="center">
            <tr>
                <td>
                    <table border="0">
                        <tr>
                            <td colspan="2" align="center">
                                <img src="../Assets/Files/Teacher/<%=teacher.getString("teacher_photo")%>" width="150px">
                            </td>
                        </tr>
                        <tr>
                            <td>Name :</td>
                            <td><%=teacher.getString("teacher_name")%></td>
                        </tr>
                        <tr>
                            <td>About :</td>
                            <td><%=teacher.getString("teacher_about")%></td>
                        </tr>
                        <tr>
                            <td>Email :</td>
                            <td><%=teacher.getString("teacher_email")%></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <form method="post">

                        <table border="0">
                            <tr>
                                <td>Course</td>
                                <td>
                                    <select name="course" id="sel_course" onchange="getSemester(this.value)">
                                        <option value="">--select--</option>
                                        <%
                                            String selectc = "select * from tbl_course where departmenttype_id='" + session.getAttribute("departmenttypeid") + "'";
                                            ResultSet selcourse = con.selectCommand(selectc);
                                            while (selcourse.next()) {
                                        %>
                                        <option value="<%=selcourse.getString("course_id")%>"><%=selcourse.getString("course_name")%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Semester:</td>
                                <td>
                                    <select name="semester" id="sel_semester" onchange="getSubject(this.value)">
                                        <option value=" ">--select--</option>

                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Subject:</td>
                                <td>
                                    <select name="subject" id="sel_subject">
                                        <option value="">---select---</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="submit" name="save" value="Assign">
                                    <input type="reset" name="reset" value="Reset">
                                </td>
                            </tr>
                        </table>
                    </form>

                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
            <u>Assigned List</u>
            <table border="1">
                <tr>
                    <th>Course</th>
                    <th>Sem</th>
                    <th>Subject</th>
                </tr>
                <%
                    String selectsubject = "select * from tbl_assignteacher a inner join tbl_teacher t on a.teacher_id=t.teacher_id "
                            + "inner join tbl_subject sub on a.subject_id=sub.subject_id "
                            + "inner join tbl_semester sem on sub.semester_id=sem.semester_id "
                            + "inner join tbl_course c on sub.course_id=c.course_id where a.teacher_id='" + id + "'";
                    ResultSet sel = con.selectCommand(selectsubject);
                    while (sel.next()) {
                %> 
                <tr>
                    <td><%=sel.getString("subject_name")%></td>
                    <td><%=sel.getString("semester_count")%></td>
                    <td><%=sel.getString("course_name")%></td>
                </tr>

                <%
                    }
                %>
            </table>
        </td>
    </tr>
</table>     
</body>
<script src="../Assets/JQuery/jQuery.js"></script>
<script>
                                        function getSemester(sid)
                                        {
                                            $.ajax({
                                                url: "../Assets/AjaxPages/AjaxSemester.jsp?sid=" + sid,
                                                success: function(html) {
                                                    $("#sel_semester").html(html);

                                                }
                                            });
                                        }

                                        function getSubject(subid)
                                        {
                                            var id = document.getElementById("sel_course").value;
                                            $.ajax({
                                                url: "../Assets/AjaxPages/AjaxSubject.jsp?sid=" + subid + "&cid=" + id,
                                                success: function(html) {
                                                    $("#sel_subject").html(html);

                                                }
                                            });
                                        }
</script>
</html>
