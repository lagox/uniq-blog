# -*- encoding : utf-8 -*-
class PostsController < ApplicationController
  
  respond_to :html
  
  def index
    @posts = Post.all
    respond_with(@posts)
  end
  
end
