package com.example.edbook;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity2 extends AppCompatActivity {

    Button b1,b2;
    EditText e1,e2,e3,ans;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        b1=findViewById(R.id.b1);
        b2=findViewById(R.id.b2);
        e1=findViewById(R.id.e1);
        e2=findViewById(R.id.e2);
        e3=findViewById(R.id.e3);
        ans=findViewById(R.id.answer);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int a=Integer.parseInt(String.valueOf(e1.getText()));
                int b=Integer.parseInt(String.valueOf(e2.getText()));
                int c=Integer.parseInt(String.valueOf(e3.getText()));
                if (a<b & a<c){
                    ans.setText(String.valueOf(a));
                } else if (b<a & b<c) {
                    ans.setText(String.valueOf(b));
                }else {
                    ans.setText(String.valueOf(c));
                }
            }
        });

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int a=Integer.parseInt(String.valueOf(e1.getText()));
                int b=Integer.parseInt(String.valueOf(e2.getText()));
                int c=Integer.parseInt(String.valueOf(e3.getText()));
                if (a<b && a<c){
                    ans.setText(String.valueOf(a));
                } else if (b<a && b<c) {
                    ans.setText(String.valueOf(b));
                }else {
                    ans.setText(String.valueOf(c));
                }
            }
        });
    }
}