<%-- 
    Document   : Editprofile
    Created on : 9 Dec, 2023, 2:29:46 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Department profile</title>
    </head>
    <%
     String select="select * from tbl_department d inner join tbl_departmenttype dt on d.departmenttype_id=dt.departmenttype_id where department_id='"+session.getAttribute("departmentid")+"'";
     ResultSet department=con.selectCommand(select);
     department.next();
     if (request.getParameter("save")!=null){
         String departmenttype=request.getParameter("departmenttype");
         String email=request.getParameter("email");
         String contact=request.getParameter("contact");
         String landmark=request.getParameter("landmark");
         String college=request.getParameter("college");
         String update="update tbl_department set departmenttype_id='"+departmenttype+"',department_email='"+email+"',department_contact='"+contact+"',department_landmark='"+landmark+"',college_id='"+college+"'";
         con.executeCommand(update);
         response.sendRedirect("DepartmentProfile.jsp");
     }
    %>
    <body>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Department Name</td>
                    <td>
                        <select name="departmenttype">
                         <%
                          String type="select * from tbl_departmenttype";
                          ResultSet obj=con.selectCommand(type);
                          while(obj.next())
                          {
                        %>
                            <option value="<%=obj.getString("departmenttype_id")%>" <%if(obj.getString("departmenttype_id").equals(department.getString("departmenttype_id"))){out.print("selected");}%>><%=obj.getString("departmenttype_name")%></option>
                         <%
                          }
                         %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Department Email</td>
                    <td>
                        <input type="email" name="email" value="<%=department.getString("department_email")%>">
                    </td>
                </tr>
                <tr>
                    <td>Department Contact</td>
                    <td>
                        <input type="number" name="contact" value="<%=department.getString("department_contact")%>">
                    </td>
                </tr>
                <tr>
                    <td>Department Landmark</td>
                    <td>
                        <input type="text" name="landmark" value="<%=department.getString("department_landmark")%>">
                    </td>
                </tr>
                <tr>
                    <td>College name</td>
                    <td>
                        <select name="college">
                            <%
                             String selectcollege="select * from tbl_college";
                             ResultSet college=con.selectCommand(selectcollege);
                             while(college.next())
                             {
                            %>
                            <option value="<%=college.getString("college_id")%>" <%if(college.getString("college_id").equals(department.getString("college_id"))){out.print("selected");}%>><%=college.getString("college_name")%></option>
                            <%
                             }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
