class Plan
  FREE = OpenStruct.new({
    id: "FREE",
    name: "Free",
    price: 0,
    currency: "EUR",
    interval: 'year',
    max_lists: 1,
    max_items: 10
  })

  STANDARD = OpenStruct.new({
    id: "STANDARD",
    name: "Standard",
    price: 395,
    currency: "EUR",
    interval: 'year',
    max_lists: 10,
    max_items: 1_000
  })

  MECENAS = OpenStruct.new({
    id: "MECENAS",
    name: "Mecenas",
    price: 3995,
    currency: "EUR",
    interval: 'year',
    max_lists: 9_999,
    max_items: 999_999
  })

  def self.active
    %w(FREE STANDARD MECENAS)
  end
end
