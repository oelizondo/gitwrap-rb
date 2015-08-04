require 'gitwrap/error'

module Gitwrap
	class User < OpenStruct
		include HTTParty

		base_uri "https://api.github.com/users"

		current_id = 0
		users = []

		def self.fetch_single_user(username, options = {})
			response = get("/#{username}", {query: options})
			if response.success? then user = new(response) else raise_exception(response.code, response.body) end
		end

		def self.fetch_all_users(current_id, options = {})
			response = get("?since=#{current_id}", {query: options})
			puts response
			# if response.success?
			# 	response.each { |user| users << new(user)}
			# 	current_id += reponse.length
			# 	users
			# else
			# 	raise_exception(responde.code, response.body)
			# end
		end

		private

			def raise_exception(code, body)
				raise Gitwrap::Exception::ServerError.new(code, body) if code >=  500
				raise Gitwrap::Exception::ClientError.new(code, body) if core < 500
			end

	end
end