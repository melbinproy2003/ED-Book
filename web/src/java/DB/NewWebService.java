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

    @WebMethod(operationName = "LoginDetails")
    public String LoginDetails(@WebParam(name = "email") String email, @WebParam(name = "password") String password) {

        String sel = "select * from tbl_student where student_email='" + email + "' and student_password='" + password + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
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
                jo.put("coure", profile.getString("course_name"));
                jo.put("batch", profile.getString("batch_name"));
                jo.put("contact", profile.getString("student_contact"));
                j.put(jo);
            }
        } catch (SQLException |JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return j.toString();
    }
}
