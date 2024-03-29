package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebService(serviceName = "NewWebService")
public class NewWebService {

    ConnectionClass con = new ConnectionClass();
    private Object j;

    @WebMethod(operationName = "LoginDetails")
    public String LoginDetails(@WebParam(name = "email") String email, @WebParam(name = "password") String password) {

        String sel = "select * from tbl_student where student_email='" + email + "' and student_password='" + password + "'";
        ResultSet rs = con.selectCommand(sel);
//        System.out.println(sel);
        JSONArray j = new JSONArray();

        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("id", rs.getString("student_id"));
                jo.put("name", rs.getString("student_name"));
                j.put(jo);
            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "studentprofile")
    public String studentprofile(@WebParam(name = "id") String id) {
        String profiledata = "select * from tbl_student s inner join tbl_place p on s.place_id=p.place_id inner join "
                + "tbl_district d on p.district_id=d.district_id inner join tbl_course c on s.course_id=c.course_id "
                + "inner join tbl_department dep on s.department_id=dep.department_id inner join tbl_departmenttype dept on dep.departmenttype_id=dept.departmenttype_id "
                + "inner join tbl_batch b on s.batch_id=b.batch_id where s.student_id='" + id + "'";
        ResultSet profile = con.selectCommand(profiledata);
//        System.out.println(profiledata);
        JSONArray j = new JSONArray();

        try {
            if (profile.next()) {
                JSONObject jo = new JSONObject();
                jo.put("name", profile.getString("student_name"));
                jo.put("email", profile.getString("student_email"));
                jo.put("address", profile.getString("student_address"));
                jo.put("district", profile.getString("district_name"));
                jo.put("place", profile.getString("place_name"));
                jo.put("dob", profile.getString("student_dob"));
                jo.put("gender", profile.getString("student_gender"));
                jo.put("department", profile.getString("departmenttype_name"));
                jo.put("course", profile.getString("course_name"));
                jo.put("batch", profile.getString("batch_name"));
                jo.put("contact", profile.getString("student_contact"));
                jo.put("profile", profile.getString("student_photo"));
                j.put(jo);
            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ViewPost")
    public String ViewPost(@WebParam(name = "id") String id) {
        JSONArray j = new JSONArray();
        try {
            //TODO write your implementation code here:

            String st = "select * from tbl_student s inner join tbl_department d on s.department_id=d.department_id "
                    + "inner join tbl_college c on d.college_id=c.college_id inner join tbl_university u on c.university_id=u.university_id where student_id='" + id + "'";
            ResultSet selst = con.selectCommand(st);
            selst.next();
            String universityid = selst.getString("university_id");
            String collegeid = selst.getString("college_id");
            String departmentid = selst.getString("department_id");

            String sel = "select * from tbl_post";
            ResultSet selpost = con.selectCommand(sel);
            String universityurl = ":8084/ED-Book/Assets/Files/University/";
            String collegeurl = ":8084/ED-Book/Assets/Files/College/";
            String departmenturl = ":8084/ED-Book/Assets/Files/Department/";
            while (selpost.next()) {
                JSONObject jo = new JSONObject();
                String status = selpost.getString("post_status");
                //university
//                System.out.println("hi"+selpost.getString("university_id"));
                if (selpost.getString("university_id") != null) {
                    if (status.equals("0")) {
                        String university = selpost.getString("university_id");
                        String select = "select * from tbl_university where university_id='" + university + "'";
                        ResultSet uni = con.selectCommand(select);
                        uni.next();
                        jo.put("name", uni.getString("university_name"));
                        jo.put("profile", uni.getString("university_photo"));
                        jo.put("cid", selpost.getString("post_id"));
                        jo.put("post", selpost.getString("post_file"));
                        jo.put("content", selpost.getString("post_content"));
                        jo.put("profileurl", universityurl);
                    }
                    if (status.equals("1")) {
                        String university = selpost.getString("university_id");
                        if (university.equals(universityid)) {
                            String select = "select * from tbl_university where university_id='" + university + "'";
                            ResultSet uni = con.selectCommand(select);
                            uni.next();
                            jo.put("name", uni.getString("university_name"));
                            jo.put("profile", uni.getString("university_photo"));
                            jo.put("cid", selpost.getString("post_id"));
                            jo.put("post", selpost.getString("post_file"));
                            jo.put("content", selpost.getString("post_content"));
                            jo.put("profileurl", universityurl);
                        }
                    }
                } // college
                else if (selpost.getString("college_id") != null) {
                    if (status.equals("2")) {
                        String college = selpost.getString("college_id");
                        String select = "select * from tbl_college where college_id='" + college + "'";
                        ResultSet uni = con.selectCommand(select);
                        uni.next();
                        jo.put("name", uni.getString("college_name"));
                        jo.put("profile", uni.getString("college_photo"));
                        jo.put("cid", selpost.getString("post_id"));
                        jo.put("post", selpost.getString("post_file"));
                        jo.put("content", selpost.getString("post_content"));
                        jo.put("profileurl", collegeurl);
                    }
                    if (status.equals("3")) {
                        String college = selpost.getString("college_id");
                        if (college.equals(collegeid)) {
                            String select = "select * from tbl_college where college_id='" + college + "'";
                            ResultSet uni = con.selectCommand(select);
                            uni.next();
                            jo.put("name", uni.getString("college_name"));
                            jo.put("profile", uni.getString("college_photo"));
                            jo.put("cid", selpost.getString("post_id"));
                            jo.put("post", selpost.getString("post_file"));
                            jo.put("content", selpost.getString("post_content"));
                            jo.put("profileurl", collegeurl);
                        }
                    }
                } //Department
                else if (selpost.getString("department_id") != null) {
                    String check = "select * from tbl_department where department_id='" + selpost.getString("department_id") + "'";
                    ResultSet checkdepartment = con.selectCommand(check);
                    checkdepartment.next();
                    if (checkdepartment.getString("college_id").equals(collegeid)) {
                        if (status.equals("4")) {
                            String department = selpost.getString("department_id");
                            String select = "select * from tbl_department d inner join tbl_departmenttype dt on d.departmenttype_id=dt.departmenttype_id where department_id='" + department + "'";
                            ResultSet uni = con.selectCommand(select);
                            uni.next();
                            jo.put("name", uni.getString("departmenttype_name"));
                            jo.put("profile", uni.getString("department_photo"));
                            jo.put("cid", selpost.getString("post_id"));
                            jo.put("post", selpost.getString("post_file"));
                            jo.put("content", selpost.getString("post_content"));
                            jo.put("profileurl", departmenturl);
                        }
                        if (status.equals("5")) {
                            String department = selpost.getString("department_id");
                            if (department.equals(departmentid)) {
                                String select = "select * from tbl_department d inner join tbl_departmenttype dt on d.departmenttype_id=dt.departmenttype_id where department_id='" + department + "'";
                                ResultSet uni = con.selectCommand(select);
                                uni.next();
                                jo.put("name", uni.getString("departmenttype_name"));
                                jo.put("profile", uni.getString("department_photo"));
                                jo.put("cid", selpost.getString("post_id"));
                                jo.put("post", selpost.getString("post_file"));
                                jo.put("content", selpost.getString("post_content"));
                                jo.put("profileurl", departmenturl);
                            }
                        }
                    }
                }
                j.put(jo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "viewComment")
    public String viewComment(@WebParam(name = "id") String id) {
        try {
            //TODO write your implementation code here:
            String select = "select * from tbl_comment where post_id='" + id + "' order by comment_id DESC";
            ResultSet rc = con.selectCommand(select);
//            System.out.println(select);
            JSONArray j = new JSONArray();
            while (rc.next()) {
                JSONObject jo = new JSONObject();
                if (rc.getString("college_id") != null) {
                    String sel = "select * from tbl_college where college_id='" + rc.getString("college_id") + "'";
                    ResultSet selc = con.selectCommand(sel);
                    selc.next();
                    jo.put("name", selc.getString("college_name"));
                    jo.put("comment", rc.getString("comment_content"));
                    jo.put("date", rc.getString("comment_date"));
                } else if (rc.getString("department_id") != null) {
                    String sel = "select * from tbl_department d inner join tbl_departmenttype dep on d.departmenttype_id=dep.departmenttype_id where d.department_id='" + rc.getString("department_id") + "'";
                    ResultSet selc = con.selectCommand(sel);
                    selc.next();
                    jo.put("name", selc.getString("departmenttype_name"));
                    jo.put("comment", rc.getString("comment_content"));
                    jo.put("date", rc.getString("comment_date"));
                } else if (rc.getString("student_id") != null) {
                    String sel = "select * from tbl_student where student_id='" + rc.getString("student_id") + "'";
                    ResultSet selc = con.selectCommand(sel);
                    selc.next();
                    jo.put("name", selc.getString("student_name"));
                    jo.put("comment", rc.getString("comment_content"));
                    jo.put("date", rc.getString("comment_date"));
                }
                j.put(jo);

            }
            System.out.println(j);
            return j.toString();
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetPassword")
    public String getPassword(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        String select = "select * from tbl_student where student_id='" + id + "'";
        ResultSet sp = con.selectCommand(select);
//        System.out.println(select);
        JSONArray j = new JSONArray();
        try {
            sp.next();
            JSONObject jo = new JSONObject();
            jo.put("password", sp.getString("student_password"));
            j.put(jo);
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "SetPassword")
    public String SetPassword(@WebParam(name = "id") String id, @WebParam(name = "newpassword") String newpassword) {
        //TODO write your implementation code here:
        String update = "update tbl_student set student_password='" + newpassword + "' where student_id = '" + id + "'";

        JSONArray j = new JSONArray();
        JSONObject jo = new JSONObject();
        if (con.executeCommand(update)) {
            try {
                jo.put("message", "Password Changed");
            } catch (JSONException ex) {
                Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                jo.put("message", "Failed");
            } catch (JSONException ex) {
                Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        j.put(jo);
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "PostComment")
    public String PostComment(@WebParam(name = "id") String id, @WebParam(name = "comment") String comment, @WebParam(name = "sid") String sid) {
        //TODO write your implementation code here:
        String insert = "insert into tbl_comment(comment_date,comment_content,post_id,student_id) values(curdate(),'" + comment + "','" + id + "','" + sid + "')";
        con.executeCommand(insert);
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "chat")
    public String chat(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        String select = "select * from tbl_teacher_student_chat where from_student_id='" + id + "' or to_student_id='" + id + "'";
//        System.out.println(select);
        ResultSet re = con.selectCommand(select);
        JSONArray j = new JSONArray();
        JSONObject jo = new JSONObject();
        try {
            while (re.next()) {
                String fromtid = re.getString("from_teacher_id");
                if (fromtid.equals("0")) {
                    String totid = re.getString("to_teacher_id");
                    String selectT = "select * from tbl_teacher where teacher_id ='" + totid + "'";
                    ResultSet trs = con.selectCommand(selectT);
                    trs.next();
                    jo.put("teacherid", totid);
                    jo.put("teachername", trs.getString("teacher_name"));
                    jo.put("teacherphoto", trs.getString("teacher_photo"));
                } else {
                    String selectT = "select * from tbl_teacher where teacher_id = '" + fromtid + "'";
                    ResultSet trs = con.selectCommand(selectT);
                    trs.next();
                    jo.put("teacherid", fromtid);
                    jo.put("teachername", trs.getString("teacher_name"));
                    jo.put("teacherphoto", trs.getString("teacher_photo"));
                }
            }
            j.put(jo);
            System.out.println(j);
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "viewChat")
    public String viewChat(@WebParam(name = "sid") String sid, @WebParam(name = "tid") String tid) {
       
//            System.out.println(sid);
//            System.out.println(tid);
            //TODO write your implementation code here:
            String select = "select * from tbl_teacher_student_chat where from_student_id='" + sid + "' or to_student_id='" + sid + "'";
//            System.out.println(select);
            ResultSet rs = con.selectCommand(select);
            JSONArray j = new JSONArray();
            
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                String teacherid;
                String fromteacherid = rs.getString("from_teacher_id");
                String toteacherid = rs.getString("to_teacher_id");
                if (fromteacherid.equals("")) {
                    teacherid = toteacherid;
                } else {
                    teacherid = fromteacherid;
                }
                String selteacher = "select * from tbl_teacher where teacher_id='" + teacherid + "'";
                ResultSet res = con.selectCommand(selteacher);
                res.next();
                jo.put("name", res.getString("teacher_name"));
                jo.put("chat", rs.getString("chat_content"));
                jo.put("chatdate", rs.getString("chat_date"));
                j.put(jo);
            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }

        
        return j.toString();
    }
}
