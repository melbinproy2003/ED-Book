<%-- 
    Document   : District
    Created on : 5 Dec, 2023, 2:29:19 PM
    Author     : MELBIN
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Type</title>
    </head>
    <body>
        <%
        if(request.getParameter("save")!=null)
        {
            String name=request.getParameter("departmenttype");
            String insQry="insert into tbl_departmenttype(departmenttype_name)values('"+name+"')";
            con.executeCommand(insQry);
        }
        if (request.getParameter("id")!=null)
        {
         String id=request.getParameter("id");
         String delete="delete from tbl_departmenttype where departmenttype_id='"+id+"'";
         con.executeCommand(delete);
        }
        
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        Department Type
                    </td>
                    <td>
                        <input type="text" name="departmenttype">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
<!--            display-->
<table border="1">
    <tr>
        <td>S.NO</td>
        <td>Department Type</td>
        <td>Action</td>
    </tr>
    <%
     String select="select * from tbl_departmenttype";
     ResultSet rs=con.selectCommand(select);
     int i=0;
     while(rs.next())
     {
         i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs.getString("departmenttype_name")%></td>
        <td><a href="DepartmentType.jsp?id=<%=rs.getString("departmenttype_id")%>">Delete</a></td>
    </tr>
    <%
     }
    %>
</table>
        </form>
    </body>
</html>
