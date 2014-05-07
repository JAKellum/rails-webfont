class RemoveDescriptionFromPairs < ActiveRecord::Migration
  remove_column :pairs, :serious
  remove_column :pairs, :classical
  remove_column :pairs, :dramatic
end
