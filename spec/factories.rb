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
    latitude { nil }
    longitude { nil }
    factory :user_with_skill do
      after(:create) do |user|
        user.skills << FactoryGirl.create(:skill)
      end
    end

  end

  factory :skill do
    name { Faker::Lorem.word }
  end

  factory :interest do
    name {Faker::Lorem.word}
  end

end