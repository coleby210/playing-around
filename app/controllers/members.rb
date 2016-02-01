get "/members/edit" do
  if logged_in?
    @members = Member.all
    @members = @members.sort_by &:current_points
    @members.reverse!
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
  person = Member.create(username: params[:username].downcase, password_hash: params[:password], rank: params[:rank])
  person.save
  redirect '/'
end

delete '/members/' do
  return (redirect "/error") unless admin?
  member = Member.where(username: params[:member])
  if member.first.id == 1
    redirect "/"
  else
    Member.delete(member)
    redirect '/'
  end
end

put '/members' do
  return (erb :error) unless admin?
  member = Member.where(username: params[:member])
  id = member.first.id
  if params[:points] && (params[:points].to_i >= 0)
    Member.update(id, current_points: params[:points])
    redirect "/"
  elsif params[:rank]
    Member.update(id, rank: params[:rank])
    redirect "/"
  else
    redirect "/error"
  end
end

get "/members/profile" do
  @member = Member.find(session[:id])
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
