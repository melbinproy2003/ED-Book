<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String Type = request.getParameter("type");
    String Content = request.getParameter("content");
    String File=request.getParameter("file");
    
    String insQry = "insert into tbl_post(post_date,college_id,department_id,teacher_id,teacher_name,teacher_photo,student_photo,college_photo,department_photo,post_content,post_file,privacy_status)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'"+session.getAttribute("tcid") +"','"+session.getAttribute("tdid") +"','"+session.getAttribute("tid") +"','"+session.getAttribute("tname") +"','"+session.getAttribute("tphoto") +"','0','0','0','"+Content+"','"+File+"','"+Type+"')";
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