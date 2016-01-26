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
  person = Member.create(username: params[:username].downcase, password_hash: params[:password], rank: params[:rank])
  person.save
  redirect '/'
end

delete '/members/' do
  member = Member.where(username: params[:member])
  if member.first.id == 1
    redirect "/"
  else
    Member.delete(member)
    redirect '/'
  end
end

put '/members/update' do
  member = Member.where(username: params[:member])
  id = member.first.id
  if params[:points] && (params[:points].to_i >= 0)
    Member.update(id, current_points: params[:points])
    redirect "/"
  elsif params[:rank]
    Member.update(id, rank: params[:rank])
    redirect "/"
  else
    erb :error
  end
end
