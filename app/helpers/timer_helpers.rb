helpers do
  def get_spawn_time(run, kill_time)
    if run.boss_id == 1
      spawn_time = kill_time + 3*60*60
    elsif run.boss_id == 2
      spawn_time = kill_time + 32*60*60
    else
      spawn_time = kill_time + 24*60*60
    end
    return spawn_time
  end

  def get_message(run, hours)
    if run.boss_id == 1
      if hours < (-3)
        return "Might have been killed"
      else
        return "t"
      end
    elsif run.boss_id == 2
      if hours < (-26)
        return "Might have been killed"
      else
        return "t"
      end
    else
      if hours < (-6)
        return "Might have been killed"
      else
        return "t"
      end
    end
  end
end
