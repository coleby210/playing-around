get "/members/edit" do
  if logged_in?
    @members = Member.all.sort_by(&:current_points).reverse
    if admin?
      erb :admin
    else
      erb :index
    end
  else
    erb :login
  end
end

post '/members' do
  return (redirect "/error") unless admin?
  member = Member.create(username: params[:username].downcase, password_hash: params[:password], rank: params[:rank])
  if member.save
    redirect '/'
  else
    redirect "/error"
  end
end

delete '/members/' do
  return (redirect "/error") unless admin?
  if params[:member].to_i == 1
    redirect "/error"
  else
    if Member.delete(params[:member])
      redirect "/"
    else
      redirect "/error"
    end
  end
end

put '/members' do
  return (erb :error) unless admin?
  member = Member.find(params[:member].to_i)
  update_member(member)
end

get "/members/profile" do
  @member = Member.find(session[:id])
  @parties = Party.all
  if (Party.where(member_id: member.id).length > 0)
    @run_ids = get_run_ids(@member)
    @runs = get_runs_array(@run_ids)
  end
  erb :profile
end

post "/members/password_change" do
  @member = Member.find(session[:id])
  @member.password = params[:new_password]
  if @member.save
    redirect "/"
  else
    redirect "/error"
  end
end
