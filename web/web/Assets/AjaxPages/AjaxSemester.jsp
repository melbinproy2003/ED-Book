<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<option value="">--select--</option>
<%
    String selcourse="select * from tbl_course where course_id='"+request.getParameter("sid")+"' ";
    out.print(selcourse);
    ResultSet re=con.selectCommand(selcourse);
    re.next();
    String semcount=re.getString("sem_count");
    String sel="select * from tbl_semester limit "+semcount+"";
    out.print(sel);
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("semester_id")%>"><%=rs.getString("semester_count")%></option>
        <%
    }
%>