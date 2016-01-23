get '/' do
  @members = Member.all
  @members = @members.sort_by &:current_points
  @members.reverse!
  @bosses = Boss.all
  erb :index
end

post '/' do
  boss = Boss.where(name: params[:boss])
  params[:names].each do |user|
    object = Member.where(username: user)
    id = object.first.id
    value = object.first.current_points
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
  Member.create(username: params[:name], current_points: 0)
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
