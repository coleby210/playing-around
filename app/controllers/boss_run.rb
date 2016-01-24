get "/boss_run" do
  if logged_in?
    if council?
      @members = Member.all
      @members = @members.sort_by &:current_points
      @members.reverse!
      @bosses = Boss.all
      erb :boss_run
    else
      erb :index
    end
  else
    erb :login
  end
end
