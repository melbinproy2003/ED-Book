<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String delQry = "delete from tbl_post where post_id='"+request.getParameter("id")+"'";
    con.executeCommand(delQry);
%>