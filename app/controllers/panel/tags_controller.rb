module Panel
  class TagsController < ApplicationController
    before_filter :authorize, :except => [:index]
    
    def index
      @tag = Tag.new
      @tags = Tag.where("name like ?", "%#{params[:q]}%")
      respond_to do |format|
        format.html { authorize }
        format.json { render :json => @tags.map(&:attributes) }
      end
    end
    
    def create
      unless Tag.find_by_name(params[:tag][:name])
        @tag = Tag.new(params[:tag])
        @tag.save
      end
      
      respond_to do |format|
        format.html { redirect_to panel_tags_path(@tag) }
        format.js
      end
    end
    
    def destroy
      @tag = Tag.find(params[:id])
      @tag.destroy
      respond_to do |format|
        format.html { redirect_to panel_tags_path(@tag)}
        format.js
      end
    end
  end
end
