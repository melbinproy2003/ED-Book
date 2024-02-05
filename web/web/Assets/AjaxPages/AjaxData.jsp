<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page  import="java.sql.ResultSet" %>
<%
    if (request.getParameter("sem") != null && request.getParameter("sub") != null) {
%>
<table border="0" align="center" width="60%">
    <tr>
        <th>Sl.No</th>
        <th>Subject</th>
        <th>Content</th>
        <th>File</th>
        <th>Uploaded Date</th>
    </tr>
    <%
        String select = "select * from tbl_lecture l inner join tbl_subject s on l.subject_id=s.subject_id where s.course_id='" + request.getParameter("cou") + "' and l.subject_id='" + request.getParameter("sid") + "' and s.semester_id='" + request.getParameter("sem") + "' ORDER BY lecture_id DESC";
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
<%
    }
    else if (request.getParameter("sem") != null){
%>
<table border="0" align="center" width="60%">
    <tr>
        <th>Sl.No</th>
        <th>Subject</th>
        <th>Content</th>
        <th>File</th>
        <th>Uploaded Date</th>
    </tr>
    <%
        String select = "select * from tbl_lecture l inner join tbl_subject s on l.subject_id=s.subject_id where s.course_id='" + request.getParameter("cou") + "' and s.semester_id='" + request.getParameter("sem") + "' ORDER BY lecture_id DESC";
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
<%
    }
   
%>