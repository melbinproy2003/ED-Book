<%-- 
    Document   : AjaxDelete
    Created on : 20 Jun, 2023, 9:57:48 AM
    Author     : BASIL LENIN
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String insQry="update tbl_department_chat set dc_content='This message was Deleted' where dc_id='"+request.getParameter("did") +"'";
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