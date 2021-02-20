json.data do

  json.calendar do
    json.id @calendar.id
    json.name @calendar.name
    json.slug @calendar.slug
    json.wake_hour @calendar.wake_hour
    json.sleep_hour @calendar.sleep_hour
    
  end

  json.tasks @calendar.tasks, :day, :name, :desc, :start, :end
  

end