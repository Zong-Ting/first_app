FactoryGirl.define do
  factory :user do
    sequence :name do |n|
	  "user_#{n}"
	end
	
	sequence :email do |n|
	  "user_#{n}@example.com"
	end
	
	password "password"
	password_confirmation "password"
	
	end
	
  factory :post do
    user
	content Faker::Lorem.sentence
  end
  
  factory :following do
    association :from, factory: :user
	association :to, factory: :user
  end
end