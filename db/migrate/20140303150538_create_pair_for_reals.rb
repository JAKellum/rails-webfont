class CreatePairForReals < ActiveRecord::Migration
  def change
    create_table :pair_for_reals do |t|
      t.string :hf
      t.string :hl
      t.string :bf
      t.string :bl
      t.string :c
      t.integer :s1
      t.integer :s2
      t.integer :s3

      t.timestamps
    end
  end
end
