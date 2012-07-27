require 'spec_helper'

describe PagesController do
  
  it "get 'about'" do
    get :about
    response.should be_success
  end
  
  it "get 'contact'" do
    get :contact
    response.should be_success
  end

end
