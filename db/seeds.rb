# require "faker"

# 10.times do
#   you = Member.create({username: Faker::Internet.user_name, password_hash: Faker::Internet.password(8)})
#   you.save
# end

you = Member.create(username: "cole", password_hash: "lol", rank: "Admin")
you.save

Boss.create(name: "Mountain Behemoth")
Boss.create(name: "Demon Servant")
Boss.create(name: "Ocean Dragon")
Boss.create(name: "Ogre Master")
Boss.create(name: "Baphomat")
Boss.create(name: "Manticore")
Boss.create(name: "Bone Drake")
Boss.create(name: "Eragon (Dragon)")
Boss.create(name: "Minotaur Master")
