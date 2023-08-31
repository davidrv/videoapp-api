class CreateItemViews < ActiveRecord::Migration[7.0]
  def change
    create_table :item_views do |t|
      t.references :item, null: false, foreign_key: true
      t.datetime :time

      # t.timestamps
    end
  end
end
