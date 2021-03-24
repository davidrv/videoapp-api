class Plan
  FREE = OpenStruct.new({
    id: "FREE",
    name: "Free",
    price: 0,
    currency: "EUR",
    interval: 'year'
  })

  STANDARD = OpenStruct.new({
    id: "STANDARD",
    name: "Standard",
    price: 395,
    currency: "EUR",
    interval: 'year'
  })

  MECENAS = OpenStruct.new({
    id: "MECENAS",
    name: "Mecenas",
    price: 3995,
    currency: "EUR",
    interval: 'year'
  })

  def self.active
    %w(FREE STANDARD MECENAS)
  end
end
