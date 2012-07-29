# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Posts" do
  
  subject { page }
  
  describe "home page" do
    before { visit root_path }
    
    it { should have_selector("title", text: "Главная") }
  end  

end
