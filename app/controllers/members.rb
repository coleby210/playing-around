post '/members' do
  member = Member.create(params[:member])
  if member.save
    login(member)
    redirect '/'
  else
    erb :new
  end
end
