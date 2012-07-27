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
require 'spec_helper'

describe Post do
  
  before(:each) do
    @post = FactoryGirl.create(:post)
    @category = FactoryGirl.create(:category)
    
    # valid attributes
    
    @attr = {
      title: "My title",
      post: "My Post",
      user_id: 1,
      category_id: @category.id
    }
  end
  
  describe "validations" do
    
    it "should create an instance with valid attributes" do
      post = Post.create!(@attr)  
    end
    
    it "should require title" do
      post = Post.new(@attr.merge(:title => nil))
      post.should_not be_valid
    end
    
    it "should require post" do
      post = Post.new(@attr.merge(:post => nil))
      post.should_not be_valid
    end
    
    it "should require user_id" do
      post = Post.new(@attr.merge(:user_id => nil))
      post.should_not be_valid
    end
    
    it "should require category_id" do
      post = Post.new(@attr.merge(:category_id => nil))
      post.should_not be_valid
    end
    
    it "should user_id the numericality" do
      @attr[:user_id] = "s"
      post = Post.new(@attr)
      post.should_not be_valid
    end
    
    it "should category_id the numericality" do
      @attr[:category_id] = "s"
      post = Post.new(@attr)
      post.should_not be_valid
    end
    
  end
  
  describe "associations" do
    describe "category" do
      it "should respond to categories" do
        post = Post.new(@attr)
        post.should respond_to(:category)
      end
      
      it "should belongs_to :category" do
        post = Post.reflect_on_association(:category)
        post.macro.should == :belongs_to
      end
    end
    
  end
  
end
