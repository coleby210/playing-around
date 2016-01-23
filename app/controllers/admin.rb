get "/admin" do
  if logged_in?
    @members = Member.all
    @members = @members.sort_by &:current_points
    @members.reverse!
    if admin?
      erb :admin
    else
      erb :index
    end
  else
    erb :login
  end
end
