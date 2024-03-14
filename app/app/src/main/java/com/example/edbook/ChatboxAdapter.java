package com.example.edbook;

import static com.example.edbook.WebServiceCaller.ip;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;


public class ChatboxAdapter extends RecyclerView.Adapter<ChatboxAdapter.MyViewHolder> {

    String Name[], Messages[], Date[],Profile[];
    String  url = "http://"+ip+":8084/ED-Book/Assets/Files/Post/";
    Context context;
    OnItemClickListener itemClickListener;

    public ChatboxAdapter(Context ct, String[] name, String[] chat, String[] date) {
        context = ct;
        Name = name;
        Messages = chat;
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
        View view = inflater.inflate(R.layout.chatbox_design, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
//        Picasso.get().load(url+Profile[position]).into(holder.profile);
//        Picasso.get().load(url+Post[position]).into(holder.post);
        holder.nameText.setText(Name[position]);
        holder.messageText.setText(Messages[position]);
        holder.date.setText(Date[position]);
    }

    @Override
    public int getItemCount() {
        return Messages.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        TextView nameText,messageText,date;
//        ImageView post,profile;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.replayer);
            messageText = itemView.findViewById(R.id.replaymessage);
            date = itemView.findViewById(R.id.messagedate);
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
