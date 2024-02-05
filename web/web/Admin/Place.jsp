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
        <title>Place</title>
    </head>
    <body>
        <%
         if(request.getParameter("save")!= null){
             String place=request.getParameter("place");
             String district=request.getParameter("district");
             String insert="insert into tbl_place (district_id,place_name)value('"+district+"','"+place+"')";
             con.executeCommand(insert);
         }
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        District
                    </td>
                    <td>
                        <select name="district">
                            <option value="">--select--</option>
                            <%
                         String select="select * from tbl_district";
                         ResultSet rs=con.selectCommand(select);
                         while(rs.next())
                         {
                        %>
                            <option value=<%=rs.getString("district_id")%>><%=rs.getString("district_name")%></option>
                         <%
                         }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        place
                    </td>
                    <td>
                        <input type="text" name="place">
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
