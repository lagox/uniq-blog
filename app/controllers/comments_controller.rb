# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  
  before_filter :load_post, :except => [:moder_comment, :destroy, :approve_comment]
    
  def create
    @comment = @post.comments.new(params[:comment])
    if params[:result] == params[:hidden_result]
      if @comment.save
        redirect_to @post, notice: "Комментарий успешно добавлен, ожидайте модерации"
      else
        redirect_to @post, notice: "Комментарий не добавлен"
      end  
    else
      redirect_to @post, notice: "Каптча не верна"  
    end
    
  end
  
  def destroy
    @comment = Comment.unpublished.find(params[:id])
    @comment.destroy
    redirect_to moder_comment_path, notice: "Комментарий удален"
  end
  
  def approve_comment
    @comment = Comment.unpublished.find(params[:id])
    if @comment.update_attribute(:published, true)
      redirect_to moder_comment_path, notice: "Комментарий одобрен"
    else
      redirect_to moder_comment_path, notice: "что-то пошло не так"
    end
  end
  
  def moder_comment
    @comments = Comment.unpublished
  end
  
private
  
  def load_post
    @post = Post.find(params[:post_id])
  end
end
