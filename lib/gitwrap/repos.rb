module Gitwrap
	class Repo < GithubConnection
		attr_reader :name, :url, :forks_count, :language, :stars
		$current_repo = 0
		$all_repos = []
		$all_org_repos = []

		def initialize(hash)
			@name = hash["name"]
			@url = hash["url"]
			@forks = hash["forks_count"]
			@language = hash["language"]
			@stars = hash["stargazers_count"]
		end

		def self.fetch_user_repos(username)
			data = open("#{BASE_URL}users/#{username}/repos").read()
			data = JSON.parse(data)
			repo = new(data)
		end

		def self.fetch_org_repos(org)
			data = open("#{BASE_URL}orgs/#{org}/repos").read()
			data = JSON.parse(data)
			data.each {|repo| $all_org_repos << new(repo) }
			$all_org_repos
		end

		def self.fetch_all_repos
			data = open("#{BASE_URL}repositories").read()
			data = JSON.parse(data)
			data.each { |repo| $all_repos << new(repo) }
			$current_repo += repos.length-1
			$all_repos
		end

		def self.fetch_single_repo(username, repo)
			data = open("#{BASE_URL}repos/#{username}/#{repo}").read()
			data = JSON.parse(data)
			repo = new(data)
		end
	end
end