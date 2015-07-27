require "gitwrap/version"
require 'json'
require 'open-uri'

module Gitwrap
	class GithubConnection
		include DataCreator
		BASE_URL = "https://api.github.com/"
	end
end
