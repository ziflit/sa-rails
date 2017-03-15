FactoryGirl.define do
  factory :book_suggestion do
    user
    title     { Faker::Book.title }
    author    { Faker::Book.author }
    publisher { Faker::Book.publisher }
    editorial { Faker::Commerce.department(3) }
    year      { Faker::Number.number(4) }
    price     { Faker::Number.decimal(3, 2) }
    link      { Faker::Internet.url }
  end
end
