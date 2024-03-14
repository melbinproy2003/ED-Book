package com.example.edbook;


import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;


public class ChatAdapter extends RecyclerView.Adapter<ChatAdapter.MyViewHolder> {

    String pic[], nme[], dte[], matr[];
    Context context;
    OnItemClickListener itemClickListener;

    public ChatAdapter(Context ct, String name[]) {
        context = ct;
//        pic = photo;
        nme = name;
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
//        Picasso.get().load(pic[position]).into(holder.propic);
        holder.name.setText(nme[position]);
//        holder.date.setText(dte[position]);
//        holder.material.setText(matr[position]);
    }

    @Override
    public int getItemCount() {
        return pic.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

//        ImageView propic;
        TextView name;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
//            propic = itemView.findViewById(R.id.imageView4);
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