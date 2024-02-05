<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<option value="">--select--</option>
<%
    String selsubject="select * from tbl_subject where course_id='"+request.getParameter("cid")+"' and semester_id='"+request.getParameter("sid")+"' ";
    out.print(selsubject);
    ResultSet re=con.selectCommand(selsubject);
    while(re.next())
    {
        %>
        <option value="<%=re.getString("Subject_id")%>"><%=re.getString("subject_name")%></option>
        <%
    }
%>