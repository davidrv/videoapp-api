class Subscription < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
  validates :plan_id, presence: true, inclusion: { in: Plan.active }
  validates :current_period_start, presence: true
  validates :current_period_end, presence: true
  validates :amount_cents, presence: true
  validates :amount_currency, presence: true

  before_validation :set_default_values, on: :create

  monetize :amount_cents

  def plan
    "Plan::#{plan_id}".safe_constantize
  end

  private

  def set_default_values
    self.plan_id              = "FREE"
    self.status               = "ACTIVE"
    self.current_period_start = DateTime.now
    self.current_period_end   = DateTime.now + 1.year

    return unless plan
    self.amount = Money.new(plan.price, plan.currency)
  end
end
