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
            <h1> Students List</h1>
            <table>
                <tr>
                    <th>Sl.no</th>
                   
                    <th>Department</th>
                    <th>Semester</th>
                    <th>Students</th>
                    <th>Chat</th>
                </tr>
                <%                                    int i = 0;
                    String selQry = "select * from tbl_student s inner join tbl_semester sem on sem.semester_id=s.semester_id inner join tbl_department d on d.department_id=s.department_id inner join tbl_course c on c.course_id=s.course_id where s.course_id='"+request.getParameter("cid")+"' and s.semester_id='"+request.getParameter("sid")+"'";
                    System.out.println(selQry);
                    ResultSet rsz = con.selectCommand(selQry);
                    while (rsz.next()) {
                        i++;
                %>

                <tr>
                    <td><%=i%></td>
                
                    <td><%=rsz.getString("department_name")%></td>
                    <td><%=rsz.getString("semester_name")%></td>
                   
                    <td><%=rsz.getString("student_name")%></td>
                    <td><a href="StudentChat/Chat.jsp?sid=<%=rsz.getString("student_id")%>">Chat</a></td>
                    
                </tr>

                <%
                    }

                %>
            </table>
        </div>
        <%@include file="Footer.jsp" %>
    </body>

</html>
