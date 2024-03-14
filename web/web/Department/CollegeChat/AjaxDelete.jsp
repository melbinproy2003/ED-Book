<%-- 
    Document   : AjaxDelete
    Created on : 20 Jun, 2023, 9:51:59 AM
    Author     : BASIL LENIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String insQry="update tbl_college_department_chat set cdc_content='This message was Deleted' where cdc_id='"+request.getParameter("cid") +"'";
    if(con.executeCommand(insQry))
    {
        out.println("updated");
    }
    else
    {
        out.println("failed");
        out.println(insQry);
    }
    
%>