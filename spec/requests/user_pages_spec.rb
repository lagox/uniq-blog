# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "UserPages" do
  
  describe "sign up page" do
    it "should have right title" do
      visit signup_path
      page.should have_selector("title", text: "Sign Up")    
    end
    
    it "should have the form" do
      visit signup_path
      page.should have_selector("form")
    end
    
    it "should sign up" do
      visit signup_path
      fill_in "Email:", :with => "foo@bar.com"
      fill_in "Password", :with => "secretpassword"
      fill_in "Password confirmation", :with => "secretpassword"
      click_button "Sign Up"
      page.should have_selector("div", text: "Success sign up")
    end
  end
  
  describe "log in page" do
    it "should have the right title" do
      visit login_path
      page.should have_selector("title", text: "Log in")
    end
    
    it "should have the form" do
      visit login_path
      page.should have_selector("form")
    end
    
  end
  
end
