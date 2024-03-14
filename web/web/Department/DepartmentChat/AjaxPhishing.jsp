<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
        String url = request.getParameter("url");
        String insQry = "insert into tbl_phishingurls (phishing_url,phishing_date) values('" + url + "',DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'))";
        con.executeCommand(insQry);
        
          common_classes.mailconnection m = new common_classes.mailconnection();
    String mailid[] = {session.getAttribute("demail").toString()};
    String subject = "Found Phishing Url";
    String text = "Found Phishing Url";
    boolean b = m.sendMail(mailid, subject, text);


%>