$: << 'lib'
require 'gitwrap/data_creator'
require 'json'
require 'open-uri'

class GithubConnection
	include DataCreator
	BASE_URL = "https://api.github.com/"
end