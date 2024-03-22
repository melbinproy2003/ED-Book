<%-- 
    Document   : Updatesemester
    Created on : 19 Mar, 2024, 4:34:08 PM
    Author     : MELBIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean> 
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Semester</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <%
        if(request.getParameter("update")!=null){
            String upQ="update tbl_student set semester_id='"+request.getParameter("sel_sem")+"' where batch_id='"+request.getParameter("sel_batch")+"'";
            if(con.executeCommand(upQ)){
                %> 
       <script type="text/javascript">
             setTimeout(function(){window.location.href='Updatesemester.jsp'},40);//40millisecend it go to next page
        </script>
     <%
            }
        }
    %>
    <body>
        <div id="tab" align="center">
            <h1>Update semester</h1>
            <form method="post" >
                <table border="1">
                     <tr>
                        <td>Batch</td>
                        <td>
                            <select name="sel_batch" required="">
                                <option value="">-------Select-------</option>
                                <%
                                    String disQry = "select * from tbl_batch where college_id='"+session.getAttribute("cid")+"'";
                                    ResultSet rs = con.selectCommand(disQry);
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("batch_id")%>"><%=rs.getString("batch_name")%></option>
                                <%
                                    }

                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Semester</td>
                        <td>
                            <select name="sel_sem" required="">
                                <option value="">-------Select-------</option>
                                <%
                                 String selsem="select * from tbl_semester";
                                 ResultSet sem=con.selectCommand(selsem);
                                 while(sem.next()){
                                %>
                                <option value="<%=sem.getString("semester_id")%>"><%=sem.getString("semester_name")%></option>
                                <%
                                 }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Update" name="update"></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>
