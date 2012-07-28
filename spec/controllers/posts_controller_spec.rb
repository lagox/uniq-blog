# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PostsController do
  render_views
  
  before(:each) do
    @category = FactoryGirl.create(:category)
    @post = FactoryGirl.create(:post, :category => @category)
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
  
  it "get 'edit'" do
    get :edit, :id => @post.id
    response.should be_success
  end
  
  it "get 'show'" do
    get :show, :id => @post.id
    response.should be_success
  end
  
  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the new page" do
        post :create, :post => @attr
        response.should render_template('new')
      end
      
      it "should not create a post" do
        lambda do
          post :create, :post => @attr
        end.should_not change(Post, :count)
      end
      
    end
    
    describe "success" do
      
      before(:each) do
        @attr = valid_data
      end
      
      it "should redirect to show page" do
        post :create, :post => @attr
        response.should redirect_to(assigns(:post))
      end
      
      it "should create a post" do
        lambda do
          post :create, :post => @attr
        end.should change(Post, :count).by(1)
      end
      
      it "should have success message" do
        post :create, :post => @attr
        flash[:notice].should =~ /Post success create/i
      end
      
    end
    
    describe "PUT 'update'" do
      
      describe "failure" do
        before(:each) do
          @attr = invalid_data
        end
        
        it "should render the edit page" do
          put :update, :id => @post.id, :post => @attr
          response.should render_template('edit')
        end
        
        it "should not create the post" do
          lambda do
            put :update, :id => @post.id, :post => @attr
          end.should_not change(Post, :count)
        end
      
      end
      
      describe "success" do
        before(:each) do
          @attr = valid_data
        end
        
        it "should redirect to show page" do
          put :update, :id => @post.id, :post => @attr
          response.should redirect_to(assigns(:post))
        end
        
        it "should not create the post" do
          lambda do
            put :update, :id => @post.id, :post => @attr
          end.should_not change(Post, :count)
        end
        
        it "should have success message" do
          put :update, :id => @post.id, :post => @attr
          flash[:notice].should =~ /Post success update/i
        end
      end
      
    end
    
    describe "DELETE 'destroy'" do
      it "should redirect to posts list" do
        delete :destroy, :id => @post.id
        response.should redirect_to(posts_path)
      end  
      
      it "should destroy post object" do
        lambda do
          delete :destroy, :id => @post.id
        end.should change(Post, :count).by(-1)
      end
      
      it "should have success message" do
        delete :destroy, :id => @post.id
        flash[:notice].should =~ /Post success deleted/i
      end
      
    end
    
  end
  
  def invalid_data
    {
      title: "",
      post: "Ssss",
      user_id: "sss",
      category_id: 3
    }
  end
  
  def valid_data
    {
      title: "My Title",
      post: "My Post",
      user_id: 1,
      category_id: 2
    }    
  end
  
end
