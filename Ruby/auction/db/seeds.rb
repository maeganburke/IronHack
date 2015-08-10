# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
	
user_info = [
	{name: 'Maegan', email: 'maegan.burke@gmail.com'},
	{name: 'Eliza', email: 'surfergirl02@yahoo.com'},
	{name: 'Maria', email: 'maria@whatsup.com'},
	[name: 'Gulio', email: 'italiano@italy.com']
]

user_info.each do |user_info|
	User.create!(user_info)
end

Product.destroy_all

product_info = [
	{title: 'New Stove', description: 'Here is a brand new stove for your cooking pleasure!'},
	{title: 'A Book', description: 'Read this amazing book!'},
	{title: 'My life', description: 'only a little ovre 20 years old!'}
]

product_info.each do |product_info|
	Product.create!(product_info)
end