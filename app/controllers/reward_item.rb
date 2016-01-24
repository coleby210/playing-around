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
    member = Member.where(username: params[:member]).first
    points_value = member.current_points
    run = Run.find(params[:run_id])
    run.winner = member
    run.save
    Member.update(member.id, current_points: (points_value - params[:points].to_i))

    redirect "/reward_item"
  else
    erb :"/login"
  end
end
