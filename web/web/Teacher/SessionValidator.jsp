<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("tid") == null)
        {
            response.sendRedirect("../");
        }
    %>