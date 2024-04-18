package com.example.edbook;

import static com.example.edbook.WebServiceCaller.ip;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;

    public class Chatbox extends AppCompatActivity {

        WebView webview;
        private String Url,Id;
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_chatbox);


            SharedPreferences sh = getSharedPreferences("user", MODE_PRIVATE);
            String sid = sh.getString("id", "");


            Intent intent = getIntent();
            String tid = intent.getStringExtra("id");

            Url = "http://"+ip+":8084/ED-Book/TeacherChat/Chat.jsp?uid="+sid+"&tid="+tid;

            webview = findViewById(R.id.webview);
            webview.loadUrl(Url);

            webview.getSettings().setJavaScriptEnabled(true);
            webview.setWebViewClient(new WebViewClient()
            {
                public boolean shouldOverrideUrlLoading(WebView view , String url){

                    view.loadUrl(url);
                    return true;
                }
            });

        }

        @Override
        public void onBackPressed() {

            if(webview.canGoBack())
            {
                webview.goBack();
            }
            else
                super.onBackPressed();
        }
    }