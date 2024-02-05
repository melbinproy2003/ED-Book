<%-- 
    Document   : Changepassword
    Created on : 9 Dec, 2023, 12:34:41 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <%
     if(request.getParameter("submit")!=null){
         String oldpass=request.getParameter("oldpassword");
         String newpass=request.getParameter("newpassword");
         String cpass=request.getParameter("cpassword");
         String select="select * from tbl_department where department_id='"+session.getAttribute("departmentid")+"'";
         ResultSet department=con.selectCommand(select);
         department.next();
         String curpass=department.getString("department_password");
         if(curpass.equals(request.getParameter("oldpassword"))){
             if(oldpass.equals(request.getParameter("newpassword"))){
                 out.println("Enter Different Password ");
             }
             else{
                 if(newpass.equals(request.getParameter("cpassword"))){
                     String up="update tbl_department set department_password='"+newpass+"' where department_id='"+session.getAttribute("departmentid")+"'";
                     con.executeCommand(up);
                     response.sendRedirect("DepartmentProfile.jsp");
                 }
                 else{
                     out.println("please confirm your password");
                 }
             }
         }
         else{
             out.println("Entered passowrd is not matching");
         }
     }
    %>
    <body align="center">
        <h1>CHANGE PASSWORD</h1>
        <form method="post">
            <table border="0" align="center">
                <tr>
                    <td>Old password</td>
                    <td>
                        <input type="password" name="oldpassword">
                    </td>
                </tr>
                <tr>
                    <td>New password</td>
                    <td>
                        <input type="password" name="newpassword">
                    </td>
                </tr>
                <tr>
                    <td>Confirm password</td>
                    <td>
                        <input type="password" name="cpassword">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Change">
                        <input type="reset" name="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
