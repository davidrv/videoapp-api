# frozen_string_literal: true
class AccountController < ApplicationController
  before_action :authenticate_user!

  def upgrade
    plan = Plan.find(upgrade_params[:id])
    Subscriptions::Updater.new(user: current_user, plan: plan).call
    redirect_to edit_user_registration_url, notice: "Upgrade completed, your new plan is now: #{plan.name}"
  rescue ActiveRecord::RecordInvalid => e
    redirect_to edit_user_registration_url, alert: e.record&.errors&.first&.full_message || e.message
  end

  def upgrade_params
    params.require(:plan).permit(:id)
  end
end
