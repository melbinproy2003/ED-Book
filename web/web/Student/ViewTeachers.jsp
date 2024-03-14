<%-- 
    Document   : ViewTeachers
    Created on : 17 Jun, 2023, 2:37:28 PM
    Author     : BASIL LENIN
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>College</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>


    <body>
        <div id="tab" align="center">
            <h1> Teachers List</h1>
            <table>
                <tr>
                    <th>Sl.no</th>
                    <th>Subject</th>
                    <th>Teacher</th>
                    <th>Chat</th>


                </tr>
                <%                    int i = 0;
                    String selQry = "select * from tbl_subject s inner join tbl_semester sem on sem.semester_id=s.semester_id inner join tbl_course c on c.course_id=s.course_id inner join tbl_teacher_assign ta on ta.subject_id=s.subject_id  inner join tbl_teacher te on te.teacher_id=ta.teacher_id inner join tbl_student st on st.semester_id=sem.semester_id where st.student_id='"+session.getAttribute("sid")+"'";
                    ResultSet rsz = con.selectCommand(selQry);
                    while (rsz.next()) {
                        i++;
                %>

                <tr>
                    <td><%=i%></td>


                    <td><%=rsz.getString("subject_name")%></td>

                    <td><%=rsz.getString("teacher_name")%></td>
                    <td><a href="TeacherChat/Chat.jsp?id=<%=rsz.getString("teacher_id")%>">Chat</a></td>

                </tr>

                <%
                    }

                %>
            </table>
        </div>
        <%@include file="Footer.jsp" %>
    </body>

</html>
