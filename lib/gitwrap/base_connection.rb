$: << 'lib'
require 'gitwrap/data_creator'

class GithubConnection
	include DataCreator
	BASE_URL = "https://api.github.com/"
end