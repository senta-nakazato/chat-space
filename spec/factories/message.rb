FactoryGirl.define do
  factory :message do
    text           {Faker::Lorem.sentence}
    user_id        {Faker::Number.number(1)}
    group_id       {Faker::Number.number(2)}
    image          {Faker::Avatar.image}
  end
end

