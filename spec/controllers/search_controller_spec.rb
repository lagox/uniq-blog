# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SearchController do
  render_views
  
  it "get 'index'" do
    get :index
    response.should redirect_to(root_path)
  end

end
