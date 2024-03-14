<%-- 
    Document   : ViewDepartmentComplaint
    Created on : May 13, 2021, 3:07:35 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Complaint</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <%        if (request.getParameter("btn_save") != null) {

            String upQry = "update tbl_complaint set complaint_reply='" + request.getParameter("txt_reply") + "', complaint_reply_date=curdate(),complaint_status='1' where complaint_id='" + request.getParameter("hid") + "'";
            System.out.println(upQry);
            if(con.executeCommand(upQry))
            {
                %> 
       <script type="text/javascript">
             setTimeout(function(){window.location.href='ViewDepartmentComplaint.jsp'},40);//40millisecend it go to next page
        </script>
     <%
 
            }

        }


    %>
    <body>
        <div id="tab" align="center">
            <!--Form-->
            <%                                    if (request.getParameter("up") != null) {
            %>

            <form>
                <table>
                    <tr>
                        <td>
                            <label for="txt_district">Reply</label>
                        </td>
                        <td>
                            <input required="" type="text" class="form-control" id="txt_reply" name="txt_reply">
                            <input type="hidden" name="hid" value="<%=request.getParameter("up")%>">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                        </td>
                    </tr>
                </table>
            </form>

            <%
                }
                String a = "0", b = "0";
                String one = "select count(complaint_status) as one from tbl_complaint c inner join tbl_department co on co.department_id=c.department_id where co.college_id='" + session.getAttribute("cid") + "' and complaint_status='0'";
                ResultSet ro = con.selectCommand(one);
                if (ro.next()) {
                    a = ro.getString("one");
                    System.out.println(a);
                }
                String two = "select count(complaint_status) as two from tbl_complaint c inner join tbl_department co on co.department_id=c.department_id where co.college_id='" + session.getAttribute("cid") + "' and complaint_status='1'";
                ResultSet rt = con.selectCommand(two);
                if (rt.next()) {
                    b = rt.getString("two");
                    System.out.println(b);
                }

                if (!a.equals("0")) {


            %>
            <h1>New Complaints</h1>
            <table >
                <thead>
                    <tr style="background-color: #74CBF9">
                        <th>Sl.No</th>
                        <th>Complaint</th>
                        <th>Date</th>
                        <td>Department</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%                                                int i = 0;
                        String selQry = "select * from tbl_complaint c inner join tbl_department co on co.department_id=c.department_id where co.college_id='" + session.getAttribute("cid") + "' and complaint_status='0'";
                        ResultSet rs = con.selectCommand(selQry);
                        while (rs.next()) {

                            i++;

                    %>
                    <tr>
                       <td><%=i%></td>
                       <td><%=rs.getString("complaint_content")%></td>
                       <td><%=rs.getString("complaint_date")%></td>
                       <td><%=rs.getString("department_name")%></td>
                       <td><a href="ViewDepartmentComplaint.jsp?up=<%=rs.getString("complaint_id")%>" >Reply</a> </td>
                    </tr>
                    <%                      }

                        }
                    %>

                </tbody>
            </table>
            <%
                if (!b.equals("0")) {
            %>
            <h1>Replied Complaints</h1>
                <table >
                    <thead>
                        <tr style="background-color: #74CBF9">
                            <th>Sl.No</th>
                            <th>Complaint</th>
                            <th>Date</td>
                            <th>Department</th>
                            <th>Reply</th>
                            <th>Reply Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                                                int j = 0;
                            String selQry1 = "select * from tbl_complaint c inner join tbl_department co on co.department_id=c.department_id where co.college_id='" + session.getAttribute("cid") + "' and complaint_status='1'";
                            ResultSet rs1 = con.selectCommand(selQry1);
                            while (rs1.next()) {

                                j++;

                        %>
                        <tr>
                            <td><%=j%></td>
                            <td><%=rs1.getString("complaint_content")%></td>
                            <td ><%=rs1.getString("complaint_date")%></td>
                            <td ><%=rs1.getString("department_name")%></td>
                            <td ><%=rs1.getString("complaint_reply")%></td>
                            <td ><%=rs1.getString("complaint_reply_date")%></td>
                        </tr>
                        <%                      }
                            }

                        %>

                    </tbody>
                </table>
            </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>

