<%-- 
    Document   : SignUp
    Created on : Jun 2, 2021, 7:54:33 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title> College Connect</title>
        <link rel="icon" type="image/png" href="Assets/friendskit/assets/img/favicon.png" />
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
        <!-- Core CSS -->
        <link rel="stylesheet" href="Assets/friendskit/assets/css/app.css">
        <link rel="stylesheet" href="Assets/friendskit/assets/css/core.css">
    </head>
    <%        if (request.getParameter("btn_save") != null) {

            String insQry = "insert into tbl_college(college_name,college_contact,college_email,college_address,college_photo,college_password,place_id)"
                    + "values('" + request.getParameter("txt_name") + "','" + request.getParameter("txt_number") + "','" + request.getParameter("txt_email") + "',"
                    + "'" + request.getParameter("txt_address") + "','" + request.getParameter("converted_photo") + "','" + request.getParameter("txt_password") + "','" + request.getParameter("sel_place") + "')";
            con.executeCommand(insQry);
            response.sendRedirect("index.jsp");

        }

    %>
    <body>

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>
        <div class="signup-wrapper">


            <div class="process-bar-wrap">
                <div class="process-bar">
                    <div class="progress-wrap">
                        <div class="track"></div>
                        <div class="bar"></div>
                        <div id="step-dot-1" class="dot is-first is-active is-current" data-step="0">
                            <i data-feather="smile"></i>
                        </div>
                        <div id="step-dot-2" class="dot is-second" data-step="25">
                            <i data-feather="user"></i>
                        </div>
                        <div id="step-dot-3" class="dot is-third" data-step="50">
                            <i data-feather="image"></i>
                        </div>
                        <div id="step-dot-4" class="dot is-fourth" data-step="75">
                            <i data-feather="lock"></i>
                        </div>
                        <div id="step-dot-5" class="dot is-fifth" data-step="100">
                            <i data-feather="flag"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="outer-panel">
                <div class="outer-panel-inner">
                    <div class="process-title">
                        <h2 id="step-title-1" class="step-title is-active" style="margin-top: 25px">Welcome to College-Connect.</h2>
                        <h2 id="step-title-2" class="step-title" style="margin-top: 25px">Tell us more about you.</h2>
                        <h2 id="step-title-3" class="step-title">Upload a profile picture.</h2>
                        <h2 id="step-title-4" class="step-title">Secure your account.</h2>
                        <h2 id="step-title-5" class="step-title">You're all set. Ready?</h2>
                    </div>
                    <form method="post">
                        <div id="signup-panel-1" class="process-panel-wrap is-active">
                            <div class="columns mt-4">
                                <div class="column is-4">
                                    <!--                                <div class="account-type">
                                                                        <div class="type-image">
                                                                            <img class="type-illustration" src="Assets/friendskit/assets/img/illustrations/signup/type-1.svg" alt="">
                                                                            <img class="type-bg light-image" src="Assets/friendskit/assets/img/illustrations/signup/type-1-bg.svg" alt="">
                                                                            <img class="type-bg dark-image" src="Assets/friendskit/assets/img/illustrations/signup/type-1-bg-dark.svg" alt="">
                                                                        </div>
                                                                        <h3>Company</h3>
                                                                        <p>Create a company account to be able to do some awesome things.</p>
                                                                        <a class="button is-fullwidth process-button" data-step="step-dot-2">
                                                                            Continue
                                                                        </a>
                                                                    </div>-->
                                </div>
                                <div class="column is-4">
                                    <div class="account-type">
                                        <div class="type-image">
                                            <img class="type-illustration" src="Assets/friendskit/assets/img/illustrations/signup/type-3.svg" alt="">
                                            <img class="type-bg light-image" src="Assets/friendskit/assets/img/illustrations/signup/type-3-bg.svg" alt="">
                                            <img class="type-bg dark-image" src="Assets/friendskit/assets/img/illustrations/signup/type-3-bg-dark.svg" alt="">
                                        </div>

                                        <h3>College</h3>
                                        <p>Create a Colllege account to be able to do some awesome things.</p>
                                        <a class="button is-fullwidth process-button" data-step="step-dot-2">
                                            Continue
                                        </a>
                                    </div>
                                </div>
                                <div class="column is-4">
                                    <!--                                <div class="account-type">
                                                                        <div class="type-image">
                                                                            <img class="type-illustration" src="Assets/friendskit/assets/img/illustrations/signup/type-2.svg" alt="">
                                                                            <img class="type-bg light-image" src="Assets/friendskit/assets/img/illustrations/signup/type-2-bg.svg" alt="">
                                                                            <img class="type-bg dark-image" src="Assets/friendskit/assets/img/illustrations/signup/type-2-bg-dark.svg" alt="">
                                                                        </div>
                                                                        <h3>Public Person</h3>
                                                                        <p>Create a public account to be able to do some awesome things.</p>
                                                                        <a class="button is-fullwidth process-button" data-step="step-dot-2">
                                                                            Continue
                                                                        </a>
                                                                    </div>-->
                                </div>

                            </div>
                        </div>

                        <div id="signup-panel-2" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <div class="field">
                                    <label>Name</label>
                                    <div class="control">
                                        <input type="text" required="" class="input" id="txt_name" name="txt_name" placeholder="Enter College name">
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Contact</label>
                                    <div class="control">
                                        <input  required="" type="tel"  id="txt_number" name="txt_number" class="input" placeholder="Enter College contact">
                                    </div>
                                </div>

                                <div class="field">
                                    <label>Address</label>
                                    <div class="control">
                                        <textarea class="input" required="" id="txt_address" name="txt_address" placeholder="Enter College address" style="border: none;background: transparent"></textarea>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>District</label>
                                    <div class="control">
                                        <select required="" class="input" id="sel_district" style="border: none;background: transparent" onchange="getPlace(this.value)" name="sel_district">
                                            <option value="">Select</option>
                                            <%                                            String disQry = "select * from tbl_district";
                                                ResultSet rs = con.selectCommand(disQry);
                                                while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                            <%
                                                }

                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Place</label>
                                    <div class="control">
                                        <select required="" style="border: none;background: transparent" class="input" id="sel_place" name="sel_place">
                                            <option value="">Select</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="buttons">
                                <a class="button process-button" data-step="step-dot-1">Back</a>
                                <a class="button process-button is-next" data-step="step-dot-3">Next</a>
                            </div>
                        </div>

                        <div id="signup-panel-3" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <div class="photo-upload">
                                    <div class="preview">
                                        <a class="upload-button">
                                            <i data-feather="plus"></i>
                                        </a>
                                        <img id="upload-preview" src="Assets/friendskit/assets/img/avatars/avatar-w.png" alt="">
                                        <input type="hidden" required="" id="converted" name="converted_photo">

                                    </div>
                                    <div class="limitation">
                                        <small>Only images with a size lower than 1MB are allowed.</small>
                                    </div>
                                </div>
                            </div>

                            <div class="buttons">
                                <a class="button process-button" data-step="step-dot-2">Back</a>
                                <a class="button process-button is-next" data-step="step-dot-4">Next</a>
                            </div>
                        </div>

                        <div id="signup-panel-4" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <div class="field">
                                    <label>Email</label>
                                    <div class="control">
                                        <input required="" type="email"  id="txt_email" name="txt_email" class="input" placeholder="Enter College email address">
                                    </div>
                                </div>
                                <div class="field">
                                    <label>Password</label>
                                    <div class="control">
                                        <input required="" type="password" placeholder="Choose a password" class="input" id="txt_password" name="txt_password">
