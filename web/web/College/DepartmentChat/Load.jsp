<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_college_department_chat cdc inner join tbl_college c on (cdc.to_college_id=c.college_id) or (cdc.from_college_id=c.college_id) where c.college_id='" + session.getAttribute("cid") + "' order by cdc_id";
    System.out.println(selQry);
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {
        if (rs.getString("from_college_id").equals(session.getAttribute("cid"))) {

%>

<div class="chat-message is-sent">
    <img src="<%=rs.getString("college_photo")%>" alt="">
    <div class="message-block">
        <span><%=rs.getString("college_name")%>(College)</span>
        <div class="message-text"><%=rs.getString("cdc_content")%></div>
    </div>
    <img style="width: 20px;height: 20px;margin-top: 30px" src="../../Assets/friendskit/assets/img/icons/feed/delete.svg" onclick="deleteChat(<%=rs.getString("cdc_id")%>)">
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%

} else if (rs.getString("to_college_id").equals(session.getAttribute("cid"))) {
    String sel = "select * from tbl_department where department_id='" + rs.getString("from_department_id") + "'";
    ResultSet z = con.selectCommand(sel);
    if (z.next()) {
%>
<div class="chat-message is-received">
    <img src="<%=z.getString("department_photo")%>" alt="">
    <div class="message-block">
        <span><%=z.getString("department_name")%>(Department)</span>
        <div class="message-text"><%=rs.getString("cdc_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%
            }
        }
    }


%>