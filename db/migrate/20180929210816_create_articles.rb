class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.datetime :published_at
      t.text :description
      t.integer :feed_id

      t.timestamps
    end
  end
end
