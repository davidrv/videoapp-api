class AccountController < ApplicationController
  before_action :authenticate_user!

  def upgrade
    plan = Plan.find(upgrade_params[:id])

    current_user.subscriptions.where(status: 'ACTIVE').each do |subscription|
      subscription.update!(status: 'INACTIVE')
    end

    current_user.subscriptions.create!(
      plan_id: plan.id,
      current_period_start: DateTime.now,
      current_period_end: DateTime.now + 1.year,
      amount: Money.new(plan.price, plan.currency)
    )

    redirect_to edit_user_registration_url, notice: "Upgrade completed!"
  end

  def upgrade_params
    params.require(:plan).permit(:id)
  end
end
