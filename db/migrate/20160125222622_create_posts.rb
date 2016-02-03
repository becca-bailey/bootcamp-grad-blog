class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :author
      t.references :category
      t.boolean :is_published, default: false
      t.boolean :is_featured, default: false
      t.timestamps null: false
    end
  end
end
