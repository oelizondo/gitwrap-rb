module Gitwrap
	class User < GithubConnection
		attr_reader :name, :location, :email, :username
		$current_id = 0
		$all_users = []

		def initialize(hash={})
			@name = hash['name']
			@location = hash['location']
			@email = hash['email']
			@username = hash['login']
		end

		def self.fetch_single_user(username)
			data = open("#{BASE_URL}users/#{username}").read()
			data = JSON.parse(data)
			user = new(data)
		end

		def self.fetch_all_users
			data = open("#{BASE_URL}users?since=#{$current_id}").read()
			data = JSON.parse(data)
			data.each {|user| $all_users << new(user)}
			$current_id += $all_users.length-1
			$all_users
		end
	end
end