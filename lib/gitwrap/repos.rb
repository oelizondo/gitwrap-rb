require 'gitwrap/error.rb'
require 'ostruct'
require 'httparty'

module Gitwrap
	class Repo < OpenStruct
		include HTTParty

		base_uri "https://api.github.com/"
		$repos = []

		def self.fetch_user_repos(username)
			$repos = []
			response = get("/users/#{username}/repos")
			if response.success?
				response = response.parsed_response
				response.each {|repo| $repos << new(repo)}
			else
				raise_exception(response.code, response.body)
			end
			$repos
		end

		def self.fetch_org_repos(org)
			response = get("/orgs/#{org}/repos")
			if response.success?
				response = response.parsed_response
				response.each {|repo| $repos << new(repo)}
			else
				raise_exception(response.code, response.body)
			end
			$repos
		end

		def self.fetch_all_repos(repo_id)
			response = get("/repositories?since#{repo_id}")
			if response.success?
				response = response.parsed_response
				response.each {|repo| $repos << new(repo)}
			else
				raise_exception(response.code, response.body)
			end
			$repos
		end

		def self.fetch_single_repo(username, repo)
			response = get("/repos/#{username}/#{repo}")
			if response.success? then repo = new(response) else raise_exception end
		end

		def self.fetch_repos_by_language(language)
			response = get("/search/repositories?q=language:#{language}&sort=stars&order=desc&per_page=100")
			if response.success?
				response = response["items"]
				response.each { |repo| $repos << new(repo)}
			else
				raise_exception(response.code, response.body)
			end
			$repos
		end

		private
			def raise_exception(code, body)
				raise Gitwrap::Exception::ServerError.new(code, body) if code >= 500
				raise Gitwrap::Exception::ClientError.new(code, body) if code < 500
			end
	end
end
