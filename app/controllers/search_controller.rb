# -*- encoding : utf-8 -*-
class SearchController < ApplicationController

  def index
    if params[:search].blank?
      redirect_to root_path, notice: "Not found"
    else
      word = "%" + params[:search] + "%"
      text_conditions = "SELECT * FROM posts WHERE (title like ? or post like ?)"
      conditions = [text_conditions, word, word]
      @results = Post.find_by_sql(conditions)
      unless @results.size > 0
        redirect_to root_path, notice: "Not found"
      end
    end
  end
  
end
