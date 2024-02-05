<%-- 
    Document   : Homepage
    Created on : 16 Dec, 2023, 1:52:09 AM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=session.getAttribute("collegename")%> HomePage</title>
    </head>
    <body align="center">
        <h1><%out.print(session.getAttribute("collegename"));%></h1>
        <a href="CollegeProfile.jsp"><button>Profile</button></a>
        <a href="NewDepartment.jsp"><button>Add Department</button></a>
        <a href="NewTeacher.jsp"><button>Add Teacher</button></a>
        <a href="Batch.jsp"><button>Add Batch</button></a>
        <a href="CollegePost.jsp"><button>Add Post</button></a>
        <br><br>
        <%
            String sel="select * from tbl_post";
            ResultSet selpost=con.selectCommand(sel);
            while(selpost.next()){
                String status=selpost.getString("post_status");
                //university
                if(selpost.getString("university_id")!=null){
                    if(status.equals("0")){
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
                    if(status.equals("1")){
                        String university=selpost.getString("university_id");
                        if(university.equals(session.getAttribute("universityid"))){
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
                    }
                }
                // college
                else if(selpost.getString("college_id")!=null){
                    String check="select * from tbl_college where college_id='"+selpost.getString("college_id")+"'";
                    ResultSet checkcollege=con.selectCommand(check);
                    checkcollege.next();
                    if(checkcollege.getString("university_id").equals(session.getAttribute("universityid"))){
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
                        if(status.equals("3")){
                            String college=selpost.getString("college_id");
                            if(college.equals(session.getAttribute("collegeid"))){
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
                }
                //Department
                else if(selpost.getString("department_id")!=null){
                    String check="select * from tbl_department where department_id='"+selpost.getString("department_id")+"'";
                    ResultSet checkdepartment=con.selectCommand(check);
                    checkdepartment.next();
                    if(checkdepartment.getString("college_id").equals(session.getAttribute("collegeid"))){
                        if(status.equals("4")){
                            String department=selpost.getString("department_id");
                            String select="select * from tbl_department d inner join tbl_departmenttype dt on d.departmenttype_id=dt.departmenttype_id where department_id='"+department+"'";
                            ResultSet uni=con.selectCommand(select);
                            uni.next();
                            out.print(uni.getString("departmenttype_name"));
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
                        if(status.equals("5")){
                            String department=selpost.getString("department_id");
                            if(department.equals(session.getAttribute("departmentid"))){
                                String select="select * from tbl_department d inner join tbl_departmenttype dt on d.departmenttype_id=dt.departmenttype_id where department_id='"+department+"'";
                                ResultSet uni=con.selectCommand(select);
                                uni.next();
                                out.print(uni.getString("departmenttype_name"));
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
                }
            }
        %>
    </body>
</html>