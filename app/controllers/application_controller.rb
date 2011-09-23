# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  
  private

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin
  
  def authorize
    redirect_to new_panel_session_path, :notice => "Brak dostepu." unless current_admin
  end
end