<!--                                               pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                               title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" -->

                                    </div>
                                </div>
                            </div>

                            <div class="buttons">
                                <a class="button process-button" data-step="step-dot-3">Back</a>
                                <a class="button process-button is-next" data-step="step-dot-5">Next</a>
                            </div>
                        </div>

                        <div id="signup-panel-5" class="process-panel-wrap is-narrow">
                            <div class="form-panel">
                                <img class="success-image" src="Assets/friendskit/assets/img/illustrations/signup/mailbox.svg" alt="">
                                <div class="success-text">
                                    <h3>Congrats, you successfully created your account.</h3>
                                    <p> We just sent you a confirmation email. PLease confirm your account within 24 hours.</p>
                                    <button type="submit" name="btn_save" id="signup-finish" class="button is-fullwidth">Let Me In</button>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </form>
        <form id="profile-pic-dz" class="dropzone is-hidden" action="/"></form>

        <!--Edit Credit card Modal-->
        <div id="crop-modal" class="modal is-small crop-modal is-animated">
            <div class="modal-background"></div>
            <div class="modal-content">
                <div class="modal-card">
                    <header class="modal-card-head">
                        <h3>Crop your picture</h3>
                        <div class="close-wrap">
                            <button class="close-modal" aria-label="close">
                                <i data-feather="x"></i>
                            </button>
                        </div>
                    </header>
                    <div class="modal-card-body">
                        <div id="cropper-wrapper" class="cropper-wrapper">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Assets/JQuery/jQuery.js"></script>
    <script>
                                            function getPlace(did)
                                            {

                                                $.ajax({url: "Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                                    success: function(result) {
                                                       
                                                        $("#sel_place").html(result);
                                                    }});
                                            }

    </script>
    <!-- Concatenated js plugins and jQuery -->
    <script src="Assets/friendskit/assets/js/app.js"></script>
    <script src="https://js.stripe.com/v3/"></script>
    <script src="Assets/friendskit/assets/data/tipuedrop_content.js"></script>

    <!-- Core js -->
    <script src="Assets/friendskit/assets/js/global.js"></script>

    <!-- Navigation options js -->
    <script src="Assets/friendskit/assets/js/navbar-v1.js"></script>
    <script src="Assets/friendskit/assets/js/navbar-v2.js"></script>
    <script src="Assets/friendskit/assets/js/navbar-mobile.js"></script>
    <script src="Assets/friendskit/assets/js/navbar-options.js"></script>
    <script src="Assets/friendskit/assets/js/sidebar-v1.js"></script>

    <!-- Core instance js -->
    <script src="Assets/friendskit/assets/js/main.js"></script>
    <script src="Assets/friendskit/assets/js/chat.js"></script>
    <script src="Assets/friendskit/assets/js/touch.js"></script>
    <script src="Assets/friendskit/assets/js/tour.js"></script>

    <!-- Components js -->
    <script src="Assets/friendskit/assets/js/explorer.js"></script>
    <script src="Assets/friendskit/assets/js/widgets.js"></script>
    <script src="Assets/friendskit/assets/js/modal-uploader.js"></script>
    <script src="Assets/friendskit/assets/js/popovers-users.js"></script>
    <script src="Assets/friendskit/assets/js/popovers-pages.js"></script>
    <script src="Assets/friendskit/assets/js/lightbox.js"></script>

    <!-- Landing page js -->

    <!-- Signup page js -->
    <script src="Assets/friendskit/assets/js/signup.js"></script>

    <!-- Feed pages js -->


    <!-- profile js -->

    <!-- stories js -->

    <!-- friends js -->

    <!-- questions js -->

    <!-- video js -->

    <!-- events js -->

    <!-- news js -->

    <!-- shop js -->

    <!-- inbox js -->

    <!-- settings js -->


</body>

</html>