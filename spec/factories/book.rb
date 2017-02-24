FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    genre { Faker::Book.genre }
    year { Faker::Number.number(4) }
    publisher { Faker::Book.publisher }
    image { Faker::File.file_name('/path/to/image', 'png') }
  end
end
