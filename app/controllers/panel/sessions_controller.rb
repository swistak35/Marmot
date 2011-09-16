module Panel
  class SessionsController < ApplicationController
    #before_filter :authorize, :only => :destroy
    
    def create
      admin = Admin.find_by_username(params[:username])
      if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to root_path
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  end
end
