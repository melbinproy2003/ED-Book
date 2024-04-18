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
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;


public class HomeAdapter extends RecyclerView.Adapter<HomeAdapter.MyViewHolder> {

    String UserName[], UserPhoto[], Post[],PostDate[],PostContent[],PostFile[],LikeStatus[],Likecount[];

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


    public HomeAdapter(Context ct,String[] userName, String[] userPhoto, String[] postDate, String[] postContent,String[] postFile,String[] likeStatus,String[] likecount) {
        context = ct;
        UserName = userName;
        UserPhoto = userPhoto;
        PostDate = postDate;
        PostContent = postContent;
        PostFile = postFile;
        LikeStatus = likeStatus;
        Likecount = likecount;
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



        String photoBase64 = UserPhoto[position];
        String base64Data = photoBase64.substring(photoBase64.indexOf(',') + 1);
        try {
            byte[] decodedBytes = Base64.decode(base64Data, Base64.DEFAULT);
            if (decodedBytes != null && decodedBytes.length > 0) {
                Bitmap decodedBitmap = BitmapFactory.decodeByteArray(decodedBytes, 0, decodedBytes.length);
                if (decodedBitmap != null) {
                    holder.profile.setImageBitmap(decodedBitmap);
                } else {
                    Log.e("Bitmap Decoding", "Decoded bitmap is null");
                }
            } else {
                Log.e("Decoded Bytes", "Decoded byte array is null or empty");
            }
        } catch (IllegalArgumentException e) {
            Log.e("Base64 Decoding", "Invalid Base64 string", e);
        }


        String photo1Base64 = PostFile[position];
        if (photo1Base64 != null) {
            String base64Data1 = photo1Base64.substring(photo1Base64.indexOf(',') + 1);
            try {
                byte[] decodedBytes = Base64.decode(base64Data1, Base64.DEFAULT);
                if (decodedBytes != null && decodedBytes.length > 0) {
                    Bitmap decodedBitmap = BitmapFactory.decodeByteArray(decodedBytes, 0, decodedBytes.length);
                    if (decodedBitmap != null) {
                        holder.post.setImageBitmap(decodedBitmap);
                        holder.post.setVisibility(View.VISIBLE); // Show the ImageView
                    } else {
                        holder.post.setVisibility(View.GONE); // Hide the ImageView
                        Log.e("Bitmap Decoding", "Decoded bitmap is null");
                    }
                } else {
                    holder.post.setVisibility(View.GONE); // Hide the ImageView
                    Log.e("Decoded Bytes", "Decoded byte array is null or empty");
                }
            } catch (IllegalArgumentException e) {
                holder.post.setVisibility(View.GONE); // Hide the ImageView
                Log.e("Base64 Decoding", "Invalid Base64 string", e);
            }
        } else {
            holder.post.setVisibility(View.GONE); // Hide the ImageView if PostFile is null
        }

        String postContent = PostContent[position];
        if (postContent != null) {
            holder.contentText.setText(postContent);
            holder.contentText.setVisibility(View.VISIBLE); // Show the TextView
        } else {
            holder.contentText.setVisibility(View.GONE); // Hide the TextView if PostContent is null
        }

        holder.nameText.setText(UserName[position]);
//        holder.nooflike.setText(Likecount[position]);
        // Inside onBindViewHolder method
        int currentLikeCount = Integer.parseInt(Likecount[position]);
        if ("liked".equals(LikeStatus[position])) {
            holder.likeButton.setImageResource(R.drawable.baseline_red_heart_24);
        } else {
            holder.likeButton.setImageResource(R.drawable.baseline_heart_24);
        }


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
        return UserName.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        TextView nameText,contentText,nooflike;
        ImageView post,profile;

        ImageButton likeButton, commentButton;
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.name);
            contentText = itemView.findViewById(R.id.content);
            post = itemView.findViewById(R.id.post);
            profile = itemView.findViewById(R.id.profile);
            likeButton = itemView.findViewById(R.id.like);
            commentButton = itemView.findViewById(R.id.commentid);
            nooflike = itemView.findViewById(R.id.likec);

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
