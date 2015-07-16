module DataCreator
	$parsed_array = []

	def parse_data(url)
		data = open(url).read()
		data = JSON.parse(data)
	end

	def create_user(url)
		User.new(parse_data(url))
	end

	def create_many_users(url)
		data = parse_data(url)
		data.each {|user| $parsed_array << User.new(user) }
		$parsed_array
	end

	def create_org(url)
		Org.new(parse_data(url))
	end

	def create_many_orgs(url)
		data = parse_data(url)
		data.each { |org| $parsed_array << Org.new(org)}
		$parsed_array
	end

	def create_user_repos(url)
		data = parse_data(url)
		data.each { |repo| $parsed_array << Repo.new(repo)}
		$parsed_array
	end

	def create_org_repos(url)
		data = parse_data(url)
		data.each { |repo| $parsed_array << Repo.new(repo)}
		$parsed_array
	end

	def create_many_repos(url)
		data = parse_data(url)
		data.each { |repo| $parsed_array << Repo.new(repo)}
		$parsed_array
	end

	def create_single_repo(url)
		Repo.new(parse_data(url))
	end

end