class Run < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :boss
  belongs_to :drop
  has_one :winner, through: :drop, class_name: "Member"
  has_one :item, through: :drop
end
