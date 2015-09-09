require 'gitwrap/error'
require 'ostruct'
require 'httparty'

module Gitwrap
	class User < OpenStruct
		include HTTParty

		base_uri "https://api.github.com/"
		$users = []

		def self.fetch_single_user(username)
			response = get("/users/#{username}")
			if response.success? then user = new(response) else raise_exception(response.code, response.body) end
		end

		def self.fetch_all_users(id)
			response = get("/users?since=#{id}")
			if response.success?
				response = response.parsed_response
				response.each { |user| $users << new(user) }
			else
				raise_exception(response.code, response.body)
			end
			$users
		end

		def self.fetch_users_by_language(language)
			response = get("/search/users?q=language:#{language}&per_page=100")
			if response.success?
				response = response["items"]
				response.each {|user| $users << new(user)}
			else
				raise_exception(response.code, response.body)
			end
			$users
		end

		def self.fetch_users_by_location(location)
			response = get("/search/users?q=location:#{location}&per_page=100")
			if response.success?
				response = response["items"]
				response.each { |user| $users << new(user) }
			else
				raise_exception(response.code, response.body)
			end
			$users
		end

		def self.fetch_users_by_location_and_language(location, language)
			response = get("/search/users?q=location:#{location}+language:#{language}&per_page=100")
			if response.success?
				response = response["items"]
				response.each { |user| $users << new(user) }
			else
				raise_exception(response.code, response.body)
			end
			$users
		end

		private

			def raise_exception(code, body)
				raise Gitwrap::Exception::ServerError.new(code, body) if code >=  500
				raise Gitwrap::Exception::ClientError.new(code, body) if code < 500
			end

	end
end
