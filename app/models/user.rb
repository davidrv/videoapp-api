class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :subscriptions, dependent: :destroy

  after_create :create_default_subscription

  def plan
    subscriptions.where(status: "ACTIVE").order(created_at: :desc).first.try(:plan)
  rescue
    Rails.logger.warn "[WARNING] The user #{user.email} has no active subscription!"
    Plan::FREE
  end

  private

  def create_default_subscription
    subscriptions.create!
  end
end
