class CreateCategorizedPostings < ActiveRecord::Migration
  def change
    create_table :categorized_postings do |t|
      t.references :post, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
