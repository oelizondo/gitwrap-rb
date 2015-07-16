$LOAD_PATH << '.'
require_relative 'data_creator.rb'

class GithubConnection
	include DataCreator
	BASE_URL = "https://api.github.com/"
end