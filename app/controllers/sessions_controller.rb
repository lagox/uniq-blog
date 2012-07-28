# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Success Logged in!"
    else
      flash.now.notice = "Email or password is invalid"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Success logged out!"
  end
end
