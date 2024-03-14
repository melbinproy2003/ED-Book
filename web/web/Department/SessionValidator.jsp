<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("did") == null)
        {
            response.sendRedirect("../");
        }
    %>