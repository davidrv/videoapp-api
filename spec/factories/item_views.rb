FactoryBot.define do
  factory :item_view do
    item
    time { DateTime.current - rand(1..90).days }
  end
end
