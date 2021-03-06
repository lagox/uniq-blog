# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :post do
    title "My title"
    post  "My post"
    user_id 2
    category_id 4
  end
  
  factory :category do
    title "My category"
    description "My category description"
    parent_id 1
  end
  
  factory :user do
    email "foo@bar.com"
    password "secretpassword"
    admin true
    name "Sam"
  end
  
  factory :comment do
    user_id 4
    author "Sam"
    comment "My comment"
  end
end
