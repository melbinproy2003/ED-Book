package com.example.edbook;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.Dialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import org.w3c.dom.Comment;

public class Home extends AppCompatActivity implements HomeAdapter.OnItemClickListener{

//    ImageButton comment,like;

    RecyclerView recyclerView;
    String name[],content[],post[],profile[],id,cid[],profileurl[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        id=sh.getString("id","");

        BottomNavigationView bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setSelectedItemId(R.id.bottom_home);

        bottomNavigationView.setOnItemSelectedListener(item ->{

            int itemid = item.getItemId();

            if(itemid == R.id.bottom_home){
                return true;
            } else if (itemid == R.id.bottom_chat) {
                startActivity(new Intent(getApplicationContext(),Chat.class));
                overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
                finish();
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

        recyclerView=findViewById(R.id.Recyclerview);

        viewpost vp = new viewpost();
        vp.execute(id);


    }

    public class viewpost extends AsyncTask<String, String, String>{
        private HomeAdapter.OnItemClickListener itemClickListener; // Add this variable

        public void setOnItemClickListener(HomeAdapter.OnItemClickListener listener) {
            itemClickListener = listener;
        }
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("ViewPost");
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
                cid = new String[j.length()];
                content = new String[j.length()];
                post = new String[j.length()];
                profile = new String[j.length()];
                profileurl = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    cid[i] = jo.getString("cid");
                    name[i] = jo.getString("name");
                    content[i] = jo.getString("content");
                    post[i] = jo.getString("post");
                    profile[i] = jo.getString("profile");
                    profileurl[i] = jo.getString("profileurl");
//                    Toast.makeText(Home.this, name[i], Toast.LENGTH_SHORT).show();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            HomeAdapter homeAdapter = new HomeAdapter(Home.this, name, content, post, profile,profileurl);
            homeAdapter.setLikeClickListener((HomeAdapter.OnItemClickListener) Home.this);
            homeAdapter.setCommentClickListener((HomeAdapter.OnItemClickListener) Home.this);
            recyclerView.setAdapter(homeAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(Home.this));
        }

    }


    @Override
    public void onItemClick(int position) {
        // Handle item click here
        Log.d("TAG", "Item clicked at position: " + position);
    }

    @Override
    public void onLikeClick(int position) {
        // Handle like button click here
        Toast.makeText(this, "Like button clicked at position: " + position, Toast.LENGTH_SHORT).show();        // Add your logic for handling like button click
    }

    @Override
    public void onCommentClick(int position) {
        // Handle comment button click here
          Toast.makeText(this, "Comment button clicked at position: " + position, Toast.LENGTH_SHORT).show();        // Add your logic for handling like button click

        // Add your logic for handling comment button click
        Intent i = new Intent(Home.this, Comments.class);
        i.putExtra("id", cid[position]);
        startActivity(i);
    }

}