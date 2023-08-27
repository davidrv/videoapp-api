FactoryBot.define do
  factory :list_version do
    list
    name { Faker::Space.nasa_space_craft }
  end
end
