class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :user, presence: true
  validates :name, presence: true

  validate :list_limit_not_reached

  delegate :max_lists, to: :user
  delegate :max_items, to: :user
  delegate :user_items_count, to: :user

  private

  def list_limit_not_reached
    self.errors.add(:base, "Max lists reached for your plan") if user.lists.count >= max_lists
  end
end
