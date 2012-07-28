# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  
  respond_to :html
  
  def new
    @user = User.new
    respond_with(@user)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Success sign up"
    else
      render 'new'
    end
  end
end
