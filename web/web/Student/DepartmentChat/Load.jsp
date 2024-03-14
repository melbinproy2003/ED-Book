<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_department_chat dc inner join tbl_department d on (dc.to_department_id=d.department_id) or (dc.from_department_id=d.department_id) where d.department_id='" + session.getAttribute("sdid") + "' order by dc_id";
    System.out.println(selQry);
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {

        if (rs.getString("from_department_id").equals(session.getAttribute("sdid"))) {


%>

<div class="chat-message is-received">
    <img src="<%=rs.getString("department_photo")%>" alt="">
    <div class="message-block">
        <span><%=rs.getString("department_name")%>(Department)</span>
        <div class="message-text"><%=rs.getString("dc_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%

} else if (rs.getString("to_department_id").equals(session.getAttribute("sdid"))) {
    if (rs.getString("from_student_id").equals("0")) {
        String sel = "select * from tbl_teacher where teacher_id='" + rs.getString("from_teacher_id") + "'";
        ResultSet z = con.selectCommand(sel);
        if (z.next()) {
%>
<div class="chat-message is-received">
    <img src="<%=z.getString("teacher_photo")%>" alt="">
    <div class="message-block">
        <span><%=z.getString("teacher_name")%>(Teacher)</span>
        <div class="message-text"><%=rs.getString("dc_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%
    }
} else if (rs.getString("from_teacher_id").equals("0")) {

    String sel = "select * from tbl_student where student_id='" + rs.getString("from_student_id") + "'";
    ResultSet z = con.selectCommand(sel);
    if (z.next()) {
        if (rs.getString("from_student_id").equals(session.getAttribute("sid"))) {
%>
<div class="chat-message is-sent">
    <img src="<%=z.getString("student_photo")%>" alt="">
    <div class="message-block">
        <span><%=z.getString("student_name")%>(Student)</span>
        <div class="message-text"><%=rs.getString("dc_content")%></div>
    </div>
    <img style="width: 20px;height: 20px;margin-top: 30px" src="../../Assets/friendskit/assets/img/icons/feed/delete.svg" onclick="deleteChat(<%=rs.getString("dc_id")%>)">
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%
} else {
%>
<div class="chat-message is-received">
    <img src="<%=z.getString("student_photo")%>" alt="">
    <div class="message-block">
        <span><%=z.getString("student_name")%>(Student)</span>
        <div class="message-text"><%=rs.getString("dc_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%
                    }
                }
            }

        }
    }


%>