package com.example.edbook;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Chat extends AppCompatActivity {

    CardView b1;
    RecyclerView namerecyclesrview;
    String id,Name[],tid[],Pic[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chat);

        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        id=sh.getString("id","");

//        b1 = findViewById(R.id.chat);

//        b1.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//
//                startActivity(new Intent(Chat.this, Chatbox.class));
//            }
//        });

        BottomNavigationView bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setSelectedItemId(R.id.bottom_chat);

        bottomNavigationView.setOnItemSelectedListener(item ->{

            int itemid = item.getItemId();

            if(itemid == R.id.bottom_home){
                startActivity(new Intent(getApplicationContext(),Home.class));
                overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
                finish();
                return true;
            } else if (itemid == R.id.bottom_chat) {
                return true;
            } else if (itemid == R.id.bottom_Myaccount) {
                startActivity(new Intent(getApplicationContext(), Myaccount.class));
                overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
                finish();
                return true;
            }else {
                return false;
            }

        });

        namerecyclesrview=findViewById(R.id.ChatRecyclerview);
        Chat.viewpost vp = new Chat.viewpost();
        vp.execute(id);
    }

    public class viewpost extends AsyncTask<String, String, String> {
        private ChatAdapter.OnItemClickListener itemClickListener; // Add this variable

        public void setOnItemClickListener(ChatAdapter.OnItemClickListener listener) {
            itemClickListener = listener;
        }
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("chat");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute (String s){
//            Toast.makeText(Chat.this, s, Toast.LENGTH_SHORT).show();
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                tid = new String[j.length()];
                Name = new String[j.length()];
                Pic = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    tid[i] = jo.getString("teacherid");
                    Name[i] = jo.getString("teachername");
                    Pic[i] = jo.getString("teacherphoto");
//                    Toast.makeText(Home.this, name[i], Toast.LENGTH_SHORT).show();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            ChatAdapter myAdapter = new ChatAdapter(Chat.this,Name,Pic);
            myAdapter.setOnItemClickListener(new ChatAdapter.OnItemClickListener() {
                @Override
                public void onItemClick(int position) {
                    Intent i = new Intent(Chat.this, Chatbox.class);
                    i.putExtra("id", tid[position]);
                    startActivity(i);
                }
            });

            namerecyclesrview.setAdapter(myAdapter);
            namerecyclesrview.setLayoutManager(new LinearLayoutManager(Chat.this));
        }

    }


}