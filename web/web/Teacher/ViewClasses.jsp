<%-- 
    Document   : Assign Staff
    Created on : May 13, 2021, 2:24:59 PM
    Author     : Pro-TECH
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
            <h1> Class List</h1>
            <table>
                <tr>
                    <th>Sl.no</th>
                   
                    <th>Course</th>
                    <th>Semester</th>
                    <th>Subject</th>
                    <th>View Students</th>
                </tr>
                <%                                    int i = 0;
                    String selQry = "select * from tbl_teacher_assign ta inner join tbl_subject s on s.subject_id=ta.subject_id inner join tbl_course c on c.course_id=s.course_id inner join tbl_semester sem on sem.semester_id=s.semester_id where ta.teacher_id='"+session.getAttribute("tid")+"'";
                    //out.println(selQry);
                    ResultSet rsz = con.selectCommand(selQry);
                    while (rsz.next()) {
                        i++;
                %>

                <tr>
                    <td><%=i%></td>
                
                    <td><%=rsz.getString("course_name")%></td>
                    <td><%=rsz.getString("semester_name")%></td>
                    <td><%=rsz.getString("subject_name")%></td>
                    <td><a href="ViewStudents.jsp?cid=<%=rsz.getString("course_id")%>&sid=<%=rsz.getString("semester_id")%>"><i style="margin-left: -15px">View Students</i></a></td>
                </tr>

                <%
                    }

                %>
            </table>
        </div>
        <%@include file="Footer.jsp" %>
    </body>

</html>
