# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  attr_accessible :user_id, :author, :comment, :published
  
  belongs_to :post
  belongs_to :user
  
  default_scope where(:published => true)
  scope :unpublished, where(:published => false).reorder("created_at DESC")
  
  # validates:
  validates :comment, :presence => true
  validates :author, :presence => true, :if => :user_id_nil?
  
  after_validation :unpubl
  
  def unpubl
    self.published = false
  end
  
  def user_id_nil?
    user_id.nil?
  end
  
end
