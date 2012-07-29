# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  attr_accessible :user_id, :author, :comment
  
  belongs_to :post
  belongs_to :user
end
