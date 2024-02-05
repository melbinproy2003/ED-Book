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
        <title>Course</title>
    </head>
    <body>
        <%
         if(request.getParameter("save")!= null){
         if(request.getParameter("upcourse")!=null){
             String id=request.getParameter("upcourse");
             String course=request.getParameter("course");
             String sem=request.getParameter("sem");
             String university=request.getParameter("university");
             String departmenttype=request.getParameter("departmenttype");
             String update="update tbl_course set course_name='"+course+"',university_id='"+university+"',departmenttype_id='"+departmenttype+"',sem_count='"+sem+"' where course_id='"+id+"'";
             con.executeCommand(update);
             response.sendRedirect("Course.jsp");
         }
         else{
             String course=request.getParameter("course");
             String sem=request.getParameter("sem");
             String university=request.getParameter("university");
             String departmenttype=request.getParameter("departmenttype");
             String insert="insert into tbl_course (course_name,university_id,departmenttype_id,sem_count)value('"+course+"','"+university+"','"+departmenttype+"','"+sem+"')";
             con.executeCommand(insert);
         }
         }
         
         if (request.getParameter("del")!=null)
        {
         String id=request.getParameter("del");
         String delete="delete from tbl_course where course_id='"+id+"'";
         con.executeCommand(delete);
        }
         
         String university="",departmenttype="",course="",count="",id="";
         if (request.getParameter("up")!=null)
        {
         id=request.getParameter("up");
         String upid="select * from tbl_course where course_id='"+id+"'";
         ResultSet update = con.selectCommand(upid);
                update.next();
                university = update.getString("university_id");
                departmenttype = update.getString("departmenttype_id");
                course = update.getString("course_name");
                count = update.getString("sem_count");
        }
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        University
                    </td>
                    <td>
                        <select name="university">
                            <option value="">--select--</option>
                         <%
                         String select="select * from tbl_university";
                         ResultSet rs=con.selectCommand(select);
                         while(rs.next())
                         {
                        %>
                            <option value="<%=rs.getString("university_id")%>" <% if (rs.getString("university_id").equals(university)) {
                                    out.print("selected");
                                }%>><%=rs.getString("university_name")%></option>
                        <%
                         }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Department Type
                    </td>
                    <td>
                        <select name="departmenttype">
                            <option value="">--select--</option>
                         <%
                         String selectdepartmenttype="select * from tbl_departmenttype";
                         ResultSet dep=con.selectCommand(selectdepartmenttype);
                         while(dep.next())
                         {
                        %>
                            <option value="<%=dep.getString("departmenttype_id")%>" <% if (dep.getString("departmenttype_id").equals(departmenttype)) {
                                    out.print("selected");
                                }%>><%=dep.getString("departmenttype_name")%></option>
                        <%
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
                        <input type="text" name="course" value="<%=course%>">
                        <input type="hidden" name="upcourse" value="<%=id%>">
                    </td>
                </tr>
                <tr>
                    <td>Total Semester</td>
                    <td>
                        <input type="number" name="sem" value="<%=count%>">
                        
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
        <th>S.NO</th>
        <th>University</th>
        <th>Department Type</th>
        <th>Course</th>
        <th>Total Semester</th>
        <th colspan="2" align="center">Action</th>
    </tr>
    <%
         String selcategory="select * from tbl_course c inner join tbl_university u on c.university_id=u.university_id inner join tbl_departmenttype d on c.departmenttype_id=d.departmenttype_id";
         ResultSet display=con.selectCommand(selcategory);
         int i=0;
         while(display.next())
         {
            i++; 
        %>
    <tr>
        <td><%=i%></td>
        <td><%=display.getString("university_name")%></td>
        <td><%=display.getString("departmenttype_name")%></td>
        <td><%=display.getString("course_name")%></td>
        <td><%=display.getString("sem_count")%></td>
        <td><a href="Course.jsp?del=<%=display.getString("course_id")%>">Delete</a></td>
        <td><a href="Course.jsp?up=<%=display.getString("course_id")%>">Update</a></td>
    </tr>
    <%
     }
    %>
</table>
        </form>
    </body>
</html>
