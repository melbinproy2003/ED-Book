<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String Id = request.getParameter("id");
    String selQry = "select * from tbl_like where post_id ='" + Id + "' and student_id ='" + session.getAttribute("sid") + "'";
    ResultSet rs = con.selectCommand(selQry);
    if (!rs.next()) {
        String insQry = "insert into tbl_like(post_id,student_id,student_name,student_photo,department_photo,teacher_photo,college_photo)"
                + "values('" + Id + "','" + session.getAttribute("sid") + "','" + session.getAttribute("sname") + "','" + session.getAttribute("sphoto") + "','0','0','0')";

        if (con.executeCommand(insQry)) {
            String likesel = "select count(like_id) as count from tbl_like where post_id='" + Id + "'";
            ResultSet cv = con.selectCommand(likesel);
            if (cv.next()) {
                out.println(cv.getString("count"));
            }

        } else {
            out.println("0");
            System.out.println(insQry);
        }
    }
%>