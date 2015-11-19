# Square Connect API

[![Gem Version](https://badge.fury.io/rb/square-ruby.svg)](https://badge.fury.io/rb/square-ruby) [![Code Climate](https://codeclimate.com/github/giantmachines/square-ruby/badges/gpa.svg)](https://codeclimate.com/github/giantmachines/square-ruby) [![Test Coverage](https://codeclimate.com/github/giantmachines/square-ruby/badges/coverage.svg)](https://codeclimate.com/github/giantmachines/square-ruby/coverage) [![Build Status](https://travis-ci.org/giantmachines/square-ruby.svg?branch=master)](https://travis-ci.org/giantmachines/square-ruby)

The Square Connect API gem provides access to the Square Connect API.

TODO:

- [ ] Update RestClient.
- [ ] Add all data types.  
- [ ] Add all API resources.
- [ ] OAuth.
- [x] Batching.
- [x] Handle multi location.
- [ ] Employee management.
- [ ] Register API?

## Documentation

[Square Connect](https://docs.connect.squareup.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'square-ruby', require: 'square'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install square-ruby

## Usage

TODO

...but quickly, use one of the methods on one of the `APIResource` subclasses, e.g.

`items = Square::Item.list`

You'll now have an array of `Square::DataType::Item`s.

#### Paging

Paging only works for `APIResource#list`.

```ruby
resp = Square::Payment.list({limit: 10})
resp.each {|p| puts p.id }

puts "got #{resp.count}. getting more"

while resp.has_more?
  puts "has more"
  more = resp.more
  more.each {|p| puts p.id }
end

puts 'done'
```

## Development

TODO

## Contributing

TODO
