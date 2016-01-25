class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user
      t.boolean :is_published

      t.timestamps null: false
    end
  end
end
