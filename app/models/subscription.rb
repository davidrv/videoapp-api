# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :plan_id, presence: true, inclusion: { in: Plan.all.map(&:id) }
  validates :current_period_start, presence: true
  validates :current_period_end, presence: true
  validates :amount_cents, presence: true
  validates :amount_currency, presence: true

  before_validation :set_default_values, on: :create
  validate :respect_maxes

  monetize :amount_cents

  def plan
    "Plan::#{plan_id}".safe_constantize
  end

  private

  def set_default_values
    self.plan_id = 'FREE' if plan_id.blank?

    self.status               = 'ACTIVE'
    self.current_period_start = DateTime.now
    self.current_period_end   = DateTime.now + 1.year

    return unless plan

    self.amount = Money.new(plan.price, plan.currency)
  end

  def respect_maxes
    errors.add(:base, 'Max lists reached for your plan') if user.lists.count >= plan.max_lists
    errors.add(:base, 'Max items reached for your plan') if user.user_items_count >= plan.max_items
  end
end
