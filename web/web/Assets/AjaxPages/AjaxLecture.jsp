<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<option value="">Select</option>
                                <%
                                    String disQry = "select * from tbl_subject s inner join tbl_teacher_assign ta on ta.subject_id=s.subject_id where teacher_id='"+session.getAttribute("tid")+"' and s.semester_id='"+request.getParameter("sid")+"' and course_id='"+request.getParameter("id")+"'";
                                    ResultSet  rs1 = con.selectCommand(disQry);
                                    while(rs1.next())
                                    {
                                        %>
                                        <option value="<%=rs1.getString("subject_id")%>"><%=rs1.getString("subject_name")%></option>
                                        
                                        <%
                                    }
                                
                                %>