FactoryBot.define do
  factory :list do
    name { Faker::Space.nasa_space_craft }
    user
  end
end
