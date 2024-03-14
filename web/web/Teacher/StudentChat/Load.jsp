<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_teacher_student_chat tsc inner join tbl_teacher t on (tsc.to_teacher_id=t.teacher_id) or (tsc.from_teacher_id=t.teacher_id) where t.teacher_id='" + session.getAttribute("tid") + "' order by chat_id";
    //System.out.println(selQry);
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {

        if (rs.getString("to_student_id").equals(request.getParameter("id"))) {


%>

<div class="chat-message is-sent">
    <img src="<%=rs.getString("teacher_photo")%>" alt="">
    <div class="message-block">
        <span><%=rs.getString("teacher_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
      <img style="width: 20px;height: 20px;margin-top: 30px" src="../../Assets/friendskit/assets/img/icons/feed/delete.svg" onclick="deleteChat(<%=rs.getString("chat_id")%>)">
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%

} else if (rs.getString("from_student_id").equals(request.getParameter("id"))) {

    String sel = "select * from tbl_student where student_id='" + rs.getString("from_student_id") + "'";
   
    ResultSet z = con.selectCommand(sel);
    if (z.next()) {
%>
<div class="chat-message is-received">
    <img src="<%=z.getString("student_photo")%>" alt="">
    <div class="message-block">
        <span><%=z.getString("student_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%
            }

        }
    }


%>