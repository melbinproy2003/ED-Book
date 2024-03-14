<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String insQry="insert into tbl_teacher_student_chat (from_teacher_id,to_student_id,chat_content,chat_date) values('"+session.getAttribute("tid")+"','"+request.getParameter("id") +"','"+request.getParameter("chat") +"',DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'))";
    if(con.executeCommand(insQry))
    {
        out.println("sended");
    }
    else
    {
        out.println("failed");
        out.println(insQry);
    }
    
%>