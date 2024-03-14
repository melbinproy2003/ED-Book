<%-- 
    Document   : ViewFeedBack
    Created on : May 13, 2021, 3:06:16 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Feedback</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
         
            <h1>New Feedbacks</h1>
            <table >
                <thead>
                    <tr style="background-color: #74CBF9">
                        <th>Sl.No</th>
                        <th>Feedback</th>
                        <th>Date</th>
                        <th>Staff</th>
                    </tr>
                </thead>
                <tbody>
                    <%                                                int i = 0;
                        String selQry = "select * from tbl_feedback c inner join tbl_teacher co on co.teacher_id=c.teacher_id where co.department_id='" + session.getAttribute("did") + "'";
                        System.out.println(selQry);
                        ResultSet rs = con.selectCommand(selQry);
                        while (rs.next()) {

                            i++;

                    %>
                    <tr>
                       <td><%=i%></td>
                       <td><%=rs.getString("feedback_content")%></td>
                       <td><%=rs.getString("feedback_date")%></td>
                       <td><%=rs.getString("teacher_name")%></td>
                    </tr>
                    <%                      

                        }
                    %>

                </tbody>
            </table>
            
            </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>


