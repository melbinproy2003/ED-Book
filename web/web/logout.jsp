<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    session.invalidate();
    response.sendRedirect("");
%>