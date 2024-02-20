package com.example.edbook;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;


public class HomeAdapter extends RecyclerView.Adapter<HomeAdapter.MyViewHolder> {

    String Name[], Content[], Post[];
    Context context;
    OnItemClickListener itemClickListener;

    public HomeAdapter(Context ct, String name[], String content[], String post[]) {
        context = ct;
        Name = name;
        Content = content;
        Post = post;
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
        Picasso.get().load(Post[position]).into(holder.post);
        holder.nameText.setText(Name[position]);
        holder.contentText.setText(Content[position]);
    }

    @Override
    public int getItemCount() {
        return Name.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        //        ImageView propic;
        TextView nameText,contentText;
        ImageView post;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.name);
            contentText = itemView.findViewById(R.id.contact);
            post = itemView.findViewById(R.id.post);

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
