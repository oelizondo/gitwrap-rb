# Gitwrap

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/gitwrap`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

After installing the gem just require the 'dependencies' file that wraps together the whole application and off you go!

The obejcts generated Automatically have a base url to connect to and retrieve data via the DataCreator module, which parses and returns corresponding obejcts to the method calls.

Each object method is listed here:

## User
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

Each class (Users, Repos and Orgs) has their unique attributes

User has:

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/oelizondo/gitwrap. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

