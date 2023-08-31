module Subscriptions
  class Updater
    attr_reader :user, :plan

    def initialize(user:, plan:)
      @user = user
      @plan = plan
    end

    def call
      Subscription.transaction do
        desactivate_existing_subscriptions
        create_new_subscription(plan)
      end
    end

    private

    def desactivate_existing_subscriptions
      user.subscriptions.where(status: 'ACTIVE').each do |subscription|
        subscription.update!(status: 'INACTIVE')
      end
    end

    def create_new_subscription(plan)
      user.subscriptions.create!(
        plan_id: plan.id,
        current_period_start: DateTime.now,
        current_period_end: DateTime.now + 1.year,
        amount: Money.new(plan.price, plan.currency)
      )
    end
  end
end
