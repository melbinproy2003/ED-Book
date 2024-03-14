<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String Type = request.getParameter("type");
    String Content = request.getParameter("content");
     String File=request.getParameter("file");
     
    String insQry = "insert into tbl_post(post_date,college_id,college_name,college_photo,department_photo,teacher_photo,student_photo,post_content,post_file,privacy_status)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'"+session.getAttribute("cid") +"','"+session.getAttribute("cname") +"','"+session.getAttribute("cphoto") +"','0','0','0','"+Content+"','"+File+"','"+Type+"')";
    System.out.println(insQry);
    
    if(con.executeCommand(insQry))
    {
        out.println("1");
    }
    else
    {
        out.println("0");
    }
    
%>