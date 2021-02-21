json.task do
  json.id @task.id
  json.name @task.name
  json.desc @task.desc
  json.start @task.start
  json.end @task.end
  json.day @task.day
  json.text_color @task.text_color
  json.background_color @task.background_color
end