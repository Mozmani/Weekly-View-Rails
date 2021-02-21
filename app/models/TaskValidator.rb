class TaskValidator < ActiveModel::Validator
  def validate(task)
    
    if task.day.to_i < 1 || task.day.to_i > 7
      task.errors.add(:base, "You must choose a day withing Monday - Sunday. . . . Not sure how you got here, but be warned. . .  only trouble lies ahead young soldier.")
      
    end

    # If the task falls out side of calendar range add error refusr post
    if task.start.to_f < task.calendar.wake_hour.to_f || task.end.to_f > task.calendar.sleep_hour.to_f
      task.errors.add(:base, "Task does not fit in the calendar time frame.")
      return
    end

    
    # generate a list of tasks for the day of the task requested
    theseDays = task.calendar.tasks.where(day: task.day)
    timeList =[]
    
    # generate timelist array of all times for the given task day
    theseDays.each do |thisTask|
      
        if !timeList.include? thisTask.start.to_f
          tempVal = thisTask.start.to_f
          if thisTask.start == task.start
            next
          else
            while tempVal != thisTask.end.to_f do
              timeList.push(tempVal)
              tempVal += 0.5
            end
          end
        end
      
      
    end

    if theseDays != nil
      # loop through task time, if any of those times are blocked add error refuse post
      (task.start.to_f..task.end.to_f).step(0.5) do |time|
        if timeList.include? time
          task.errors.add(:base, "Time provided for task is already taken.")
          
          break
        end
      end
    end
    
  
  end
end