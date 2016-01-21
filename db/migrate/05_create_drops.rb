class CreateDrops < ActiveRecord::Migration
  def change
    create_table :drops do |t|
      t.integer :item_id
      t.integer :winner_id
      t.integer :point_cost

      t.timestamps
    end
  end
end
