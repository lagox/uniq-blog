# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Category do
  
  before(:each) do
    @Category = FactoryGirl.create(:category)
    
    # valid attributes
    
    @attr = {
      title: "My category one",
      description: "My desc",
      parent_id: 3
    }
  end
  
  describe "validations" do
    it "should create instance" do
      category = Category.create!(@attr)
    end
    
    it "should require title" do
      category = Category.new(@attr.merge(:title => nil))
      category.should_not be_valid
    end
    
    it "should require description" do
      category = Category.new(@attr.merge(:description => nil))
      category.should_not be_valid
    end
    
    it "should reject duplicate name" do
      @category = Category.create!(@attr)
      category = Category.new(@attr)
      category.should_not be_valid
    end
    
    it "should be valid without parent_id" do
      category = Category.new(@attr.merge(:parent_id => nil))
      category.should be_valid
    end
    
    it "should numericality parent_id" do
      category = Category.new(@attr.merge(:parent_id => "s"))
      category.should_not be_valid
    end
  end
  
  describe "associations" do
    it "should respond to posts" do
      category = Category.new(@attr)
      category.should respond_to(:posts)
    end
    
    it "should has_many posts" do
      category = Category.reflect_on_association(:posts)
      category.macro.should == :has_many
    end
    
    it "posts should dependent destroy" do
      category = Category.reflect_on_association(:posts)
      category.options[:dependent].should == :destroy
    end
  end
  
end
