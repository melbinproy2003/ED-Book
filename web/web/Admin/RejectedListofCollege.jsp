<%-- 
    Document   : ListCollege
    Created on : 16 Dec, 2023, 2:58:11 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rejected List College</title>
    </head>
    <body>
        <table border="0" align="center">
            <tr>
                <th><a href="AcceptedListofCollege.jsp"><button>ACCEPTED LIST</button></a></th>
                <th>REJECTED LIST</th>
            </tr>
        </table>
        <table border="1" align="center">
            <tr>
                <th>SI.NO</th>
                <th>Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>University</th>
                <th>District</th>
                <th>Place</th>
            </tr>
            <%
             String select="select * from tbl_college c inner join tbl_university u on c.university_id=u.university_id inner join tbl_place p on c.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id where college_status='"+2+"'";
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
            </tr>
            <%
             }
            %>
        </table>
    </body>
</html>
