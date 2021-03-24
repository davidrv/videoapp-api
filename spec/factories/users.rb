FactoryBot.define do
  factory :user do
    sequence(:email)       { |n| "user-#{n}@davidrv.coim" }
    password               { "password" }
    password_confirmation  { "password" }
  end
end
