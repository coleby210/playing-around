get '/boss_logs' do
  if logged_in?
    # @members = Member.all
    # @members = @members.sort_by &:current_points
    # @members.reverse!
    @runs = Run.all
    erb :boss_logs
  else
    erb :"/login"
  end
end
