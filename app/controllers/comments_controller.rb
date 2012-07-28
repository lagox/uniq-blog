# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  
  before_filter :load_post
  
  def create
    @comment = @post.comments.new(params[:comment])
    if @comment.save
      redirect_to @post, notice: "Комментарий успешно добавлен"
    else
      redirect_to @post, notice: "Комментарий не добавлен"
    end
  end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post, notice: "Комментарий удален"
  end
  
private
  
  def load_post
    @post = Post.find(params[:post_id])
  end
end
