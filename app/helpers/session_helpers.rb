  helpers do

  def login(user)
    session[:id] = user.id
  end

  def logged_in?
    session[:id] != nil
  end

  def admin?
    if logged_in?
      user = Member.find(session[:id])
      user.rank == "Admin"
    else
      false
    end
  end

  def member?
    if logged_in?
      user = Member.find(session[:id])
      user.rank == "Admin" || user.rank == "Member" || user.rank == "Council"
    else
      false
    end
  end

  def council?
    if logged_in?
      user = Member.find(session[:id])
      user.rank == "Admin" || user.rank == "Council"
    else
      false
    end
  end

  def current_user
    @user ||= Member.find(session[:id]) if session[:id]
  end

  def logout!
    session[:id] = nil
    redirect "/"
  end
end
