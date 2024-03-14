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

    String Name[], Content[], Post[],Profile[],Profileurl[];
    String  url = "http://"+ip+":8084/ED-Book/Assets/Files/Post/";
    String purl = "http://"+ip;
    Context context;
    private OnItemClickListener likeClickListener;
    private OnItemClickListener commentClickListener;

    // Setters for the listeners
    public void setLikeClickListener(OnItemClickListener listener) {
        likeClickListener = listener;
    }

    public void setCommentClickListener(OnItemClickListener listener) {
        commentClickListener = listener;
    }


    public HomeAdapter(Context ct, String[] name, String[] content, String[] post, String[] profile, String[] profileurl) {
        context = ct;
        Name = name;
        Content = content;
        Post = post;
        Profile = profile;
        Profileurl = profileurl;
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
        Picasso.get().load(purl+Profileurl[position]+Profile[position]).into(holder.profile);
        Picasso.get().load(url+Post[position]).into(holder.post);
        holder.nameText.setText(Name[position]);
        holder.contentText.setText(Content[position]);
        holder.likeButton.setOnClickListener(v -> {
            if (likeClickListener != null) {
                likeClickListener.onLikeClick(position);
            }
        });

        holder.commentButton.setOnClickListener(v -> {
            if (commentClickListener != null) {
                commentClickListener.onCommentClick(position);
            }
        });
    }

    @Override
    public int getItemCount() {
        return Name.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        
        TextView nameText,contentText;
        ImageView post,profile;

        ImageButton likeButton, commentButton;
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.name);
            contentText = itemView.findViewById(R.id.content);
            post = itemView.findViewById(R.id.post);
            profile = itemView.findViewById(R.id.profile);
            likeButton = itemView.findViewById(R.id.likeid);
            commentButton = itemView.findViewById(R.id.commentid);

            likeButton.setOnClickListener(this);
            commentButton.setOnClickListener(this);

            // Set click listener for itemView (excluding commentId)
            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    // Ignore clicks on the whole itemView if it's not like or comment button
                    if (likeClickListener != null && v != likeButton && v != commentButton) {
                        int position = getAdapterPosition();
                        if (position != RecyclerView.NO_POSITION) {
                            likeClickListener.onItemClick(position);
                        }
                    }
                }
            });
        }

        public void onClick(View v) {
            if (v == likeButton) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION && likeClickListener != null) {
                    likeClickListener.onLikeClick(position);
                }
            } else if (v == commentButton) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION && commentClickListener != null) {
                    commentClickListener.onCommentClick(position);
                }
            }
        }
    }

    // Interface for item click events
    public interface OnItemClickListener {
        void onItemClick(int position);
        void onLikeClick(int position);
        void onCommentClick(int position);
    }

}
