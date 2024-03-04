<%-- 
    Document   : Comments
    Created on : 27 Feb, 2024, 10:48:35 AM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id = request.getParameter("pid");
    if (request.getParameter("submit") != null) {
        String comment = request.getParameter("comment");
        String insert = "insert into tbl_comment(comment_date,comment_content,post_id,student_id) values(curdate(),'" + comment + "','" + id + "','" + session.getAttribute("studentid") + "')";
        con.executeCommand(insert);
        response.sendRedirect("Comments.jsp?pid="+id);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>College comments</title>
    </head>
    <body>
        <%
        // view post
        String selpost="select * from tbl_post where post_id='"+id+"'";
        ResultSet vpost=con.selectCommand(selpost);
        vpost.next();
         // view comments
         String select="select * from tbl_comment where post_id='"+id+"'";
         ResultSet sel=con.selectCommand(select);
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td colspan="3" align="center">
                        <img src="../Assets/Files/Post/<%=vpost.getString("post_file")%>" width="100" height="100">
                    </td>
                </tr>
                <tr>
                <%
                String name="null";
                 while(sel.next()){
                     if(sel.getString("college_id") != null){
                         String selco="select * from tbl_college where college_id='"+sel.getString("college_id")+"'";
                         ResultSet co=con.selectCommand(selco);
                         co.next();
                         name=co.getString("college_name");
                     }
                     else if(sel.getString("department_id") != null){
                         String selco="select * from tbl_department d inner join tbl_departmenttype dep on d.departmenttype_id=dep.departmenttype_id where department_id='"+sel.getString("department_id")+"'";
                         ResultSet co=con.selectCommand(selco);
                         co.next();
                         name=co.getString("departmenttype_name");
                     }
                     else if(sel.getString("teacher_id") != null){
                         String selco="select * from tbl_teacher where teacher_id='"+sel.getString("teacher_id")+"'";
                         ResultSet co=con.selectCommand(selco);
                         co.next();
                         name=co.getString("teacher_name");
                     }
                     else if(sel.getString("student_id") != null){
                         String selco="select * from tbl_student where student_id='"+sel.getString("student_id")+"'";
                         ResultSet co=con.selectCommand(selco);
                         co.next();
                         name=co.getString("student_name");
                     }
                    %>
                <tr border="0">
                    <td><%out.print(name);%></td>
                    <td><%=sel.getString("comment_content")%></td>
                    <td><%=sel.getString("comment_date")%></td>
                </tr>
                <%
                 }
                %>
            </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="comment"></textarea>
                    </td>
                    <td>
                        <input type="submit" name="submit" value="Send">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
