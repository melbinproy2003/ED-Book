<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String Id = request.getParameter("id");
    String insQry = "Delete from tbl_like where student_id = '"+session.getAttribute("sid") +"' and post_id='"+Id+"'";
    
    if (con.executeCommand(insQry)) {
        String likesel = "select count(like_id) as count from tbl_like where post_id='" + Id + "'";
        ResultSet cv = con.selectCommand(likesel);
        if (cv.next()) {
            out.println(cv.getString("count"));
        }

    } 
    else
    {
        out.println("0");
        System.out.println(insQry);
    }
    
%>