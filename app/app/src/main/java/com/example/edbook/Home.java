package com.example.edbook;

import static com.example.edbook.WebServiceCaller.ip;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.Dialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Base64;
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
    String likeStatus[],likecount[];
    String name[],content[],post[],profile[],id,cid[],profileurl[],pid;
    String userName[],userPhoto[],postDate[],postContent[],postFile[],postId[];

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

        ViewPost vp = new ViewPost();
        vp.execute(id);


    }

    public class ViewPost extends AsyncTask<String, String, String>{
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
                userName = new String[j.length()];
                userPhoto = new String[j.length()];
                postDate = new String[j.length()];
                postContent = new String[j.length()];
                postFile = new String[j.length()];
                postId = new String[j.length()];
                likeStatus = new String[j.length()];
                likecount = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    userName[i] = jo.getString("userName");
                    userPhoto[i] = jo.getString("userPhoto");
                    postDate[i] = jo.getString("postDate");
                    postContent[i] = jo.getString("postContent");
                    postFile[i] = jo.getString("postFile");
                    postId[i] = jo.getString("postId");
                    likeStatus[i] = jo.getString("status");
                    likecount[i] = jo.getString("count");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            HomeAdapter homeAdapter = new HomeAdapter(Home.this, userName, userPhoto, postDate, postContent,postFile,likeStatus,likecount);
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
//        Toast.makeText(this, "Like button clicked at position: " + postId[position] + ",Student id :" +id, Toast.LENGTH_SHORT).show();        // Add your logic for handling like button click
        pid = postId[position];
        LikePost lp = new LikePost(position);
        lp.execute(pid,id);
    }

    public class LikePost extends AsyncTask<String, String, String>{
        private int position;

        public LikePost(int position) {
            this.position = position;
        }
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("likepost");
            wb.addProperty("pid", strings[0]);
            wb.addProperty("id", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute (String s){
            super.onPostExecute(s);

            JSONArray j = null;
            try {
                j = new JSONArray(s);
                JSONObject jo = j.getJSONObject(0);
                String status = jo.getString("status");
                if ("liked".equals(status)) {
                    // Update the like status for the corresponding post
                    likeStatus[position] = "liked";
                } else {
                    // Update the like status for the corresponding post
                    likeStatus[position] = "not_liked";
                }
                // Notify adapter about data change at this position
                recyclerView.getAdapter().notifyItemChanged(position);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void onCommentClick(int position) {
        // Handle comment button click here
//          Toast.makeText(this, "Comment button clicked at position: " + position, Toast.LENGTH_SHORT).show();        // Add your logic for handling like button click

        // Add your logic for handling comment button click
        Intent i = new Intent(Home.this, Comments.class);
        i.putExtra("id", postId[position]);
        startActivity(i);
    }

}