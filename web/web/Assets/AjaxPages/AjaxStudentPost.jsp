<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String Type = request.getParameter("type");
    String Content = request.getParameter("content");
    String File=request.getParameter("file");
    
    String insQry = "insert into tbl_post(post_date,college_id,department_id,student_id,student_name,student_photo,teacher_photo,college_photo,department_photo,post_content,post_file,privacy_status)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'"+session.getAttribute("scid") +"','"+session.getAttribute("sdid") +"','"+session.getAttribute("sid") +"','"+session.getAttribute("sname") +"','"+session.getAttribute("sphoto") +"','0','0','0','"+Content+"','"+File+"','"+Type+"')";

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