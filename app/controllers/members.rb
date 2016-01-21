get '/' do
  @members = Member.all
  erb :index
end

post '/' do
  params[:names].each do |user|
    object = Member.where(username: user)
    id = object[0].id
    value = object[0].current_points
    Member.update(id, current_points: (100 + value))
  end
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
