<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
        String url = request.getParameter("url");
        String insQry = "insert into tbl_phishingurls (phishing_url,phishing_date) values('" + url + "',DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'))";
        con.executeCommand(insQry);
       

        

%>