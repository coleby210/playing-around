require "bcrypt"

class Member < ActiveRecord::Base
  include BCrypt

  belongs_to :drop, foreign_key: "winner_id"
  has_one :drop
  validates :username, :uniqueness => true

  def self.create(hash = {})
    new_member = Member.new(hash)
    new_member.password = hash[:password_hash]
    new_member
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(member)
    @member = Member.find_by_username(user[:username])
    @user.password == user[:password]
  end
end
