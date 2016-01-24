get '/reward_item' do
  if logged_in?
    # @members = Member.all
    # @members = @members.sort_by &:current_points
    # @members.reverse!
    @runs = Run.all
    erb :reward_item
  else
    erb :"/login"
  end
end
