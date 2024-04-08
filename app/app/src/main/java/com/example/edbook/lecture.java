package com.example.edbook;

import static com.example.edbook.WebServiceCaller.ip;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DownloadManager;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.webkit.DownloadListener;
import android.webkit.URLUtil;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class lecture extends AppCompatActivity{

    WebView webview;
    private String Url,Id;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lecture);


        SharedPreferences sh = getSharedPreferences("user", MODE_PRIVATE);
        String sid = sh.getString("id", "");


        Url = "http://"+ip+":8084/ED-Book/Lectures.jsp?uid="+sid;

        webview = findViewById(R.id.lecturewebview);
        webview.loadUrl(Url);

        webview.getSettings().setJavaScriptEnabled(true);
        webview.setWebViewClient(new WebViewClient()
        {
            public boolean shouldOverrideUrlLoading(WebView view , String url){

                view.loadUrl(url);
                return true;
            }
        });

        webview.setDownloadListener(new DownloadListener() {
            @Override
            public void onDownloadStart(String url, String userAgent, String contentDisposition, String mimetype, long contentLength) {
                // Generate a custom file name based on the URL
                String fileName = "downloaded_file";
                if (URLUtil.isValidUrl(url)) {
                    fileName = URLUtil.guessFileName(url, contentDisposition, mimetype);
                }

                // Create a request for DownloadManager
                DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url));
                request.setMimeType(mimetype);
                request.setTitle(fileName);
                request.allowScanningByMediaScanner();
                request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);

                // Set the destination directory for the downloaded file
                request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, fileName);

                // Enqueue the download request
                DownloadManager dm = (DownloadManager) getSystemService(DOWNLOAD_SERVICE);
                dm.enqueue(request);
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