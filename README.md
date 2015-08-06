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

The objects are generated automatically. They have a base url to connect to and retrieve data via the DataCreator module, which parses and returns corresponding objects to the method calls.

Each object method is listed here:

## Users
```
user = Gitwrap::User::fetch_single_user(username)
users = Gitwrap::User::fetch_all_users(since_id)
users = Gitwrap::User::fetch_users_by_location(location)
users = Gitwrap::User::fetch_users_by_language(language)
users = Gitwrap::User::fetch_users_by_location_and_language(location, language)
```

## Orgs
```
org = Gitwrap::Org::fetch_single_org(organization_name)
org = Gitwrap::Org::fetch_all_orgs(since_id)
```
## Repos
```
repos = Gitwrap::Repo::fetch_user_repos(username)
repos = Gitwrap::Repo::fetch_org_repos(organization_name)
repos = Gitwrap::Repo::fetch_all_repos(since_id)
repo = Gitwrap::Repo::fetch_single_repo(repo_owner, repo_name)
repos = Gitwrap::Repo::fetch_repos_by_language(language)
```

Using the wrapper is simple. Just declare your new objects:
```
user = Gitwrap::User::fetch_single_user(username)
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
user...
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
org...
```

Repos have:
```
repo.name
repo.url
repo.language
repo.stars
repo...
```

It is worth noting that due to the Github API format, not all attributes are available to every method call.

## Contributing

1. Fork it!
2. Commit your changes.
3. Create a pull request!

##Heroes

###Oscar Elizondo

* http://twitter.com/oehinojosa
* http://github.com/oelizondo

##Current Version
Version 2.5.0

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
