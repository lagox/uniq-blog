# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_categories
  
  def load_categories
    @sidebar_categories = Category.mains
  end
  
private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
  
  def authorize
    redirect_to login_url, notice: "Not authorized" if current_user.nil?
  end
  
end
