<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String insQry="insert into tbl_department_chat (from_department_id,dc_content,dc_date) values('"+session.getAttribute("did") +"','"+request.getParameter("chat") +"',DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'))";
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