class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :boss_id
      t.integer :drop_id
      t.string :time
      t.string :date

      t.timestamps
    end
  end
end
