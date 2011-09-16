module Calendar
  class EventsController < ApplicationController
    before_filter :authorize
    
    def index
      @events = Event.all
      @date = params[:month] ? Date.parse(params[:month]) : Date.today
    end
    
    def show
      @event = Event.find(params[:id])
      render :layout => 'overlay'
    end
    
    def new
      @event = Event.new
      render :layout => 'overlay'
    end
    
    def create
      @event = Event.create(params[:event])
      respond_to do |format|
        format.html { redirect_to calendar_events_path }
        format.js
      end
    end
    
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      respond_to do |format|
        format.html { redirect_to calendar_events_path }
        format.js
      end
    end
  end
end
