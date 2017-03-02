FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password }
    sequence(:email) { |e| "#{e}_#{Faker::Internet.safe_email}" }
  end
end
