helpers do

  def points_valid
    (params[:points] && (params[:points].to_i >= 0))
  end

  def rank_exists
    params[:rank]
  end

  def update_member(member)
    if points_valid
      Member.update(member.id, current_points: params[:points])
      redirect "/"
    elsif rank_exists
      Member.update(member.id, rank: params[:rank])
      redirect "/"
    else
      redirect "/error"
    end
  end

end
