get '/' do
  @points = Point.all
  erb :index
end

post '/' do
  params[:names].each do |user|
    object = Point.where(name: user)
    id = object[0].id
    value = object[0].value
    Point.update(id, value: (100 + value))
  end
  redirect '/'
end

post '/delete_all' do
  Point.delete(Point.all)
  redirect '/'
end

post '/add_member' do
  Point.create(name: params[:name], value: 100)
  redirect '/'
end
