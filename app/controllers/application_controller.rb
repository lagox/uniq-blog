# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_categories
  before_filter :tag_cloud
  before_filter :captcha
    
  def load_categories
    @sidebar_categories = Category.mains
  end
  
  # tag cloud:
  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end
  
  def captcha
    @one = rand(0..9)
    @two = rand(0..9)
    @result_captcha = @one + @two
  end
  
  
private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
  
  def authorize
    redirect_to login_url, notice: "Not authorized" if current_user.nil?
  end
  
  def access_only_admin
    redirect_to root_url, notice: "You are not admin" if current_user.admin == false
  end
  
end
