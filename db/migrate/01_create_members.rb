class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :password
      t.string :rank
      t.integer :current_points
      t.boolean :daily_point_bonus, default: false

      t.timestamps
    end
  end
end
