$: << 'lib'
require 'gitwrap/base_connection.rb'

module Gitwrap
	class User < GithubConnection
		attr_accessor :name, :location, :email, :username
		$current_id = 0

		def initialize(hash)
			@name = hash['name']
			@location = hash['location']
			@email = hash['email']
			@username = hash['login']
		end

		def self.fetch_single_user(username)
			user = User.new({}).create_user("#{BASE_URL}users/#{username}")
		end

		def self.fetch_all_users
			$all_users = User.new({}).create_many_users("#{BASE_URL}users?since=#{$current_id}")
			$current_id += $all_users.length-1
			$all_users
		end
	end
end