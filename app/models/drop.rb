class Drop < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :winner, class_name: "Member"
  belongs_to :item
end
