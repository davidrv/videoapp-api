# frozen_string_literal: true

class AccountController < ApplicationController
  before_action :authenticate_user!

  def upgrade
    plan = Plan.find(upgrade_params[:id])

    desactivate_existing_subscriptions
    create_new_subcription(plan)

    redirect_to edit_user_registration_url, notice: 'Upgrade completed!'
  end

  def upgrade_params
    params.require(:plan).permit(:id)
  end

  private

  def desactivate_existing_subscriptions
    current_user.subscriptions.where(status: 'ACTIVE').each do |subscription|
      subscription.update!(status: 'INACTIVE')
    end
  end

  def create_new_subscription(plan)
    current_user.subscriptions.create!(
      plan_id: plan.id,
      current_period_start: DateTime.now,
      current_period_end: DateTime.now + 1.year,
      amount: Money.new(plan.price, plan.currency)
    )
  end
end
