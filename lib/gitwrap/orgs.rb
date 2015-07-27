module Gitwrap
	class Org < GithubConnection
		attr_reader :name, :site, :location, :public_repos, :followers, :members, :id
		$current_org = 0
		$all_orgs = []

		def initialize(hash)
			@id = hash["id"]
			@name = hash["login"]
			@site = hash["blog"]
			@location = hash["location"]
			@public_repos = hash["public_repos"]
			@followers = hash["followers"]
			@members = hash["members"]
		end

		def self.fetch_single_org(organization)
			data = open("#{BASE_URL}orgs/#{organization}").open()
			data = JSON.parse(data)
			org = new(data)
		end

		def self.fetch_all_orgs
			data = open("#{BASE_URL}organizations?since=#{$current_org}").read()
			data = JSON.parse(data)
			data.each {|org| $all_orgs << new(org)}
			$current_org += orgs.length-1
			$all_orgs
		end
	end
end