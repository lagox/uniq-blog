# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation, :admin
  
  validates :email, uniqueness: true

  after_validation :set_admin
  
private
  
  def set_admin
    if User.count == 0
      self.admin = true
    else
      self.admin = false
    end
  end  
    
end
