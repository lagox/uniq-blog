require 'spec_helper'

describe "Posts" do
  
  subject { page }
  
  describe "home page" do
    before { visit root_path }
    
    it { should have_selector("title", text: "Home page") }
  end
  

end
