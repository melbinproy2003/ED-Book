package com.example.edbook;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Studentprofile extends AppCompatActivity {

    String id,Name,Address,District,Place,Dob,Gender,Department,Course,Batch,Contact,Email;
    TextView name;
    TextView address;
    TextView district;
    TextView palce;
    TextView dob;
    TextView gender;
    TextView department;
    TextView course;
    TextView batch;
    TextView contact;
    TextView email;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_studentprofile);


        name = findViewById(R.id.name);
        address = findViewById(R.id.address);
        district = findViewById(R.id.district);
        palce = findViewById(R.id.place);
        dob = findViewById(R.id.dob);
        gender = findViewById(R.id.gender);
        department = findViewById(R.id.department);
        course = findViewById(R.id.course);
        batch = findViewById(R.id.batch);
        contact = findViewById(R.id.contact);
        email = findViewById(R.id.email);
        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        id=sh.getString("id","");
        Log.d("err",id);

        studentprofile sp = new studentprofile();
        sp.execute(id);

    }

    public class studentprofile extends AsyncTask<String, String, String>{

        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("studentprofile");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(Studentprofile.this, s, Toast.LENGTH_SHORT).show();
//            Toast.makeText(Studentprofile.this, s, Toast.LENGTH_SHORT).show();
//            if (!s.equals("[]")) {
                JSONArray j = null;
                try {
                    j = new JSONArray(s);
                    JSONObject jo = j.getJSONObject(0);
                    name.setText(jo.getString("name"));
                    email.setText(jo.getString("email"));
                    address.setText(jo.getString("address"));
                    district.setText(jo.getString("district"));
                    palce.setText(jo.getString("place"));
                    dob.setText(jo.getString("dob"));
                    gender.setText(jo.getString("gender"));
                    department.setText(jo.getString("departemnt"));
                    course.setText(jo.getString("course"));
                    batch.setText(jo.getString("batch"));
                    contact.setText(jo.getString("contact"));

//                    Toast.makeText(Studentprofile.this, "success", Toast.LENGTH_SHORT).show();


//                    SharedPreferences.Editor sh = getSharedPreferences("user", MODE_PRIVATE).edit();
//                    sh.putString("id", id);
//                    sh.putString("name", name);
//                    sh.apply();

                } catch (JSONException e) {
                    e.printStackTrace();
                }

//                Intent i=new Intent(LoginActivity.this,Home.class);
//                startActivity(i);


//            } else {
//                Toast.makeText(LoginActivity.this, "faild", Toast.LENGTH_SHORT).show();
//
//            }
        }
    }
}