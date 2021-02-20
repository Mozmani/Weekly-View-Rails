class TaskValidator < ActiveModel::Validator
  def validate(task)
    if task.start.to_f < task.calendar.wake_hour.to_f || task.end.to_f > task.calendar.sleep_hour.to_f
      task.errors.add :name, " needs to be within calendar time!"
    end

    notValid = false
    theseDays = task.calendar.tasks.where(day: task.day)

    timeList =[]
    theseDays.each do |thisTask|
      #puts thisTask.start
      if !timeList.include? thisTask.start.to_f
        tempVal = thisTask.start.to_f
        while tempVal != thisTask.end.to_f do
          timeList.push(tempVal)
          tempVal += 0.5
        end
        
      end
    end

    if theseDays != nil
      (task.start.to_f..task.end.to_f).step(0.5) do |time|
        #puts time
        if timeList.include? time
          task.errors.add("invalid time!")
        end
      end
    end
    
    
     #puts timeList
     #puts task.start.to_f, task.calendar.wake_hour.to_f
     #puts task.calendar.tasks
  end
end