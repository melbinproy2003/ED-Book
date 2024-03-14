<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String id = request.getParameter("id");
    String Content = request.getParameter("content");
     
    String insQry = "insert into tbl_comment(comment_date,department_id,department_name,department_photo,college_photo,teacher_photo,student_photo,comment_content,post_id)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'"+session.getAttribute("did") +"','"+session.getAttribute("dname") +"','"+session.getAttribute("dphoto") +"','0','0','0','"+Content+"','"+id+"')";
    
    if(con.executeCommand(insQry))
    {
        out.println("1");
    }
    else
    {
        out.println("0");
        System.out.println(insQry);
    
    }
    
%>