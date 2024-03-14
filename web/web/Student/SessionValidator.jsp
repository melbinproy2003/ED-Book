<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("sid") == null)
        {
            response.sendRedirect("../");
        }
    %>