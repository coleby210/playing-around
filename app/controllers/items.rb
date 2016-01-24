get '/items' do
  if logged_in?
    @members = Member.all
    @members = @members.sort_by &:current_points
    @members.reverse!
    @runs = Run.all
    erb :items
  else
    erb :login
  end
end

post "/items" do
  if council?
    member = Member.where(username: params[:member]).first
    points_value = member.current_points
    run = Run.find(params[:run_id])
    run.winner = member
    run.drop.point_cost = params[:points]
    run.save
    run.drop.save
    Member.update(member.id, current_points: (points_value - params[:points].to_i))
    redirect "/items"
  else
    redirect "/"
  end
end
