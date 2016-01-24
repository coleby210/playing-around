get '/' do
  if logged_in?
    @members = Member.all
    @members = @members.sort_by &:current_points
    @members.reverse!
    erb :index
  else
    erb :login
  end
end
