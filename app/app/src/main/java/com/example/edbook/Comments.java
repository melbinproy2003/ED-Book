package com.example.edbook;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Comments extends AppCompatActivity {

    RecyclerView recyclerView;

    EditText comments;
    ImageButton postcomment;
    String name[],comment[],profile[],date[],id,Comments,sid;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_comments);

        comments = findViewById(R.id.editcomments);
        postcomment = findViewById(R.id.sentcomments);

        SharedPreferences sh = getSharedPreferences("user", MODE_PRIVATE);
        sid = sh.getString("id", "");

        postcomment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Comments =comments.getText().toString();
                PostComment pc = new PostComment();
                pc.execute(id,Comments,sid);
                comments.setText("");
            }
        });

        Intent intent = getIntent();
         id = intent.getStringExtra("id");

        recyclerView=findViewById(R.id.commentRecyclerview);

        viewComment vc = new viewComment();
        vc.execute(id);
    }

    public class PostComment extends AsyncTask<String, String, String>{
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("PostComment");
            wb.addProperty("id", strings[0]);
            wb.addProperty("comment", strings[1]);
            wb.addProperty("sid", strings[2]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute (String s){
            viewComment vc = new viewComment();
            vc.execute(id);
        }
    }

    public class viewComment extends AsyncTask<String, String, String>{
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("viewComment");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute (String s){
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                name = new String[j.length()];
                comment = new String[j.length()];
                date = new String[j.length()];
//                profile = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    name[i] = jo.getString("name");
                    comment[i] = jo.getString("comment");
                    date[i] = jo.getString("date");
//                    profile[i] = jo.getString("profile");
//                    Toast.makeText(Comments.this, name[i], Toast.LENGTH_SHORT).show();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            CommentsAdapter commentsAdapter = new CommentsAdapter(Comments.this,name,comment,date);
            commentsAdapter.setOnItemClickListener(new CommentsAdapter.OnItemClickListener(){
                @Override
                public void onItemClick(int position) {
//                    Intent i = new Intent(Home.this, Comments.class);
//                    i.putExtra("id",cid[position]);
//
//                    startActivity(i);
                }
            });

            recyclerView.setAdapter(commentsAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(Comments.this));
        }

    }
}