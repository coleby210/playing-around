helpers do
  def run_save(member, run, points_value)
    if run.save && run.drop.save
      Member.update(member.id, current_points: (points_value - params[:points].to_i))
      redirect "/items"
    else
      redirect "/error"
    end
  end

  def points_more_than_cost(member, run, points_value)
    if points_value >= params[:points].to_i
      run.winner = member
      run.drop.point_cost = params[:points]
      run_save(member, run, points_value)
    else
      redirect "/error"
    end
  end
end
