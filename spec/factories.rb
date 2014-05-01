FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    email { Faker::Internet.email }
    tagline { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end