module Files
  class ParcelsController < ApplicationController
    def index  
      if params[:tag].nil?
        @parcels = Parcel.all
      else
        @tag = Tag.find_by_name(params[:tag])
        @parcels = @tag.parcels
      end
    end
    
    def type
      @parcels = Parcel.where("parcel_content_type like ?", params[:type]+"%")
    end
    
    def show
      @parcel = Parcel.find(params[:id])
      redirect_to @parcel.parcel.url
    end
    
    def new
      @parcel = Parcel.new
      @tag = Tag.new
      render :layout => 'overlay'
    end
    
    def create
      @parcel = Parcel.create(params[:parcel])
      
      respond_to do |format|
        format.html { redirect_to files_parcels_path }
        format.js
      end
    end
    
    def destroy
      @parcel = Parcel.find(params[:id])
      @parcel.destroy
      respond_to do |format|
        format.html { redirect_to files_parcels_path }
        format.js
      end
    end
  end
end
