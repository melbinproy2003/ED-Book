<%-- 
    Document   : Batch
    Created on : 18 Dec, 2023, 3:13:04 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Batch</title>
    </head>
    <%
     if(request.getParameter("save")!=null){
         String name=request.getParameter("batch");
         String insert="insert into tbl_batch(batch_name,college_id) values('"+name+"','"+session.getAttribute("collegeid")+"')";
         con.executeCommand(insert);
     }
    %>
    <body>
        <h1 align="center">Add Batch</h1>
        <form method="post">
            <table border="2" align="center">
                <tr>
                    <td>Batch</td>
                    <td>
                        <input type="number" name="batch" placeholder="New Batch Joining Year">
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
