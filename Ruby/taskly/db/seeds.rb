# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

users_info = [
	{name: 'Maegan', email: 'maegan.burke@gmail.com'},
	{name: 'Jose', email: 'noway@jose.com'}

]

users_info.each do |user_info|
	User.create!(user_info)
end

# ------------------------------------------

Task.destroy_all

tasks_info = [
	{details: "get shit done", user_id: 4},
	{details: "wash your ass", user_id: 5}
]

tasks_info.each do |task_info|
	Task.create!(task_info)
end