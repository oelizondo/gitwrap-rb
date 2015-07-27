require 'json'
require 'open-uri'
require "gitwrap/version"
require "gitwrap/data_creator"

module Gitwrap
	class GithubConnection
		include DataCreator
		BASE_URL = "https://api.github.com/"
	end
end
