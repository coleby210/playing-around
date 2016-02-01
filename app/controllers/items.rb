get '/items' do
  if logged_in?
    @members = Member.all.sort_by(&:current_points).reverse
    @runs = Run.all.sort_by(&:id).reverse
    erb :items
  else
    erb :login
  end
end

post "/items" do
  if council?
    member = Member.find(params[:member])
    points_value = member.current_points
    run = Run.find(params[:run_id])
    unless run.winner
      points_more_than_cost(member, run, points_value)
    else
      redirect "/error"
    end
  else
    redirect "/"
  end
end
