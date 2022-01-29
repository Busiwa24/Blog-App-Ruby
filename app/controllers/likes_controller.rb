class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @new_like = @post.likes.create(user_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        if @new_like.save
          redirect_to user_post_path(@post.user_id, @post.id), notice: 'Liked 👍'
        else
          redirect_to user_post_path(@post.user_id, @post.id), alert: 'Unable to like'
        end
      end
    end
  end
end
