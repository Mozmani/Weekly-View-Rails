# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(first_name: "Tester", last_name: "Personski", email:"testmcbest@gmail.com", password: "123456", password_confirmation:"123456" )

calendars = Calendar.create([

  {user_id: 1, wake_hour: 6, sleep_hour:20 ,name: "Early Rise"},
  {user_id: 1, wake_hour: 8.5, sleep_hour: 21,name: "Casual Try Hard"}
])

tasks = Task.create([
  {calendar_id: 1, name: "Make Breakfast", desc: "Let's do bacon and eggs today!", start:6.5 , end:7 , day:1 , text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 1, name: "Pre work prep", desc:"general prep for stuff" , start:7 , end:8 , day: 1, text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 1, name: "Work", desc:"working hard or am I?" , start:8.5 , end:17 , day:1 , text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 1, name: "Fun Stuff", desc:"Hey, it's not work!" , start:18 , end:20 , day:1 , text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 2, name: "Free Spot", desc:"You can do what ever you like, because you gave yourself the time!" , start: 14, end: 17.5 , day: 2, text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 2, name: "Fun Thing?", desc: "You would think this is fun, but my idea's are dry", start:12 , end:14 , day:2 , text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 2, name: "Making Dad Jokes", desc: "You told yourself you would stop, you were not able to though!", start: 18, end: 20, day: 2, text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 2, name: "Haha, I put this in last", desc:"This is the last seed, should be pulled first in day2" , start: 9, end: 8.5, day: 2, text_color:"black", background_color: "whitesmoke"}
 
  
])

tasks2 = Task.create([
  {calendar_id: 1, name: "Make Breakfast", desc: "Let's do bacon and eggs today!", start:6.5 , end:7 , day:2 , text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 1, name: "Pre work prep", desc:"general prep for stuff" , start:7 , end:8 , day: 2, text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 1, name: "Work", desc:"working hard or am I?" , start:8.5 , end:17 , day:2 , text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 1, name: "Fun Stuff", desc:"Hey, it's not work!" , start:18 , end:20 , day:2 , text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 2, name: "Free Spot", desc:"You can do what ever you like, because you gave yourself the time!" , start: 14, end: 17.5 , day: 1, text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 2, name: "Fun Thing?", desc: "You would think this is fun, but my idea's are dry", start:12 , end:14 , day:1 , text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 2, name: "Making Dad Jokes", desc: "You told yourself you would stop, you were not able to though!", start: 18, end: 20, day: 1, text_color:"black", background_color: "whitesmoke"},
  {calendar_id: 2, name: "Haha, I put this in last", desc:"This is the last seed, should be pulled first in day2" , start: 8.5, end: 9.5, day: 1, text_color:"black", background_color: "whitesmoke"}
])