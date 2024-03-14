package com.example.edbook;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Chatbox extends AppCompatActivity {

    ImageButton b1;

    RecyclerView recyclerView;

    String name[],chat[],replay[],sid,tid,date[];
    EditText message;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chatbox);

        b1 = findViewById(R.id.back);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        SharedPreferences sh = getSharedPreferences("user", MODE_PRIVATE);
        sid = sh.getString("id", "");


        Intent intent = getIntent();
        tid = intent.getStringExtra("id");

        recyclerView=findViewById(R.id.chatRecyclerview);

        Chat cv = new Chat();
        cv.execute(tid,sid);
    }

//    public class PostComment extends AsyncTask<String, String, String> {
//        @Override
//        protected String doInBackground(String... strings) {
//            WebServiceCaller wb = new WebServiceCaller();
//            wb.setSoapObject("PostComment");
//            wb.addProperty("id", strings[0]);
//            wb.addProperty("comment", strings[1]);
//            wb.addProperty("sid", strings[2]);
//            wb.callWebService();
//            return wb.getResponse();
//        }
//        @Override
//        protected void onPostExecute (String s){
//            Comments.viewComment vc = new Comments.viewComment();
//            vc.execute(id);
//        }
//    }

    public class Chat extends AsyncTask<String, String, String>{
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("viewChat");
            wb.addProperty("tid", strings[0]);
            wb.addProperty("sid", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute (String s){
            Toast.makeText(Chatbox.this,s, Toast.LENGTH_SHORT).show();
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                name = new String[j.length()];
                chat = new String[j.length()];
                date = new String[j.length()];
//                date = new String[j.length()];
//                profile = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    name[i] = jo.getString("name");
                    chat[i] = jo.getString("chat");
                    date[i] = jo.getString("chatdate");
//                    profile[i] = jo.getString("profile");
                    Toast.makeText(Chatbox.this, name[i], Toast.LENGTH_SHORT).show();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            ChatboxAdapter chatboxAdapter = new ChatboxAdapter(Chatbox.this,name,chat,date);
            recyclerView.setAdapter(chatboxAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(Chatbox.this));
        }

    }
}