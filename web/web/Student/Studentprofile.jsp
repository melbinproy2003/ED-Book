<%-- 
    Document   : Teacherprofile
    Created on : 19 Dec, 2023, 12:08:35 AM
    Author     : MELBIN
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Profile</title>
    </head>
    <%
     String select="select * from tbl_student s inner join tbl_place p on s.place_id=p.place_id inner join tbl_district d on p.district_id=d.district_id inner join tbl_course c on s.course_id=c.course_id "
             + "inner join tbl_department dep on s.department_id=dep.department_id inner join tbl_departmenttype depty on dep.departmenttype_id=depty.departmenttype_id inner join tbl_college col on dep.college_id=col.college_id "
             + "inner join tbl_university un on col.university_id=un.university_id inner join tbl_batch bat on s.batch_id=bat.batch_id where student_id='"+session.getAttribute("studentid")+"'";
     ResultSet student=con.selectCommand(select);
     student.next();
    %>
    <body>
        <h1 align="center"> Profile </h1>
        <table  border="1" align="center">
            <tr>
                <td colspan="2" align="center">
                    <img src="../Assets/Files/Student/<%=student.getString("student_photo")%>" width="100px" height="100px">
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=student.getString("student_name")%></td>
            </tr>
            <tr>
                <td>Contact</td>
                <td><%=student.getString("student_contact")%></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%=student.getString("student_email")%></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%=student.getString("student_address")%></td>
            </tr>
            <tr>
                <td>District</td>
                <td><%=student.getString("district_name")%></td>
            </tr>
            <tr>
                <td>Place</td>
                <td><%=student.getString("place_name")%></td>
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td><%=student.getString("student_dob")%></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><%=student.getString("student_gender")%></td>
            </tr>
            <tr>
                <td>University</td>
                <td><%=student.getString("university_name")%></td>
            </tr>
            <tr>
                <td>College</td>
                <td><%=student.getString("college_name")%></td>
            </tr>
            <tr>
                <td>Batch</td>
                <td><%=student.getString("batch_name")%></td>
            </tr>
            <tr>
                <td>Department</td>
                <td><%=student.getString("departmenttype_name")%></td>
            </tr>
            <tr>
                <td>Course</td>
                <td><%=student.getString("course_name")%></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a href="Editprofile.jsp"><button>Edit profile</button></a>
                    <a href="ChangePassword.jsp"><button>Change Password</button></a>
                </td>
            </tr>
        </table>
    </body>
</html>
