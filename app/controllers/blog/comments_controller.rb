module Blog
  class CommentsController < ApplicationController
    before_filter :authorize, :except => [:create]
    
    def index
      @comments = Comment.page params[:page]
    end
    
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(params[:comment])
      redirect_to blog_post_path(@post)
    end
    
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to blog_post_path(@comment.post) }
        format.js
      end
    end
  end
end
