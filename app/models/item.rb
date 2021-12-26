# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :list
  has_one :user, through: :list

  validates :url, presence: true, uniqueness: { scope: :list }
  validates :video_id, presence: true, uniqueness: { scope: :list }
  validates :title, presence: true
  validates :embed_url, presence: true

  validate :items_limit_not_reached

  delegate :max_items, to: :list
  delegate :user_items_count, to: :list

  private

  def items_limit_not_reached
    errors.add(:base, 'max items reached for your plan') if user_items_count >= max_items
  end
end
