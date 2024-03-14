<%-- 
    Document   : Chat
    Created on : May 8, 2021, 4:07:26 PM
    Author     : Pro-TECH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">

        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta http-equiv="x-ua-compatible" content="ie=edge">

            <title>Chat</title>
            <link rel="icon" type="image/png" href="../../Assets/friendskit/assets/img/favicon.png" />
            <!-- Fonts -->
            <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
            <!-- Core CSS -->
            <link rel="stylesheet" href="../../Assets/friendskit/assets/css/app.css">
            <link rel="stylesheet" href="../../Assets/friendskit/assets/css/core.css">

        </head>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if (session.getAttribute("sid") == null) {
            response.sendRedirect("../../");
        }
    %>
    <body>

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>

        <div class="chat-wrapper is-standalone">
            <div class="chat-inner">

                <%
                    String selQr = "select * from tbl_teacher where teacher_id='" + request.getParameter("id") + "'";
                    ResultSet rs = con.selectCommand(selQr);
                    rs.next();


                %>

                <!-- Chat top navigation -->
                <div class="chat-nav">
                    <div class="nav-start">
                        <div class="recipient-block">
                            <div class="avatar-container">
                                <img class="user-avatar" style="width: 42px; height:42px " src="<%=rs.getString("teacher_photo")%>" alt="">
                            </div>
                            <div class="username">
                                <span><%=rs.getString("teacher_name")%></span>
                            </div>
                        </div>
                    </div>
                    <div class="nav-end">

                        <a href="../HomePage.jsp" class="chat-nav-item is-icon is-hidden-mobile">
                            <i data-feather="home"></i>
                        </a>

                    </div>
                </div>

                <!-- Chat sidebar -->
                <div id="chat-sidebar" class="users-sidebar">   
                    <!-- User list -->

                </div>

                <!-- Chat body -->
                <div id="chat-body" class="chat-body">
                    <!-- Conversation -->
                    <div id="conversation" class="chat-body-inner has-slimscroll">

                    </div>
                    <!-- Compose message area -->
                    <div class="chat-action">
                        <div class="chat-action-inner">
                            <div class="control" style="text-align: center">
                                <textarea class="textarea comment-textarea" id="msg" rows="2"></textarea>
                                <input type="button" value="Send" name="btn_send"  id="btn_send" onclick="sendChat()"
                                       style="border: none;background-color: #5082c3;border-radius: 15px 10px; color: white;
                                       margin: 10px; margin-bottom: 30px ; width: 30%; height: 25px">
                                <input type="hidden" name="txt_hid" id="txt_hid" value="<%=request.getParameter("id")%>"/>

                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <script src="../../Assets/JQuery/jQuery.js"></script>
          <script>
                                    function deleteChat(id)
                                    {
                                        var text = "Press a button!\nEither OK or Cancel.";
                                        if (confirm(text) == true) {
                                            $.ajax({
                                                url: "AjaxDelete.jsp",
                                                type: "POST",
                                                data: {sid: id},
                                                success: function(result) {

                                                }
                                            });
                                        } else {
                                            text = "You canceled!";
                                        }
                                    }

        </script>
        <script src="chat.js"></script>
        <!-- Concatenated js plugins and jQuery -->
        <script src="../../Assets/friendskit/assets/js/app.js"></script>
        <script src="https://js.stripe.com/v3/"></script>
        <script src="../../Assets/friendskit/assets/data/tipuedrop_content.js"></script>

        <!-- Core js -->
        <script src="../../Assets/friendskit/assets/js/global.js"></script>

        <!-- Navigation options js -->
        <script src="../../Assets/friendskit/assets/js/navbar-v1.js"></script>
        <script src="../../Assets/friendskit/assets/js/navbar-v2.js"></script>
        <script src="../../Assets/friendskit/assets/js/navbar-mobile.js"></script>
        <script src="../../Assets/friendskit/assets/js/navbar-options.js"></script>
        <script src="../../Assets/friendskit/assets/js/sidebar-v1.js"></script>

        <!-- Core instance js -->
        <script src="../../Assets/friendskit/assets/js/main.js"></script>
        <!--        <script src="../../Assets/friendskit/assets/js/chat.js"></script>-->
        <script src="../../Assets/friendskit/assets/js/touch.js"></script>
        <script src="../../Assets/friendskit/assets/js/tour.js"></script>

        <!-- Components js -->
        <script src="../../Assets/friendskit/assets/js/explorer.js"></script>
        <script src="../../Assets/friendskit/assets/js/widgets.js"></script>
        <script src="../../Assets/friendskit/assets/js/modal-uploader.js"></script>
        <script src="../../Assets/friendskit/assets/js/popovers-users.js"></script>
        <script src="../../Assets/friendskit/assets/js/popovers-pages.js"></script>
        <script src="../../Assets/friendskit/assets/js/lightbox.js"></script>




    </body>

</html>