# ActiveRecord::Immutable

A tiny mixin to make your ActiveRecord models immutable after creation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-immutable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-immutable

## Usage

Include the `ActiveRecord::Immutable` module in your `ActiveRecord::Base`
class:

```ruby
class DomainEvent < ActiveRecord::Base
  include ActiveRecord::Immutable
end
```

You'll be allowed to create instances, but any attempt to update, touch, delete,
destroy, etc. will raise an `ActiveRecord::ReadOnlyRecord` exception.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/activerecord-immutable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
