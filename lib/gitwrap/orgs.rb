module Gitwrap
	class Org < OpenStruct

		current_org = 0
		orgs = []

		def self.fetch_single_org(organization, options = {})
			response = get("orgs/#{organization}", { query: options })
			if response.success? then org = new(response) else  raise_exception(response.code, response.body) end
		end

		def self.fetch_all_orgs(options = {})
			response = get("organizations?since=#{current_org}", {query: options})
			if response.success?
				response.each { |org| orgs << new(org)}
				current_org += response.length
				orgs
			else
				raise_exception(response.code, response.body)
			end
		end

	private
		def raise_exception(code, body)
			raise Gitwrap::Exception::ServerError.new(code, body) if code >= 500
			raise Gitwrap::Exception::ClientError.new(code, body) if code < 500
		end

	end
end
