require "faker"

10.times do
  Member.create(username: Faker::Internet.user_name, password: Faker::Internet.password(8), rank: "Member", current_points: 0)
end

Boss.create(name: "Behemoth")
Boss.create(name: "Demon Servant")
Boss.create(name: "Ocean Dragon")
