# -*- encoding : utf-8 -*-
class CategoriesController < ApplicationController
  
  respond_to :html

  def index
    @categories = Category.all
    respond_with(@categories)
  end
  
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.sorted(params[:sort], "created_at DESC").page(params[:page]).per(4)
    respond_with(@category)
  end
  
  def new
    @category = Category.new
    respond_with(@category)
  end
  
  def edit
    @category = Category.find(params[:id])
    respond_with(@category)
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Category success create"
      respond_with(@category, :location => categories_path)
    else
      render 'new'
    end
  end
  
  def update
    @category = Category.find(params[:id])  
    if @category.update_attributes(params[:category])
      flash[:notice] = "Catregory success update"
      respond_with(@category, :location => categories_path)
    else
      render 'edit'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category success destroy"
    redirect_to categories_path 
  end
  
end
