package com.example.edbook;


import static com.example.edbook.WebServiceCaller.ip;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;



public class ChatAdapter extends RecyclerView.Adapter<ChatAdapter.MyViewHolder> {

    String pic[], nme[], dte[], matr[], teid[];
    String url = "http://"+ip+":8084/ED-Book/Assets/Files/Teacher/";
    Context context;
    OnItemClickListener itemClickListener;

    //    public Adapter(Context ct, String photo[], String name[], String date[], String materials[]) {
    public ChatAdapter(Context ct,String tid[], String name[], String photo[]) {
        context = ct;
        pic = photo;
        nme = name;
        teid = tid;
//        dte = date;
//        matr = materials;
    }

    // Setter method for click listener
    public void setOnItemClickListener(OnItemClickListener listener) {
        itemClickListener = listener;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.chat_design, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
//        Picasso.get().load(url+pic[position]).into(holder.propic);
        String photoBase64 = pic[position];
        String base64Data = photoBase64.substring(photoBase64.indexOf(',') + 1);
        try {
            byte[] decodedBytes = Base64.decode(base64Data, Base64.DEFAULT);
            if (decodedBytes != null && decodedBytes.length > 0) {
                Bitmap decodedBitmap = BitmapFactory.decodeByteArray(decodedBytes, 0, decodedBytes.length);
                if (decodedBitmap != null) {
                    holder.propic.setImageBitmap(decodedBitmap);
                } else {
                    Log.e("Bitmap Decoding", "Decoded bitmap is null");
                }
            } else {
                Log.e("Decoded Bytes", "Decoded byte array is null or empty");
            }
        } catch (IllegalArgumentException e) {
            Log.e("Base64 Decoding", "Invalid Base64 string", e);
        }
        holder.name.setText(nme[position]);
//        holder.date.setText(dte[position]);
//        holder.material.setText(matr[position]);
    }

    @Override
    public int getItemCount() {
        return teid.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

                ImageView propic;
//        TextView name, date, material;
        TextView name;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            propic = itemView.findViewById(R.id.teacherpic);
            name = itemView.findViewById(R.id.chatnname);
//            date = itemView.findViewById(R.id.textview2);
//            material = itemView.findViewById(R.id.textview3);

            // Set click listener for itemView
            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            if (itemClickListener != null) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION) {
                    itemClickListener.onItemClick(position);
                }
            }
        }
    }

    // Interface for item click events
    public interface OnItemClickListener {
        void onItemClick(int position);
    }
}