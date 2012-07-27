# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base

  # include ActsAsTree

  attr_accessible :title, :description, :parent_id
  
  # validates
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
  validates :parent_id, numericality: true, allow_blank: true
    
  # associations
  has_many :posts, dependent: :destroy
  
  acts_as_tree order: "title"  
  
  default_scope order("title ASC")
  scope :childrens, where("parent_id IS NOT NULL")
  scope :mains, where("parent_id IS NULL")

  
end
