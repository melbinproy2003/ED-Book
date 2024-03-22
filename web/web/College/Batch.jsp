<%-- 
    Document   : District
    Created on : May 5, 2021, 2:10:08 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Batch</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <%        String id = "", name = "";

        if (request.getParameter("edit") != null) {

            id = request.getParameter("edit");
            name = request.getParameter("name");

        }

        if (request.getParameter("btn_save") != null) {

            if (request.getParameter("bid").equals("")) {
                String insQry = "insert into tbl_batch(batch_name,college_id)values('" + request.getParameter("txt_batch") + "','"+session.getAttribute("cid")+"')";
                if(con.executeCommand(insQry)){
                 %> 
       <script type="text/javascript">
             setTimeout(function(){window.location.href='Batch.jsp'},40);//40millisecend it go to next page
        </script>
     <%
                        }
            } else {
                String upQry = "update tbl_batch set batch_name='" + request.getParameter("txt_batch") + "' where batch_id='" + request.getParameter("bid") + "'";
                if(con.executeCommand(upQry)){
                 %> 
       <script type="text/javascript">
             setTimeout(function(){window.location.href='Batch.jsp'},40);//40millisecend it go to next page
        </script>
     <%
                }
            }
        }
        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_batch where batch_id='" + request.getParameter("del") + "'";
            if(con.executeCommand(delQry)){
             %> 
       <script type="text/javascript">
             setTimeout(function(){window.location.href='Batch.jsp'},40);//40millisecend it go to next page
        </script>
     <%
            }
        }
    %>
    <body>
        <%
         System.out.println(request.getParameter("bid"));
        %>
        <div id="tab" align="center">
            <h1>Add New Batch</h1>
            <form method="post">
                <table border="1">
                    <tr>
                        <td>Batch</td>
                    </tr>
                    <tr>
                        <td>
                            <input required="" type="text" class="form-control" id="txt_district" name="txt_batch" value="<%=name%>">
                            <input type="hidden" name="bid" value="<%=id%>">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" >
                        <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                        </td>
                    </tr>
            </form>
    <!-- table-responsive -->
    <table>
        <thead>
            <tr style="background-color: #74CBF9">
                <td align="center" scope="col">Sl.No</td>
                <td align="center" scope="col">Batch</td>
                <td align="center" scope="col">Action</td>
            </tr>
        </thead>
        <tbody>
            <%
                int i = 0;
                String selQry = "select * from tbl_batch where college_id='"+session.getAttribute("cid")+"'";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {

                    i++;

            %>
            <tr>
                <td align="center"><%=i%></td>
                <td align="center"><%=rs.getString("batch_name")%></td>
                <td align="center"><a href="Batch.jsp?del=<%=rs.getString("batch_id")%>" class="status_btn">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Batch.jsp?edit=<%=rs.getString("batch_id")%>&name=<%=rs.getString("batch_name")%>" class="status_btn">Edit</a></td>
            </tr>
            <%                      }


            %>

        </tbody>
    </table>
</body>
<%@include file="Footer.jsp" %>
</html>
