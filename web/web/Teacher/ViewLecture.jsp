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
     if(request.getParameter("id")!=null){
         String id=request.getParameter("id");
         String delete="delete from tbl_lecture where lecture_id='"+id+"'";
         con.executeCommand(delete);
         response.sendRedirect("ViewLecture.jsp");
     }
    %>
    <body align="center">
        <h1>NOTES</h1>
        <form method="post">
            <table border="0" align="center" width="60%">
                <tr>
                    <th>Sl.No</th>
                    <th>Subject</th>
                    <th>Content</th>
                    <th>File</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
                <%
                    String select = "select * from tbl_lecture l inner join tbl_subject s on l.subject_id=s.subject_id where teacher_id='" + session.getAttribute("teacherid") + "' ORDER BY lecture_id DESC";
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
                        <a href="../Assets/Files/LectureFile/<%=display.getString("lecture_file")%>" target="blank">Open</a>
                        <a href="../Assets/Files/LectureFile/<%=display.getString("lecture_file")%>" download>Download</a>
                    </td>
                    <td><%=display.getString("lecture_date")%></td>
                    <td>
                        <a href="ViewLecture.jsp?id=<%=display.getString("lecture_id")%>">Remove</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
