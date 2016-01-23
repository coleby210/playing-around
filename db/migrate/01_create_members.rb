class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username, null: false
      t.string :password_hash, null: false
      t.string :rank, default: "Member"
      t.integer :current_points, default: 0
      t.boolean :daily_point_bonus, default: false

      t.timestamps
    end
  end
end
