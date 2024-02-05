<%-- 
    Document   : Homepage
    Created on : 18 Dec, 2023, 2:36:08 PM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin HomePage</title>
    </head>
    <body align="center">
        <h1 align="center"><%out.print(session.getAttribute("adminname"));%></h1>
        <a href="District.jsp"><button>Add District</button></a>
        <a href="Place.jsp"><button>Add Place</button></a>
        <a href="University.jsp"><button>Add University</button></a>
        <a href="Course.jsp"><button>Add Course</button></a>
        <a href="DepartmentType.jsp"><button>Add Department type</button></a>
        <a href="Semester.jsp"><button>Add Semester</button></a>
        <a href="Subject.jsp"><button>Add Subject</button></a>
        <a href="CollegeVerification.jsp"><button>Verification of College</button></a>
        <a href="AcceptedListofCollege.jsp"><button>List of College</button></a>
        <a href="Post.jsp"><button>New Post</button></a>
        <br><br>
        <%
            String sel="select * from tbl_post";
            ResultSet selpost=con.selectCommand(sel);
            while(selpost.next()){
                String status=selpost.getString("post_status");
                //university
                if(selpost.getString("university_id")!=null){
                        String university=selpost.getString("university_id");
                        String select="select * from tbl_university where university_id='"+university+"'";
                        ResultSet uni=con.selectCommand(select);
                        uni.next();
                        out.print(uni.getString("university_name"));
                        %>
                        <br>
                        <img src="../Assets/Files/Post/<%=selpost.getString("post_file")%>" width="100">
                        <br>
                        <%
                        out.print(selpost.getString("post_content"));
                        %>
                        <br><br>
                        <%
                }
                // college
                else if(selpost.getString("college_id")!=null){
                    String check="select * from tbl_college where college_id='"+selpost.getString("college_id")+"'";
                    ResultSet checkcollege=con.selectCommand(check);
                    checkcollege.next();
                        if(status.equals("2")){
                            String college=selpost.getString("college_id");
                            String select="select * from tbl_college where college_id='"+college+"'";
                            ResultSet uni=con.selectCommand(select);
                            uni.next();
                            out.print(uni.getString("college_name"));
                            %>
                            <br>
                            <img src="../Assets/Files/Post/<%=selpost.getString("post_file")%>" width="100">
                            <br>
                            <%
                            out.print(selpost.getString("post_content"));
                            %>
                            <br><br>
                            <%
                        }
                }
            }
        %>
    </body>
</html>
