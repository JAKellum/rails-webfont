class AddIndexToPairs < ActiveRecord::Migration
  def change
    add_index :pairs, [:headline_font, :body_font], :unique => true
  end
end
