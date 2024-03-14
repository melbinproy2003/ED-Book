<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String Id = request.getParameter("id");
    String selQry = "select * from tbl_like where post_id ='"+Id+"' and department_id ='"+session.getAttribute("did")+"'";
    ResultSet rs = con.selectCommand(selQry);
    if(!rs.next())
    {
    String insQry = "insert into tbl_like(post_id,department_id,department_name,department_photo,college_photo,teacher_photo,student_photo)"
            + "values('" + Id + "','" + session.getAttribute("did") + "','" + session.getAttribute("dname") + "','" + session.getAttribute("dphoto") + "','0','0','0')";

    if (con.executeCommand(insQry)) {
        String likesel = "select count(like_id) as count from tbl_like where post_id='" + Id + "'";
        ResultSet cv = con.selectCommand(likesel);
        if (cv.next()) {
            out.println(cv.getString("count"));
            System.out.println(insQry);
        }

    } else {
        out.println("0");
        System.out.println(insQry);
    }
    }

%>