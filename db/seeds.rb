require "faker"

10.times do
  you = Member.create({username: Faker::Internet.user_name, password_hash: Faker::Internet.password(8)})
  you.save
end

Boss.create(name: "Behemoth")
Boss.create(name: "Demon Servant")
Boss.create(name: "Ocean Dragon")
