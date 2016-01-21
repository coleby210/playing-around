class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :log_id
      t.integer :member_id

      t.timestamps
    end
  end
end
