class CalendarValidator < ActiveModel::Validator
 def validate(calendar)
   # generate eariest and latest task

  earlyTask = 24
  latestTask = 0
  default = false

  # Set task list
  taskList = calendar.tasks.where(calendar_id: calendar.id)
  
  # loop through each task to set earlyiest / lastest times
  taskList.each do |thisTask|
    if thisTask.start.to_f < earlyTask
      earlyTask = thisTask.start.to_f
      if default == false 
        default = true
      end
    end

    if thisTask.end.to_f > latestTask
      latestTask = thisTask.end.to_f
      if default == false 
        default = true
      end
    end
  
  end

  # if the calendar has tasks and is trying to be editied to not include all tasks, throw error.
  if default == true
    if calendar.wake_hour.to_f > earlyTask || calendar.sleep_hour.to_f < latestTask
      calendar.errors.add(:base, "I'm sorry, you have tasks that prevent this calendar swap, please remove or edit the conflicting tasks.")
      
    end
    
  end

  


 end
end