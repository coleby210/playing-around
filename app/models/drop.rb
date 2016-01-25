class Drop < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :winner, class_name: "Member"
  belongs_to :item

  validates :point_cost, numericality: { greater_than_or_equal_to: 0 }

end
