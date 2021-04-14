class Plan
  FREE = OpenStruct.new({
    id: "FREE",
    name: "Free",
    price: 0,
    currency: "EUR",
    interval: 'year',
    max_lists: 3,
    max_items: 15
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

  def self.all
    [FREE, STANDARD, MECENAS]
  end

  # TODO: create a dynamic finder
  def self.find(id)
    case id
    when 'FREE'
      Plan::FREE
    when 'STANDARD'
      Plan::STANDARD
    when 'MECENAS'
      Plan::MECENAS
    else
      raise 'Invalid Plan'
    end
  end
end
