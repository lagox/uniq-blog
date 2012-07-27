# -*- encoding : utf-8 -*-
class PostsController < ApplicationController
  
  respond_to :html
  
  def index
    @posts = Post.all
    respond_with(@posts)
  end
  
  def show
    @post = Post.find(params[:id])
    respond_with(@post)
  end
  
  def new
    @post = Post.new
    respond_with(@post)
  end
  
  def edit
    @post = Post.find(params[:id])
    respond_with(@post)
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Post success create"
      respond_with(@post)
    else
      render 'new'
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post success update"
      respond_with(@post)
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post success deleted"
    redirect_to posts_path
  end
  
end
