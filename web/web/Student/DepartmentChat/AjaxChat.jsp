<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String insQry="insert into tbl_department_chat (to_department_id,from_student_id,dc_content,dc_date) values('"+session.getAttribute("sdid") +"','"+session.getAttribute("sid") +"','"+request.getParameter("chat") +"',DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'))";
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