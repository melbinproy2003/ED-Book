package com.example.edbook;

import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    Button add,minus,div,mul,next;
    EditText no1,no2,result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        add = findViewById(R.id.add);
        minus = findViewById(R.id.minus);
        mul = findViewById(R.id.mul);
        div = findViewById(R.id.div);
        no1 = findViewById(R.id.no1);
        no2 = findViewById(R.id.no2);
        result = findViewById(R.id.result);
        next = findViewById(R.id.next);

       add.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               int a = Integer.parseInt(String.valueOf(no1.getText()));
               int b = Integer.parseInt(String.valueOf(no2.getText()));
               int c = a+b;
               result.setText(String.valueOf(c));
           }
       });

       minus.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               int a = Integer.parseInt(String.valueOf(no1.getText()));
               int b = Integer.parseInt(String.valueOf(no2.getText()));
               int c = a-b;
               result.setText(String.valueOf(c));
           }
       });

       mul.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               int a = Integer.parseInt(String.valueOf(no1.getText()));
               int b = Integer.parseInt(String.valueOf(no2.getText()));
               int c = a*b;
               result.setText(String.valueOf(c));
           }
       });

       div.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               int a = Integer.parseInt(String.valueOf(no1.getText()));
               int b = Integer.parseInt(String.valueOf(no2.getText()));
               int c = a/b;
               result.setText(String.valueOf(c));
           }
       });

       next.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               Intent i=new Intent(MainActivity.this,MainActivity2.class);
               startActivity(i);
           }
       });

    }
}