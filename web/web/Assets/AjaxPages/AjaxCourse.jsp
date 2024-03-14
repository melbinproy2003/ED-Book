<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<option value="">Select</option>
                                <%
                                    String disQry = "select * from tbl_course where department_type_id='"+request.getParameter("did")+"'";
                                    ResultSet  rs1 = con.selectCommand(disQry);
                                    while(rs1.next())
                                    {
                                        %>
                                        <option value="<%=rs1.getString("course_id")%>"><%=rs1.getString("course_name")%></option>
                                        
                                        <%
                                    }
                                
                                %>