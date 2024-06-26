package com.example.edbook;

import static com.example.edbook.WebServiceCaller.ip;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.google.android.material.bottomnavigation.BottomNavigationView;

public class Myaccount extends AppCompatActivity {

    Button b1,b2,b3;
    String name;
    TextView Name;

    ImageView Profile;

    String  url = "http://"+ip+":8084/ED-Book/Assets/Files/Student/";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_myaccount);

        Name = findViewById(R.id.profilename);
        Profile = findViewById(R.id.profilepic);

        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        name=sh.getString("name","");

        Name.setText(name);


//navigation bar <start>
        BottomNavigationView bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setSelectedItemId(R.id.bottom_Myaccount);

        bottomNavigationView.setOnItemSelectedListener(item ->{

            int itemid = item.getItemId();

            if(itemid == R.id.bottom_home){
                startActivity(new Intent(getApplicationContext(),Home.class));
                overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
                finish();
                return true;
            } else if (itemid == R.id.bottom_chat) {
                startActivity(new Intent(getApplicationContext(),Chat.class));
                overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
                finish();
                return true;
            } else if (itemid == R.id.bottom_Myaccount) {
                return true;
            }else {
                return false;
            }

        });
        //navigation bar <End>

        b1 = findViewById(R.id.myprofile);
        b2 = findViewById(R.id.password);
        b3 = findViewById(R.id.lecture);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Myaccount.this, Studentprofile.class));
            }
        });

        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Myaccount.this,ChangePassword.class));
            }
        });

        b3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Myaccount.this,lecture.class));
            }
        });
    }
}