# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    user
    status  { 'ACTIVE' }
    plan_id { 'FREE' }
  end
end
