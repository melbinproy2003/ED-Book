package com.example.edbook;

import static com.example.edbook.WebServiceCaller.ip;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;


public class HomeAdapter extends RecyclerView.Adapter<HomeAdapter.MyViewHolder> {

    String Name[], Content[], Post[],Profile[];
    String  url = "http://"+ip+":8084/ED-Book/Assets/Files/Post/";
    Context context;
    OnItemClickListener itemClickListener;

    public HomeAdapter(Context ct, String[] name, String[] content, String[] post, String[] profile) {
        context = ct;
        Name = name;
        Content = content;
        Post = post;
        Profile = profile;
    }

    // Setter method for click listener
    public void setOnItemClickListener(OnItemClickListener listener) {
        itemClickListener = listener;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.home_design, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        Picasso.get().load(url+Profile[position]).into(holder.profile);
        Picasso.get().load(url+Post[position]).into(holder.post);
        holder.nameText.setText(Name[position]);
        holder.contentText.setText(Content[position]);
    }

    @Override
    public int getItemCount() {
        return Name.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        
        TextView nameText,contentText;
        ImageView post,profile;

        ImageButton commentId;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.name);
            contentText = itemView.findViewById(R.id.content);
            post = itemView.findViewById(R.id.post);
            profile = itemView.findViewById(R.id.profile);
            commentId = itemView.findViewById(R.id.commentid);

            commentId.setOnClickListener(this);

            // Set click listener for itemView (excluding commentId)
            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // Ignore clicks on the whole itemView if it's not commentId
                    if (itemClickListener != null && v != commentId) {
                        int position = getAdapterPosition();
                        Log.d("hid", String.valueOf(position));
                        if (position != RecyclerView.NO_POSITION) {
                            itemClickListener.onItemClick(position);
                        }
                    }
                }
            });
        }

        @Override
        public void onClick(View v) {
            if (v == commentId && itemClickListener != null) {
                int position = getAdapterPosition();
                Log.d("hid", String.valueOf(position));
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
