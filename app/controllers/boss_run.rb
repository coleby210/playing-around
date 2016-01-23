get "/boss_run" do
  if logged_in?
    @members = Member.all
    @members = @members.sort_by &:current_points
    @members.reverse!
    if council?
      @bosses = Boss.all
      erb :boss_run
    else
      erb :index
    end
  else
    erb :login
  end
end
