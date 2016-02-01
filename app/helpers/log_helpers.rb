helpers do
  def member_update(member)
    if member.daily_point_bonus
      Member.update(member.id, current_points: (100 + member.current_points), daily_point_bonus: false)
    else
      Member.update(member.id, current_points: (10 + member.current_points))
    end
  end

  def create_run
    boss = Boss.find(params[:boss])
    item = Item.create(name: params[:item])
    drop = Drop.create(item_id: item.id, point_cost: 0)
    return Run.create(boss_id: boss.id, drop_id: drop.id, date: params[:date], time: params[:time])
  end

  def each_user(run)
    params[:names].each do |user_id|
      member = Member.find(user_id.to_i)
      Party.create(run_id: run, member_id: member.id)
      member_update(member)
    end
  end

  def winner_exists(run)
    if (params[:winner] != "")
      winner = Member.where(username: params[:winner].downcase)[0]
      if winner
        run.drop.winner_id = winner.id
        run.drop.save
      else
        redirect "/error"
      end
    end
  end

  def item_exists(run)
    if (params[:item] != "")
      run.item.name = params[:item]
      run.item.save
    end
  end

end
