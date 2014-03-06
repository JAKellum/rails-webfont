class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.string :headline_font
      t.string :headline_link
      t.string :body_font
      t.string :body_link
      t.integer :slider1
      t.integer :slider2
      t.integer :slider3
      t.integer :category_id
      t.timestamps

      add_index :unique_pairs, [:headline_font, :body_font], :unique => true
    end
  end
end
