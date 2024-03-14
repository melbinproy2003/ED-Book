<%-- 
    Document   : Header
    Created on : May 13, 2021, 11:17:49 PM
    Author     : Pro-TECH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title> Timeline</title>
        <link rel="icon" type="image/png" href="../Assets/friendskit/assets/img/favicon.png" />
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/fontisto@v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet">
        <!-- Core CSS -->
        <link rel="stylesheet" href="../Assets/friendskit/assets/css/app.css">
        <link rel="stylesheet" href="../Assets/friendskit/assets/css/core.css">
        <link rel="stylesheet" href="../Assets/form.css">
    </head>

    <body>

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>
        <div class="app-overlay is-sidebar-v1"></div>

        <div class="sidebar-v1 is-fold">
            <div class="top-section">
                <button id="sidebar-v1-close" class="close-button">
                    <i data-feather="arrow-left"></i>
                </button>


                <div class="user-block">
                    <img class="avatar" src="<%=session.getAttribute("tphoto")%>" alt="">
                    <div class="meta">
                        <span style="margin-left: 7px"><%=session.getAttribute("tname")%></span>
                        <span style="margin-left: 10px">Teacher</span>
                    </div>
                </div>
            </div>
            <div class="bottom-section">
                <ul>
                    <li>
                        <a href="HomePage.jsp" class="is-active">
                            <i data-feather="clock"></i>
                            <span>Timeline</span>
                        </a>
                    </li>
                     <li>
                        <a href="Lecture.jsp" >
                            <i data-feather="book"></i>
                            <span>Lectures</span>
                        </a>
                    </li>
                    <li>
                        <a href="ViewClasses.jsp" >
                            <i data-feather="box"></i>
                            <span>Class List</span>
                        </a>
                    </li>
                      <li>
                        <a href="Complaint.jsp" >
                            <i data-feather="alert-circle"></i>
                            <span>Complaint</span>
                        </a>
                    </li>
                    <li>
                        <a href="Feedback.jsp" >
                            <i data-feather="alert-triangle"></i>
                            <span>Feedback</span>
                        </a>
                    </li>
                    <li>
                        <a href="../logout.jsp" >
                            <i data-feather="log-out"></i>
                            <span>Logout</span>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="view-wrapper is-sidebar-v1 is-fold">

            <div class="toolbar-v1-fixed-wrap">
                <div class="toolbar-v1 is-narrow">
                    <!-- Sidebar Trigger -->
                    <div class="friendkit-hamburger sidebar-v1-trigger">
                        <span class="menu-toggle has-chevron">
                            <span class="icon-box-toggle">
                                <span class="rotate">
                                    <i class="icon-line-top"></i>
                                    <i class="icon-line-center"></i>
                                    <i class="icon-line-bottom"></i>
                                </span>
                            </span>
                        </span>
                    </div>
                    <div class="controls">
                        <div class="navbar-item is-icon drop-trigger">
                            <a class="icon-link" href="javascript:void(0);">
                                <i data-feather="mail"></i>
                                <span class="indicator"></span>
                            </a>

                            <div class="nav-drop is-right" style="width: 250px">
                                <div class="inner">
                                    <div class="nav-drop-header">
                                        <span>Messages</span>
                                        <a href="#">Inbox</a>
                                    </div>
                                    <div class="nav-drop-body is-friend-requests">
                                        <!-- Message -->
                                        <div class="media">
                                            <div class="media-content">
                                                <a href="DepartmentChat/Chat.jsp">Department Group</a>
                                            </div>
                                            <div class="media-right is-centered">
                                                <div class="added-icon">
                                                    <a href="DepartmentChat/Chat.jsp" > <i data-feather="message-square"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="account-dropdown" class="navbar-item is-account drop-trigger has-caret">
                            <div class="user-image">
                                <img src="<%=session.getAttribute("tphoto")%>" alt="">
                                <span class="indicator"></span>
                            </div>

                            <div class="nav-drop is-account-dropdown">
                                <div class="inner">
                                    <div class="nav-drop-header">
                                        <span class="username"><%=session.getAttribute("tname")%></span>
                                        <label class="theme-toggle">
                                            <input type="checkbox">
                                            <span class="toggler">
                                                <span class="dark">
                                                    <i data-feather="moon"></i>
                                                </span>
                                                <span class="light">
                                                    <i data-feather="sun"></i>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                    <div class="nav-drop-body account-items">
                                        <a id="profile-link" href="ViewProfile.jsp" class="account-item">
                                            <div class="media">
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="<%=session.getAttribute("tphoto")%>" alt="">
                                                    </div>
                                                </div>
                                                <div class="media-content">
                                                    <h3><%=session.getAttribute("tname")%></h3>
                                                    <small>View Profile</small>
                                                </div>
                                                <div class="media-right">
                                                    <i data-feather="check"></i>
                                                </div>
                                            </div>
                                        </a>
                                        <hr class="account-divider">
                                        <a class="account-item" href="../logout.jsp">
                                            <div class="media">
                                                <div class="icon-wrap">
                                                    <i data-feather="power"></i>
                                                </div>
                                                <div class="media-content">
                                                    <h3>Log out</h3>
                                                    <small>Log out from your account.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Container -->
            <div id="main-feed" class="container sidebar-boxed" data-open-sidebar data-page-title="Timeline">

                <div class="toolbar-v1 is-narrow">
                    <!-- Sidebar Trigger -->
                    <div class="friendkit-hamburger sidebar-v1-trigger">
                        <span class="menu-toggle has-chevron">
                            <span class="icon-box-toggle">
                                <span class="rotate">
                                    <i class="icon-line-top"></i>
                                    <i class="icon-line-center"></i>
                                    <i class="icon-line-bottom"></i>
                                </span>
                            </span>
                        </span>
                    </div>
                    <div class="controls">
                        <div class="navbar-item is-icon drop-trigger">
                            <a class="icon-link" href="javascript:void(0);">
                                <i data-feather="mail"></i>
                                <span class="indicator"></span>
                            </a>

                             <div class="nav-drop is-right" style="width: 250px">
                                <div class="inner">
                                    <div class="nav-drop-header">
                                        <span>Messages</span>
                                        <a href="#">Inbox</a>
                                    </div>
                                    <div class="nav-drop-body is-friend-requests">
                                        <!-- Message -->
                                        <div class="media">
                                            <div class="media-content">
                                                <a href="DepartmentChat/Chat.jsp">Department Group</a>
                                            </div>
                                            <div class="media-right is-centered">
                                                <div class="added-icon">
                                                    <a href="DepartmentChat/Chat.jsp" > <i data-feather="message-square"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="account-dropdown" class="navbar-item is-account drop-trigger has-caret">
                            <div class="user-image">
                                <img src="<%=session.getAttribute("tphoto")%>" alt="">
                                <span class="indicator"></span>
                            </div>

                            <div class="nav-drop is-account-dropdown">
                                <div class="inner">
                                    <div class="nav-drop-header">
                                        <span class="username"><%=session.getAttribute("tname")%></span>
                                        <label class="theme-toggle">
                                            <input type="checkbox">
                                            <span class="toggler">
                                                <span class="dark">
                                                    <i data-feather="moon"></i>
                                                </span>
                                                <span class="light">
                                                    <i data-feather="sun"></i>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                    <div class="nav-drop-body account-items">
                                        <a id="profile-link" href="ViewProfile.jsp" class="account-item">
                                            <div class="media">
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="<%=session.getAttribute("tphoto")%>" alt="">
                                                    </div>
                                                </div>
                                                <div class="media-content">
                                                    <h3><%=session.getAttribute("tname")%></h3>
                                                    <small>View Profile</small>
                                                </div>
                                                <div class="media-right">
                                                    <i data-feather="check"></i>
                                                </div>
                                            </div>
                                        </a>
                                        <hr class="account-divider">
                                        <a class="account-item" href="../logout.jsp">
                                            <div class="media">
                                                <div class="icon-wrap">
                                                    <i data-feather="power"></i>
                                                </div>
                                                <div class="media-content">
                                                    <h3>Log out</h3>
                                                    <small>Log out from your account.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
