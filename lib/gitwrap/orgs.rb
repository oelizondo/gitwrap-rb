require 'gitwrap/error.rb'

module Gitwrap
	class Org < OpenStruct
		include HTTParty

		base_uri "https://api.github.com/"
		$orgs = []

		def self.fetch_single_org(organization)
			response = get("/orgs/#{organization}")
			if response.success? then org = new(response) else  raise_exception(response.code, response.body) end
		end

		def self.fetch_all_orgs(org_id)
			response = get("/organizations?since=#{org_id}&per_page=100")
			if response.success?
				response = response.parsed_response
				response.each { |org| $orgs << new(org)}
				$orgs
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
