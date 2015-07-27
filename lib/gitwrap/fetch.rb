# require 'json'
# require 'open-uri'
# require './base_connection.rb'
# # puts "Type user's username "
# # username = gets.chomp
# # puts '---------USERS--------'

# u = User.fetch_single_user('oelizondo')
# puts "Name: #{u.name}"
# puts "Email: #{u.email}"
# puts "Location: #{u.location}"
# puts "Username: #{u.username}"

# # puts '-----------------'

# # all_users = User.fetch_all_users()
# # all_users.each do |user|
# # 	puts "Username: #{user.username}"
# # end

# # puts '--------ORGS---------'

# # org = Org.fetch_single_org('IcaliaLabs')
# # puts "Name: #{org.name}"
# # puts "Site: #{org.site}"
# # puts "Location: #{org.location}"
# # puts "Public Repositories: #{org.public_repos}"
# # puts "Followers: #{org.followers}"
# # puts "Members: #{org.members}"

# # orgs = Org.fetch_all_orgs()
# # orgs.each do |org|
# # 	puts "Name: #{org.name}"
# # end

# # puts '--------REPOS---------'

# # repos = Repo.fetch_user_repos('oelizondo')
# # repos.each do |repo|
# # 	puts "Repository name: #{repo.name}"
# # end

# # puts '-----------------'

# # repos = Repo.fetch_org_repos('IcaliaLabs')
# # repos.each do |repo|
# # 	puts "Name: #{repo.name}"
# # 	puts "Language: #{repo.language}"
# # 	puts "Stars: #{repo.stars}"
# # end
# # puts '-----------------'

# # repos = Repo.fetch_all_repos()
# # repos.each do |repo|
# # 	puts "Name: #{repo.name}"
# # end

# # puts '-----------------'

# # repo = Repo.fetch_single_repo('oelizondo', 'Angular_1')
# # puts "Name: #{repo.name}"
# # puts "Language: #{repo.language}"
# # puts "Stars #{repo.stars}"
