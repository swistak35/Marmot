module Blog
  class PostsController < ApplicationController
    before_filter :authorize, :except => [:show, :index, :rss]
    
    def index
      if params[:tag].nil?
        @posts = Post.recent.visible.accessible.page params[:page]
      else
        @tag = Tag.find_by_name(params[:tag])
        @posts = @tag.posts.recent.visible.accessible.page params[:page]
      end
      
      respond_to do |format|
        format.html
        format.js
      end
    end

    def rss
      if params[:tag].nil?
        @posts = Post.recent.visible.accessible.limit(10)
      else
        @tag = Tag.find_by_name(params[:tag])
        @posts = @tag.posts.recent.visible.accessible.limit(10)
      end
      render :layout => false
      response.headers["Content-Type"] = "application/xml; charset=utf-8"
    end

    def show
      @post = Post.find(params[:id])
      if !current_admin && !@post.accessible?
        redirect_to root_path
      end
    end

    def new
      @post = Post.new
      @tag = Tag.new
    end

    def edit
      @post = Post.find(params[:id])
      @tag = Tag.new
    end

    def create
      @post = Post.new(params[:post])

      if @post.save
        redirect_to [:blog, @post]
      else
        render "new"
      end
    end

    def update
      @post = Post.find(params[:id])

      if @post.update_attributes(params[:post])
        redirect_to [:blog, @post]
      else
        render "edit"
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to blog_posts_path
    end
  end
end
