# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "UserPages" do
  
  describe "sign up page" do
    it "should have right title" do
      visit signup_path
      page.should have_selector("title", text: "Регистрация")    
    end
    
    it "should have the form" do
      visit signup_path
      page.should have_selector("form")
    end
    
    it "should sign up" do
      visit signup_path
      fill_in "Почта", :with => "foo@bar.com"
      fill_in "Пароль", :with => "secretpassword"
      fill_in "Потвердите пароль", :with => "secretpassword"
      click_button "Зарегистрироваться"
      page.should have_selector("div", text: "Success sign up")
    end
  end
  
  describe "log in page" do
    it "should have the right title" do
      visit login_path
      page.should have_selector("title", text: "Войти")
    end
    
    it "should have the form" do
      visit login_path
      page.should have_selector("form")
    end
    
  end
  
end
