FactoryBot.define do
  factory :user do
    name {Faker::BojackHorseman.character}
    email {Faker::Internet.email}
    address {Faker::Address.full_address}
    phone {555555555}
    password {Faker::Space.planet}
  end
end
