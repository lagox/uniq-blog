# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    
    @attr = {
      :email => "nam@nam.ru",
      :password => "secret"
    }
  end
  
  it "should create admin if first user" do
    User.all.each { |u| u.destroy }
    user = User.create(@attr)
    user.admin.should be_true
  end
  
end
