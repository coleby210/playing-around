class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :boss_id
      t.integer :drop_id
      t.datetime :time_killed

      t.timestamps
    end
  end
end
