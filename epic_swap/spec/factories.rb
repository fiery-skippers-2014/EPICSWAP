FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    street { Faker::Address.street_address }
    city { Faker::Adress.city }
    state { Faker::Adress.state }
    zip { Faker::Adress.zip }
    email { Faker::Internet.email }
    tagline { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end