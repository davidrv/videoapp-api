class List < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true

  validate :max_lists

  private

  def max_lists
    limit = user.plan.max_lists
    self.errors.add(:base, "Max lists reached for your plan") if user.lists.count >= limit
  end
end
