# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :plan_id, null: false, index: true
      t.references :user, null: false, foreign_key: true
      t.monetize :amount
      t.string :status, null: false, index: true
      t.boolean :cancel_at_period_end, null: false, default: false
      t.datetime :current_period_start, null: false
      t.datetime :current_period_end, null: false

      t.timestamps
    end
  end
end
