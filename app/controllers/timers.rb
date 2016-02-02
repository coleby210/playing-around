get "/timers" do
  if logged_in?
    counter = 1
    @bosses = {}
    9.times do
      if Run.where(boss_id: counter).last
        run = Run.where(boss_id: counter).last
        date = run.date.split("-")
        time = run.time.split(":") << "0" << "+00:00"
        kill_time = Time.new(date[0], date[1], date[2], time[0], time[1], time[2], time[3])
        spawn_time = get_spawn_time(run, kill_time)
        hours = ((spawn_time - Time.now) / 3600).to_i
        minutes = (((spawn_time - Time.now) % 3600) / 60).to_i
        if hours >= 0
          @bosses[run.boss.name] = [hours, minutes]
        else
          @bosses[run.boss.name] = get_message(run, hours)
        end
      end
      counter += 1
    end
    @bosses = @bosses.sort_by {|boss, message| message.length}
    erb :timers
  else
    erb :login
  end
end
