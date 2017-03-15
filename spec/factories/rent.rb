FactoryGirl.define do
  factory :rent do
    book
    user

    trait :actual do
      from { Faker::Date.between(2.days.ago, Time.zone.today) }
      to { Date.tomorrow }
    end

    trait :expired do
      from { Faker::Date.between(5.days.ago, Date.yesterday) }
      to { Date.yesterday }
    end
  end
end
