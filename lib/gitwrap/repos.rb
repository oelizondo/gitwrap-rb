class Repo < GithubConnection
	attr_accessor :name, :url, :forks_count, :language, :stars
	$current_repo = 0

	def initialize(hash)
		@name = hash["name"]
		@url = hash["url"]
		@forks = hash["forks_count"]
		@language = hash["language"]
		@stars = hash["stargazers_count"]
	end

	def self.fetch_user_repos(username)
		repo = Repo.new({}).create_user_repos("#{BASE_URL}users/#{username}/repos")
	end

	def self.fetch_org_repos(org)
		repos = Repo.new({}).create_org_repos("#{BASE_URL}orgs/#{org}/repos")
	end

	def self.fetch_all_repos
		repos = Repo.new({}).create_many_repos("#{BASE_URL}repositories")
		$current_repo += repos.length-1
		repos
	end

	def self.fetch_single_repo(username, repo)
		repo = Repo.new({}).create_single_repo("#{BASE_URL}repos/#{username}/#{repo}")
	end
end