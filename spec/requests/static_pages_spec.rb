require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  
  describe "about page" do
    before { visit about_path }
    
    it { should have_selector("title", text: "About Us") }
  end
  
  describe "contact page" do
    before { visit contact_path }
    
    it { should have_selector("title", text: "Contact") }
  end
    
end
