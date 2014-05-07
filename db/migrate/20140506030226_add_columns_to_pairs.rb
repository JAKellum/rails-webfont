class AddColumnsToPairs < ActiveRecord::Migration
  def change
    add_column :pairs, :playful, :boolean
    add_column :pairs, :light, :boolean
    add_column :pairs, :modern, :boolean
  end
end
