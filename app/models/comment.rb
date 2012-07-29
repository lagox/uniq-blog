# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  attr_accessible :user_id, :author, :comment
  
  belongs_to :post
  belongs_to :user
  
  # validates:
  validates :comment, :presence => true
  validates :author, :presence => true, :if => :user_id_nil?
  
  def user_id_nil?
    user_id.nil?
  end
  
end
