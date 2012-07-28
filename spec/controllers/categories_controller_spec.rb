# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CategoriesController do
  render_views
  
  before(:each) do
    @category = FactoryGirl.create(:category)
    @user = FactoryGirl.create(:user)
    test_log_in(@user)
  end
  

  it "get 'index'" do
    get :index
    response.should be_success
  end
  
  
  it "get 'new'" do
    get :new
    response.should be_success
  end
  
  it "get 'show'" do
    get :show, :id => @category.title
    response.should be_success
  end
  
  it "get 'edit'" do
    get :edit, :id => @category.title
    response.should be_success
  end
  
  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the new page" do
        post :create, :category => @attr
        response.should render_template('new')
      end
      
      it "should not create the category" do
        lambda do
          post :create, :category => @attr
        end.should_not change(Category, :count)
      end
      
    end
    
    describe "success" do
      
      before(:each) do
        @attr = valid_data
      end
      
      it "should redirect_to root_path" do
        post :create, :category => @attr
        response.should redirect_to(categories_path)
      end
      
      it "should create the category" do
        lambda do 
          post :create, :category => @attr
        end.should change(Category, :count).by(1)
      end
      
      it "should have success message" do
        post :create, :category => @attr
        flash[:notice].should =~ /Category success create/i
      end
      
    end
    
  end
  
  describe "PUT 'update'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the edit page" do
        put :update, :id => @category.title, :category => @attr
        response.should render_template('edit')
      end
      
      it "should not create the category" do
        lambda do
          put :update, :id => @category.title, :category => @attr  
        end.should_not change(Category, :count)
      end
      
    end
    
    describe "success" do
      
      before(:each) do
        @attr = valid_data
      end
      
      it "should redirect_to root_path" do
        put :update, :id => @category.title, :category => @attr
        response.should redirect_to(categories_path)
      end
      
      it "should not create the category" do
        lambda do
          put :update, :id => @category.title, :category => @attr  
        end.should_not change(Category, :count)
      end
      
      it "should have success message" do
        put :update, :id => @category.title, :category => @attr
        flash[:notice] =~ /Category success update/i
      end
      
    end
    
  end
  
  
  # describe "DELETE 'destroy'" do
    
  #   it "should redirect_to root_path" do
  #     delete :destroy, :id => @category.id
  #     response.should redirect_to(categories_path)
  #   end
    
  #   it "should destroy the category" do
  #     lambda do
  #       delete :destroy, :id => @category.id  
  #     end.should change(Category, :count).by(-1)
  #   end
    
  #   it "should have success message" do
  #     delete :destroy, :id => @category.id
  #     flash[:notice].should =~ /Category success destroy/i
  #   end
    
  # end
  
  def invalid_data
    {
      :title => "",
      :description => nil,
      :parent_id => "ss"
    }  
  end
  
  def valid_data
    {
      :title => "My one category",
      :description => "My two description",
      :parent_id => 5
    }
  end
  
  
end
