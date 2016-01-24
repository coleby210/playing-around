get "/sessions/new" do
  erb :login
end

post "/sessions" do
  member = Member.find_by(username: params[:user][:username].downcase)
  if member && member.password == params[:user][:password]
    login(member)
    redirect "/"
  else
    erb :login
  end
end

get "/logout" do
  logout!
end

get "/session-viewer" do
  session.inspect
end
