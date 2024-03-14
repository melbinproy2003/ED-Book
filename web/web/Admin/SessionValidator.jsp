<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("aid") == null)
        {
            response.sendRedirect("../");
        }
    %>