# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :versions, class_name: 'ListVersion', dependent: :delete_all

  validates :user, presence: true
  validates :name, presence: true

  validate :list_limit_not_reached

  delegate :max_lists, to: :user
  delegate :max_items, to: :user
  delegate :user_items_count, to: :user

  after_update :save_version

  private

  def list_limit_not_reached
    return unless new_record?

    errors.add(:base, 'Max lists reached for your plan') if user.lists.count >= max_lists
  end

  def save_version
    versions.create!(name: name_was)
  end
end
