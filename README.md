# Gitwrap

Welcome to GitWrap! A simple client wrapper that interacts with the GitHub API. What does it do? It basically renders public data from Users, Repositories and Organizations. These include name, email, location, stars, etc. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gitwrap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gitwrap

## Usage

After installing the gem just include it in your gemfile and off you go!

The objects are generated automatically. They have a base url to connect to and retrieve data via the DataCreator module, which parses and returns corresponding obejcts to the method calls.

Each object method is listed here:

## Users
```
user = User.fetch_single_user(username)
user = User.fetch_all_users
```

## Orgs
```
org = Org.fetch_single_org(organization_name)
org = Org.fetch_all_orgs
```
## Repos
```
repos = Repo.fetch_user_repos(username)
repos = Repo.fetch_org_repos(organization_name)
repos = Repo.fetch_all_repos
repo = Repo.fetch_single_repo(repo_owner, repo_name)
```

Using the wrapper is simple. Just declare your new objects:
```
user = User.fetch_single_user(username)
```
And call the desired methods:
```
user.name
user.email
user.location
```

Each class (Users, Repos and Orgs) has their unique attributes.

Users have:

```
user.name
user.email
user.location
user.username
```
Organizations have: 

```
org.id
org.name
org.site
org.location
org.public_repos
org.followers
org.members
```

Repos have:
```
repo.name
repo.url
repo.language
repo.stars
```

It is worth noting that due to the Github API format, not all attributes are available to every method call. Such examples are included in the fetch.rb file.


## Contributing

1. Fork it!
2. Commit your changes.
3. Create a pull request.

##Current Version
Version 1.5.0

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

