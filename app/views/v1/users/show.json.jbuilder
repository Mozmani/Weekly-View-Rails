json.user do
  json.id = @user.id
end
  
  
json.calendars do

  json.array!(@user.calendars.order("id",)) do |calendar|
    
      json.calendar calendar.id
      json.name calendar.name
      json.slug calendar.slug
      json.wake_hour calendar.wake_hour
      json.sleep_hour calendar.sleep_hour

      json.tasks do
        json.array!(calendar.tasks.order("day", "start")) do |task|
          json.id task.id
          json.day task.day
          json.name task.name
          json.desc task.desc
          json.start task.start
          json.end task.end
        end  
      end
    
  end
end
  

  # json.tasks @calendar.tasks, :day, :name, :desc, :start, :end
  