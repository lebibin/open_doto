# OpenDoto 
[![Gem Version](https://badge.fury.io/rb/open_doto.svg)](https://badge.fury.io/rb/open_doto)
[![Build Status](https://travis-ci.org/lebibin/open_doto.svg?branch=master)](https://travis-ci.org/lebibin/open_doto)
[![Code Climate](https://codeclimate.com/github/lebibin/open_doto/badges/gpa.svg)](https://codeclimate.com/github/lebibin/open_doto)
[![Test Coverage](https://codeclimate.com/github/lebibin/open_doto/badges/coverage.svg)](https://codeclimate.com/github/lebibin/open_doto/coverage)

An unofficial Ruby gem for the [OpenDota API](https://www.opendota.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_doto'
```

And then execute:

$ bundle

Or install it yourself as:

$ gem install open_doto

## Usage

### OpenDoto::API::Player.method

- requires `account_id` string
- optional `opts` hash

method          | return
----------------|---------------------------------
**[.find](https://docs.opendota.com/#tag/players%2Fpaths%2F~1players~1%7Baccount_id%7D%2Fget)**        | [`OpenDoto::Player`](lib/open_doto/player.rb)
**[.wl](https://docs.opendota.com/#tag/players%2Fpaths%2F~1players~1%7Baccount_id%7D~1wl%2Fget)**          | [`OpenDoto::PlayerRecord`](lib/open_doto/player_record.rb)
**[.matches](https://docs.opendota.com/#tag/players%2Fpaths%2F~1players~1%7Baccount_id%7D~1matches%2Fget)**     | `Array<OpenDoto::Match>`
**[.heroes](https://docs.opendota.com/#tag/players%2Fpaths%2F~1players~1%7Baccount_id%7D~1heroes%2Fget)**      | `Array<OpenDoto::PlayerHero>`
**[.peers](https://docs.opendota.com/#tag/players%2Fpaths%2F~1players~1%7Baccount_id%7D~1peers%2Fget)**       | `Array<OpenDoto::Peer>`
**[.records](https://docs.opendota.com/#tag/players%2Fpaths%2F~1players~1%7Baccount_id%7D~1records%2Fget)**     | `Array<OpenDoto::Match>`
**[.wordcloud](https://docs.opendota.com/#tag/players%2Fpaths%2F~1players~1%7Baccount_id%7D~1wordcloud%2Fget)**   | `Array<OpenDoto::Word>`
**[.ratings](https://docs.opendota.com/#tag/players%2Fpaths%2F~1players~1%7Baccount_id%7D~1ratings%2Fget)**     | `Array<OpenDoto::PlayerRating>`
**[.rankings](https://docs.opendota.com/#tag/players%2Fpaths%2F~1players~1%7Baccount_id%7D~1rankings%2Fget)**    | `Array<OpenDoto::PlayerRanking>`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [github.com/lebibin/open_doto](https://github.com/lebibin/open_doto). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

