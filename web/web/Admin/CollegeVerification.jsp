<%-- 
    Document   : CollegeVerification
    Created on : 16 Dec, 2023, 12:21:04 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>College Verification</title>
    </head>
    <%
     if(request.getParameter("accept")!=null){
         String accept=request.getParameter("accept");
         String update="update tbl_college set college_status='"+1+"' where college_id='"+accept+"'";
         con.executeCommand(update);
     }
      if(request.getParameter("reject")!=null){
         String reject=request.getParameter("reject");
         String update="update tbl_college set college_status='"+2+"' where college_id='"+reject+"'";
         con.executeCommand(update);
     }
    %>
    <body align="center">
        <h1 align="center">Details of College</h1>
        <table border="1" align="center">
            <tr>
                <th>SI.NO</th>
                <th>Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>University</th>
                <th>District</th>
                <th>Place</th>
                <th colspan="2">Action</th>
            </tr>
            <%
             String select="select * from tbl_college c inner join tbl_university u on c.university_id=u.university_id inner join tbl_place p on c.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where college_status='"+0+"'";
             ResultSet rs=con.selectCommand(select);
             int i=0;
             while(rs.next())
             {
                 i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("college_name")%></td>
                <td><%=rs.getString("college_contact")%></td>
                <td><%=rs.getString("college_address")%></td>
                <td><%=rs.getString("university_name")%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("place_name")%></td>
                <td>
                    <a href="CollegeVerification.jsp?accept=<%=rs.getString("college_id")%>"><button>Accept</button></a>
                </td>
                <td>
                    <a href="CollegeVerification.jsp?reject=<%=rs.getString("college_id")%>"><button>Reject</button></a>
                </td>
            </tr>
            <%
             }
            %>
        </table>
    </body>
</html>
