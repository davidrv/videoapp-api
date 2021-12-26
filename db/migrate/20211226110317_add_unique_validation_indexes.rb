class AddUniqueValidationIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :items, [:url, :list_id], unique: true
    add_index :items, [:video_id, :list_id], unique: true
  end
end
