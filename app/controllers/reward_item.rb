get '/reward_item' do
  if logged_in?
    @members = Member.all
    @members = @members.sort_by &:current_points
    @members.reverse!
    @runs = Run.all
    erb :reward_item
  else
    erb :"/login"
  end
end

post "/reward_item" do
  if council?
    member = Member.where(username: params[:member])
    run = Run.find(params[:run_id])
    run.winner = member.first
    run.save
    redirect "/reward_item"
  else
    erb :"/login"
  end
end
