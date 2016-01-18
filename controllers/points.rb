get '/' do
  @points = Point.all
  erb :index
end

post '/' do
  if Point.exists?(name: params[:name])
    object = Point.where(name: params[:name])
    id = object[0].id
    Point.update(id, value: params[:value])
  else
    Point.create(name: params[:name], value: params[:value])
  end
  redirect '/'
end

post '/delete_all' do
  Point.delete(Point.all)
  redirect '/'
end