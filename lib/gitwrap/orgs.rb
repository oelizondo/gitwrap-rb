$: << 'lib'
require 'gitwrap/base_connection.rb'

module Gitwrap
	class Org < GithubConnection
		attr_accessor :name, :site, :location, :public_repos, :followers, :members, :id
		$current_org = 0

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
			org = Org.new({}).create_org("#{BASE_URL}orgs/#{organization}")
		end

		def self.fetch_all_orgs
			orgs = Org.new({}).create_many_orgs("#{BASE_URL}organizations?since=#{$current_org}")
			$current_org += orgs.length-1
			orgs
		end
	end
end