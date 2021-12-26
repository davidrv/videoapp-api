# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :subscriptions, dependent: :destroy
  has_many :lists, dependent: :destroy

  delegate :max_lists, to: :plan
  delegate :max_items, to: :plan

  def plan
    subscriptions.where(status: 'ACTIVE').order(created_at: :desc).first.try(:plan) || Plan::FREE
  end

  def user_items_count
    Item.joins(:list).where(lists: { user: self }).count
  end
end
