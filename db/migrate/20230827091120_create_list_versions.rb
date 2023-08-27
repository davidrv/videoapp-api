class CreateListVersions < ActiveRecord::Migration[7.0]
  def change
    create_table :list_versions do |t|
      t.references :list, null: false, foreign_key: true
      t.string :name
      # will not track it for now as we'll not allow moving lists to another user
      # t.string :user

      t.timestamps
    end
  end
end
