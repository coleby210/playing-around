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

  def get_run_ids(member)
    party = Party.where(member_id: member.id)
    run_ids = []
    party.each do |party|
      run_ids << party.run_id
    end
    return run_ids
  end

  def get_runs_array(ids_array)
    runs = []
    ids_array.each do |run_id|
      runs << Run.find(run_id)
    end
    runs = runs.sort_by(&:id).reverse
  end
end
