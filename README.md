# Hooke

Links your git hooks from your repository. 
With this gem, you can commit and share git hooks as part of your repository

[![Dependency Status](https://gemnasium.com/badges/github.com/ramkumar-kr/hooke.svg)](https://gemnasium.com/github.com/ramkumar-kr/hooke)
[![Build Status](https://travis-ci.org/ramkumar-kr/hooke.svg?branch=master)](https://travis-ci.org/ramkumar-kr/hooke) 
## Requirements

To ensure that the gem installs and works properly, you need

- `bundler` with version >1.15
- `git` installed on your system
- `.git` directory in your repository root path
- `git_hooks` directory in your repository root path

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hooke'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hooke

## Usage

The hooks are linked using a symbolic link after installing the gem.


## Example

This project itself is a good example on using the gem.

A pre-commit hook is added which runs the linter and tests and can be found in the `git_hooks` directory


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ramkumar-kr/hooke.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

