# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

admin_user = User.create([{:username => 'admin', :password => 'p'}])

5.times do 
	Item.create([{
		:name => Faker::Name.name, 
		:price => rand(1...100), 
		:published => true, 
		:short_desc => Faker::Lorem.sentences, 
		:long_desc => Faker::Lorem.paragraphs}
	])
end
