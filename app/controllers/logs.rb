get "/logs/new" do
  if logged_in?
    if council?
      @members = Member.all
      @members = @members.sort_by &:current_points
      @members.reverse!
      @bosses = Boss.all
      erb :"/new/log"
    else
      erb :index
    end
  else
    erb :login
  end
end

get '/logs' do
  if logged_in?
    @runs = Run.all
    @parties = Party.all
    erb :logs
  else
    erb :login
  end
end

post '/logs' do
  if params[:names]
    boss = Boss.where(name: params[:boss]).first
    item = Item.create(name: params[:item])
    drop = Drop.create(item_id: item.id, point_cost: 0)
    run = Run.create(boss_id: boss.id, drop_id: drop.id, date: params[:date], time: params[:time])

    params[:names].each do |user|
      object = Member.where(username: user)
      id = object.first.id
      value = object.first.current_points
      Party.create(run_id: run.id, member_id: id)
      if object.first.daily_point_bonus
        Member.update(id, current_points: (100 + value), daily_point_bonus: false)
      else
        Member.update(id, current_points: (10 + value))
      end
    end
    redirect '/'
  else
    erb :error
  end
end

