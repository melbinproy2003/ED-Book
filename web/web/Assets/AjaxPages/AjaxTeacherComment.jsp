<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String id = request.getParameter("id");
    String Content = request.getParameter("content");
     
    String insQry = "insert into tbl_comment(comment_date,teacher_id,teacher_name,teacher_photo,department_photo,college_photo,student_photo,comment_content,post_id)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'"+session.getAttribute("tid") +"','"+session.getAttribute("tname") +"','"+session.getAttribute("tphoto") +"','0','0','0','"+Content+"','"+id+"')";
    
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