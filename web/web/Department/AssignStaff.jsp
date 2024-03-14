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
    <%          if (request.getParameter("btn_save") != null) {

            String insQry = "insert into tbl_teacher_assign(teacher_id,subject_id)"
                    + "values('" + request.getParameter("sel_teacher") + "','" + request.getParameter("sel_subject") + "')";
            con.executeCommand(insQry);
           
            

        }

    if(request.getParameter("id")!=null)
    {
        String delQry="delete from tbl_teacher_assign where assign_id='" + request.getParameter("id") + "'";
       con.executeCommand(delQry);
    }
    %>
    <body>
        <div id="tab" align="center">
            <h1> Assign Staff</h1>
            <form method="post">
                <table border="1">
                    <tr>
                        <td>Teacher</td>
                        <td>
                            <select name="sel_teacher" >
                                <option value="">-------Select-------</option>
                                <%                                    String techQry = "select * from tbl_teacher where department_id='"+session.getAttribute("did")+"'";
                                    ResultSet rs = con.selectCommand(techQry);
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("teacher_id")%>"><%=rs.getString("teacher_name")%></option>
                                <%
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Course</td>
                        <td>
                            <select name="sel_course" onchange="getSubject(this.value)">
                                <option value="">-------Select-------</option>
                                <%                                    String corQry = "select * from tbl_course where department_type_id='"+session.getAttribute("dtype")+"'";
                                    ResultSet rs1 = con.selectCommand(corQry);
                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("course_id")%>"><%=rs1.getString("course_name")%></option>
                                <%
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Subject</td>
                        <td>
                            <select name="sel_subject" id="sel_subject">
                                <option value="">-------Select-------</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Assign" name="btn_save">
                        </td>
                    </tr>

                </table>
            </form>
            <table>
                <tr>
                    <th>Sl.no</th>
                    <th>Teacher</th>
                    <th>Course</th>
                    <th>Semester</th>
                    <th>Subject</th>
                    <th>Action</th>
                </tr>
                <%                                    int i = 0;
                    String selQry = "select * from tbl_teacher_assign ts inner join tbl_teacher t on t.teacher_id=ts.teacher_id inner join tbl_subject sub on sub.subject_id=ts.subject_id inner join tbl_semester sem on sem.semester_id=sub.semester_id inner join tbl_course c on c.course_id=sub.course_id where t.department_id='"+session.getAttribute("did")+"'";
                    ResultSet rsz = con.selectCommand(selQry);
                    while (rsz.next()) {
                        i++;
                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rsz.getString("teacher_name")%></td>
                    <td><%=rsz.getString("course_name")%></td>
                    <td><%=rsz.getString("semester_name")%></td>
                    <td><%=rsz.getString("subject_name")%></td>
                    <td><a href="AssignStaff.jsp?id=<%=rsz.getString("assign_id")%>"><i style="margin-left: -15px">Delete</i></a></td>
                </tr>

                <%
                    }

                %>
            </table>
        </div>
        <%@include file="Footer.jsp" %>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                                function getSubject(cid)
                                {

                                    $.ajax({url: "../Assets/AjaxPages/AjaxSubject.jsp?did=" + cid,
                                        success: function(result) {
                                            $("#sel_subject").html(result);
                                        }});
                                }

    </script>
</html>


