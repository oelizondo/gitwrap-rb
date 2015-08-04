module Gitwrap
	class Repo < OpenStruct
		include HTTParty

		base_uri "https://api.github.com/"

		current_repo = 0
		all_repos = []
		all_org_repos = []

		def self.fetch_user_repos(username, options = {})
			response = get("users/#{username}/repos", { query: options })
			if response.success? then response.each { |repo| all_repos << new(repo) } else raise_exception(response.code, response.body) end
			all_repos
		end

		def self.fetch_org_repos(org, options = {})
			response = get("orgs/#{org}/repos")
			if response.success? then response.each { |repo| all_org_repos << new(repo) } else raise_exception(response.code, response.body) end
			all_org_repos
		end

		def self.fetch_all_repos(options = {})
			response = get("repositories?since#{current_repo}", { query: options })
			if response.success? then response.each { |repo| all_repos << new(repo) } else raise_exception(response.code, response.body) end
			current_repo += 1
			all_repos  
		end

		def self.fetch_single_repo(username, repo, options = {})
			response = get("repos/#{username}/#{repo}", { query: options })
			if response.success? then repo = new(response) else raise_exception end
		end

		private
			def raise_exception(code, body)
				raise Gitwrap::Exception::ServerError.new(code, body) if code >= 500
				raise Gitwrap::Exception::ClientError.new(code, body) if code < 500
			end
	end
end