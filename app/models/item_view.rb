# We may also want to add other tracking info here
# like IP or similar for let's keep it simple for now
class ItemView < ApplicationRecord
  belongs_to :item

  validates :item, presence: true
end
