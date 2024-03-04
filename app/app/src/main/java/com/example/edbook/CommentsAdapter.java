package com.example.edbook;

import static com.example.edbook.WebServiceCaller.ip;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;


public class CommentsAdapter extends RecyclerView.Adapter<CommentsAdapter.MyViewHolder> {

    String Name[], Comment[], Date[],Profile[];
    String  url = "http://"+ip+":8084/ED-Book/Assets/Files/Post/";
    Context context;
    OnItemClickListener itemClickListener;

    public CommentsAdapter(Context ct, String[] name, String[] comment, String[] date) {
        context = ct;
        Name = name;
        Comment = comment;
        Date = date;
//        Profile = profile;
    }

    // Setter method for click listener
    public void setOnItemClickListener(OnItemClickListener listener) {
        itemClickListener = listener;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.comments_design, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
//        Picasso.get().load(url+Profile[position]).into(holder.profile);
//        Picasso.get().load(url+Post[position]).into(holder.post);
        holder.nameText.setText(Name[position]);
        holder.commentText.setText(Comment[position])
        holder.date.setText(Date[position]);
    }

    @Override
    public int getItemCount() {
        return Name.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        TextView nameText,commentText,date;
//        ImageView post,profile;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.commentName);
            commentText = itemView.findViewById(R.id.comment);
            date = itemView.findViewById(R.id.commentdate);
//            profile = itemView.findViewById(R.id.profile);

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
