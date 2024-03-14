package com.example.edbook;

import static com.example.edbook.WebServiceCaller.ip;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.DialogFragment;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ChangePassword extends AppCompatActivity {

    Button b1;
    EditText cp, np, cop;
    String newpassword, currentpassword, confirmpassword, oldpassword="", id;



    public class getPassword extends AsyncTask<String, String, String> {
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GetPassword");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                JSONObject jo = j.getJSONObject(0);
                oldpassword = jo.getString("password");
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    public class setPassword extends AsyncTask<String, String, String> {
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("SetPassword");
            wb.addProperty("id", strings[0]);
            wb.addProperty("newpassword", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                JSONObject jo = j.getJSONObject(0);
                String message = jo.getString("message");
                Toast.makeText(ChangePassword.this, message, Toast.LENGTH_SHORT).show();
                cp.setText("");
                np.setText("");
                cop.setText("");
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_password);

        b1 = findViewById(R.id.changepassword);
        cp = findViewById(R.id.currentpassword);
        np = findViewById(R.id.newpassword);
        cop = findViewById(R.id.confirmpassword);

        SharedPreferences sh = getSharedPreferences("user", MODE_PRIVATE);
        id = sh.getString("id", "");


        getPassword gp = new getPassword();
        gp.execute(id);


        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                currentpassword = cp.getText().toString();
                newpassword = np.getText().toString();
                confirmpassword = cop.getText().toString();


//                Toast.makeText(ChangePassword.this, oldpassword, Toast.LENGTH_SHORT).show();

                if (oldpassword.equals(currentpassword)){
                    if (newpassword.equals(currentpassword)) {
                        // Show alert dialog here
                        showAlertDialog("This password already taken.");
                        return; // Exit the click listener to prevent further execution
                    }
                    else{
                        if (!newpassword.equals(confirmpassword)) {
                            // Show alert dialog here
                            showAlertDialog("New password and confirm password do not match.");
                            return; // Exit the click listener to prevent further execution
                        }
                        else{
                            //change password
                            setPassword setp = new setPassword();
                            setp.execute(id,newpassword);
                        }
                    }
                }
                else {
                    // Show alert dialog here
                    showAlertDialog("This password is not matching.");
                    return; // Exit the click listener to prevent further execution
                }

            }
        });
    }

    private void showAlertDialog(String message) {
        // Create and show an alert dialog
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage(message);
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                // No action needed here, dialog dismisses automatically
            }
        });
        builder.create().show();
    }


}
