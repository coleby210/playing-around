get '/' do
  if logged_in?
    @members = Member.all
    @members = @members.sort_by &:current_points
    @members.reverse!
    erb :index
  else
    erb :"/login"
  end
end

post '/' do
  boss = Boss.where(name: params[:boss]).first
  puts boss
  item = Item.create(name: params[:item])
  winner = Member.where(username: params[:winner]).first

  drop = Drop.create(item_id: item.id, winner_id: winner.id, point_cost: params[:point_cost])
  puts drop

  run = Run.create(boss_id: boss.id, drop_id: drop.id, date: params[:date], time: params[:time])

  Member.update(winner.id, current_points: (winner.current_points - params[:point_cost].to_i))

  params[:names].each do |user|
    object = Member.where(username: user)
    id = object.first.id
    value = object.first.current_points
    Party.create(run_id: run.id, member_id: id)
    Member.update(id, current_points: (100 + value))
  end
  #Add logging functionality
  redirect '/'
end

post '/delete_all' do
  Member.delete(Member.all)
  redirect '/'
end

post '/add_member' do
  person = Member.create(username: params[:username].downcase, password_hash: params[:password], rank: params[:rank])
  person.save
  redirect '/'
end

post '/delete_member' do
  member = Member.where(username: params[:member])
  Member.delete(member)
  redirect '/'
end

post '/update_points' do
  member = Member.where(username: params[:member])
  id = member.first.id
  Member.update(id, current_points: params[:points])
  redirect '/'
end

post '/update_rank' do
  member = Member.where(username: params[:member])
  id = member.first.id
  Member.update(id, rank: params[:rank])
  redirect '/'
end
