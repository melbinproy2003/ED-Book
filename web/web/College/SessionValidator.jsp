<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("cid") == null)
        {
            response.sendRedirect("../");
        }
    %>