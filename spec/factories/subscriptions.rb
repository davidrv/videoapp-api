FactoryBot.define do
  factory :subscription do
    user
    status  { "ACTIVE" }
    plan_id { "FREE" }
  end
end
