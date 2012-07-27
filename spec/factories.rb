# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :post do
    title "My title"
    post  "My post"
    user_id 2
    category_id 4
  end
end
