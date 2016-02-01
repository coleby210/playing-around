get "/logs/new" do
  if logged_in?
    if council?
      @members = Member.all.sort_by(&:current_points).reverse
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
    @runs = Run.all.to_a.sort_by(&:id).reverse
    @parties = Party.all
    erb :logs
  else
    erb :login
  end
end

post '/logs' do
  if council?
    if params[:names]
      run = create_run
      each_user(run.id)
      redirect '/'
    else
      redirect "/error"
    end
  else
    redirect "/"
  end
end

put "/logs" do
  if admin?
    run = Run.find(params[:id])
    Run.update(params[:id], date: params[:date], time: params[:time])
    item_exists(run)
    winner_exists(run)
    redirect "/logs"
  else
    redirect "/"
  end
end

get "/logs/edit/:id" do
  if admin?
    if params[:id]
      @run = Run.find(params[:id])
    end
    erb :"/partials/logs/_edit-log", layout: false
  else
    redirect "/"
  end
end

