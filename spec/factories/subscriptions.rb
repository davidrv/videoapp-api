FactoryBot.define do
  factory :subscription do
    user
    plan_id { "FREE" }
  end
end
