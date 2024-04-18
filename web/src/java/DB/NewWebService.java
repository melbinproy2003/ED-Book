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
                + "inner join tbl_department dep on s.department_id=dep.department_id inner join tbl_department_type dept on dep.department_type_id=dept.department_type_id "
                + "inner join tbl_batch b on s.batch_id=b.batch_id where s.student_id='" + id + "'";
        ResultSet profile = con.selectCommand(profiledata);
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
                jo.put("department", profile.getString("department_type_name"));
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
        try {
            String sel = "select * from tbl_student s inner join tbl_semester sem on s.semester_id=sem.semester_id inner join tbl_department d on s.department_id=d.department_id inner join tbl_department_type dt on d.department_type_id=dt.department_type_id inner join tbl_college c on c.college_id=d.college_id  where student_id='" + id + "'";
            ResultSet rsQ = con.selectCommand(sel);
            rsQ.next();
            String studentCollegeId = rsQ.getString("college_id");
            String studentDepartmentId = rsQ.getString("department_id");

            String userPhoto = "";
            String userName = "";
            String postDate = "";
            String postFile = "";
            String postContent = "";
            String postId = "";
            String selQry = "select * from tbl_post where privacy_status in ('0','1','2','5') order by post_id desc";
            ResultSet rs = con.selectCommand(selQry);
            JSONArray j = new JSONArray();
            while (rs.next()) {
                
                JSONObject jo = new JSONObject();
                postDate = rs.getString("post_date");
                postId = rs.getString("post_id");

                if (!rs.getString("post_file").equals("")) {
                    postFile = rs.getString("post_file");
                }

                if (!rs.getString("post_content").equals("")) {
                    postContent = rs.getString("post_content");
                }
                if (rs.getString("privacy_status").equals("0")) {
                    userPhoto = rs.getString("university_photo");
                    userName = rs.getString("university_name");

                } else if (rs.getString("privacy_status").equals("1")) {
                    userPhoto = rs.getString("college_photo");
                    userName = rs.getString("college_name");

                } else if (rs.getString("privacy_status").equals("2")) {
                    if (rs.getString("college_id").equals(studentCollegeId)) {
                        if (rs.getString("department_id").equals("0") && rs.getString("teacher_id").equals("0") && rs.getString("student_id").equals("0")) {
                            userPhoto = rs.getString("college_photo");
                            userName = rs.getString("college_name");

                        } else if (rs.getString("teacher_id").equals("0") && rs.getString("student_id").equals("0")) {

                            userPhoto = rs.getString("department_photo");
                            userName = rs.getString("department_name");

                        } else if (rs.getString("student_id").equals("0")) {
                            userPhoto = rs.getString("teacher_photo");
                            userName = rs.getString("teacher_name");

                        } else if (rs.getString("teacher_id").equals("0")) {

                            userPhoto = rs.getString("student_photo");
                            userName = rs.getString("student_name");

                        }
                    }
                } else if (rs.getString("privacy_status").equals("5")) {
                    if (rs.getString("department_id").equals(studentDepartmentId)) {
                        if (rs.getString("teacher_id").equals("0") && rs.getString("student_id").equals("0")) {

                            userPhoto = rs.getString("department_photo");
                            userName = rs.getString("department_name");

                        } else if (rs.getString("student_id").equals("0")) {

                            userPhoto = rs.getString("teacher_photo");
                            userName = rs.getString("teacher_name");

                        } else if (rs.getString("teacher_id").equals("0")) {
                            userPhoto = rs.getString("student_photo");
                            userName = rs.getString("student_name");

                        }
                    }
                }
                String selectlike = "select * from tbl_like  where post_id='" + rs.getString("post_id") + "' and student_id='" + id + "'";
                ResultSet like = con.selectCommand(selectlike);
                if (like.next()) {

                    jo.put("status", "liked");
                } else {

                    jo.put("status", "unliked");
                }
                String likecount = "SELECT IFNULL(COUNT(like_id), 0) AS count FROM tbl_like where post_id='" + rs.getString("post_id") + "'";
                System.out.println(likecount);
                ResultSet likec = con.selectCommand(likecount);
                likec.next();
                    jo.put("count",likec.getString("count"));
                jo.put("userName", userName);
                jo.put("userPhoto", userPhoto);
                jo.put("postDate", postDate);
                jo.put("postContent", postContent);
                jo.put("postFile", postFile);
                jo.put("postId", postId);
                j.put(jo);

            }
            return j.toString();
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "No Data";

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
            JSONArray j = new JSONArray();
            while (rc.next()) {
                JSONObject jo = new JSONObject();
                if (!rc.getString("college_id").equals("0")) {
                    jo.put("name", rc.getString("college_name"));
                    jo.put("comment", rc.getString("comment_content"));
                    jo.put("date", rc.getString("comment_date"));
                    jo.put("profile", rc.getString("college_photo"));
                } else if (!rc.getString("department_id").equals("0")) {
                    jo.put("name", rc.getString("department_name"));
                    jo.put("comment", rc.getString("comment_content"));
                    jo.put("date", rc.getString("comment_date"));
                    jo.put("profile", rc.getString("department_photo"));
                } else if (!rc.getString("student_id").equals("0")) {
                    jo.put("name", rc.getString("student_name"));
                    jo.put("comment", rc.getString("comment_content"));
                    jo.put("date", rc.getString("comment_date"));
                    jo.put("profile", rc.getString("student_photo"));
                }
                j.put(jo);
            }
            return j.toString();
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetPassword")
    public String getPassword(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        String select = "select * from tbl_student where student_id='" + id + "'";
        ResultSet sp = con.selectCommand(select);
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
        try {
            String select="select * from tbl_student where student_id='"+sid+"'";
            ResultSet stu=con.selectCommand(select);
            stu.next();
            //TODO write your implementation code here:
            String insert = "insert into tbl_comment(comment_date,comment_content,post_id,student_id,college_photo,department_photo,teacher_photo,student_name,student_photo) "
                    + "values(curdate(),'" + comment + "','" + id + "','" + sid + "','0','0','0','"+stu.getString("student_name")+"','"+ stu.getString("student_photo") +"')";
            con.executeCommand(insert);
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "chat")
    public String chat(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        String select = "select * from tbl_teacher_student_chat where from_student_id='" + id + "' or to_student_id='" + id + "'";
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

        String select = "select * from tbl_teacher_student_chat where from_student_id='" + sid + "' or to_student_id='" + sid + "'";
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

    /**
     * Web service operation
     */
    @WebMethod(operationName = "likepost")
    public String likepost(@WebParam(name = "pid") String pid, @WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        String selectlike = "select * from tbl_like  where post_id='" + pid + "' and student_id='" + id + "'";
        ResultSet like = con.selectCommand(selectlike);
        JSONArray j = new JSONArray();
        JSONObject jo = new JSONObject();
        try {
            if (like.next()) {
                String removelike = "delete from tbl_like where like_id='" + like.getString("like_id") + "'";
                con.executeCommand(removelike);
                jo.put("status", "unliked");
            } else {
                String selstu = "select * from tbl_student where student_id = '" + id + "'";
                ResultSet st = con.selectCommand(selstu);
                st.next();
                String addlike = "insert into tbl_like(post_id,student_id,student_name,student_photo,department_photo,teacher_photo,college_photo)"
                        + " values('" + pid + "','" + id + "','" + st.getString("student_name") + "','" + st.getString("student_photo") + "','0','0','0')";
                con.executeCommand(addlike);
                jo.put("status", "liked");
            }
            j.put(jo);
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.err.println(j.toString());
        return j.toString();

    }
}
