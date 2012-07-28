# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: posts
#
#  category_id :integer
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  post        :text
#  title       :string(255)
#  updated_at  :datetime         not null
#  user_id     :integer
#

# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  attr_accessible :title, :post, :user_id, :category_id, :tag_list
  
  # validates
  validates :title, presence: true
  validates :post, presence: true
  validates :user_id, presence: true, numericality: true
  validates :category_id, presence: true, numericality: true
  
  belongs_to :category
  
  # tags
  acts_as_taggable
end
