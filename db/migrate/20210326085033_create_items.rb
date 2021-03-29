class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :list, null: false, foreign_key: true
      t.boolean :available
      t.string :video_id
      t.string :provider
      t.string :title
      t.text :description
      t.integer :duration
      t.datetime :date
      t.string :thumbnail_small
      t.string :thumbnail_medium
      t.string :thumbnail_large
      t.string :embed_url
      t.text :embed_code
      t.string :author
      t.string :rauthor_thumbnail
      t.string :author_url
      t.text :keywords
      t.string :url

      t.timestamps
    end
  end
end
